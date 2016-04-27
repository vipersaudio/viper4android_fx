
package com.vipercn.viper4android_v2.preference;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Shader;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.SurfaceView;

import com.vipercn.viper4android_v2.R;

public class EqualizerSurface extends SurfaceView {
    private static final int MIN_FREQ = 10;
    private static final int MAX_FREQ = 21000;
    public static final int MIN_DB = -12;
    public static final int MAX_DB = 12;
    private static final int SAMPLING_RATE = 44100;

    private int mWidth;
    private int mHeight;

    private float[] mLevels = new float[10];
    private final Paint mWhite, mGridLines, mControlBarText, mControlBar, mControlBarKnob;
    private final Paint mFrequencyResponseBg;
    private final Paint mFrequencyResponseHighlight, mFrequencyResponseHighlight2;

    public EqualizerSurface(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setWillNotDraw(false);

        mWhite = new Paint();
        mWhite.setColor(getResources().getColor(R.color.white));
        mWhite.setStyle(Style.STROKE);
        mWhite.setTextSize(13);
        mWhite.setAntiAlias(true);

        mGridLines = new Paint();
        mGridLines.setColor(getResources().getColor(R.color.grid_lines));
        mGridLines.setStyle(Style.STROKE);

        mControlBarText = new Paint(mWhite);
        mControlBarText.setTextAlign(Paint.Align.CENTER);
        mControlBarText.setShadowLayer(2, 0, 0, getResources().getColor(R.color.cb));

        mControlBar = new Paint();
        mControlBar.setStyle(Style.STROKE);
        mControlBar.setColor(getResources().getColor(R.color.cb));
        mControlBar.setAntiAlias(true);
        mControlBar.setStrokeCap(Cap.ROUND);
        mControlBar.setShadowLayer(2, 0, 0, getResources().getColor(R.color.black));

        mControlBarKnob = new Paint();
        mControlBarKnob.setStyle(Style.FILL);
        mControlBarKnob.setColor(getResources().getColor(R.color.white));
        mControlBarKnob.setAntiAlias(true);

        mFrequencyResponseBg = new Paint();
        mFrequencyResponseBg.setStyle(Style.FILL);
        mFrequencyResponseBg.setAntiAlias(true);

        mFrequencyResponseHighlight = new Paint();
        mFrequencyResponseHighlight.setStyle(Style.STROKE);
        mFrequencyResponseHighlight.setStrokeWidth(6);
        mFrequencyResponseHighlight.setColor(getResources().getColor(R.color.freq_hl));
        mFrequencyResponseHighlight.setAntiAlias(true);

        mFrequencyResponseHighlight2 = new Paint();
        mFrequencyResponseHighlight2.setStyle(Style.STROKE);
        mFrequencyResponseHighlight2.setStrokeWidth(3);
        mFrequencyResponseHighlight2.setColor(getResources().getColor(R.color.freq_hl2));
        mFrequencyResponseHighlight2.setAntiAlias(true);
    }

    @Override
    protected Parcelable onSaveInstanceState() {
        Bundle b = new Bundle();
        b.putParcelable("super", super.onSaveInstanceState());
        b.putFloatArray("levels", mLevels);
        return b;
    }

    @Override
    protected void onRestoreInstanceState(Parcelable p) {
        Bundle b = (Bundle) p;
        super.onRestoreInstanceState(b.getBundle("super"));
        mLevels = b.getFloatArray("levels");
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        setLayerType(LAYER_TYPE_HARDWARE, null);
        buildLayer();
    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);

        final Resources res = getResources();
        mWidth = right - left;
        mHeight = bottom - top;

        float barWidth = res.getDimension(R.dimen.bar_width);
        mControlBar.setStrokeWidth(barWidth);
        mControlBarKnob.setShadowLayer(barWidth * 0.5f, 0, 0, res.getColor(R.color.off_white));

        /**
         * red > +7
         * yellow > +3
         * holo_blue_bright > 0
         * holo_blue < 0
         * holo_blue_dark < 3
         */
        int[] responseColors = {
            res.getColor(R.color.eq_red),
            res.getColor(R.color.eq_yellow),
            res.getColor(R.color.eq_holo_bright),
            res.getColor(R.color.eq_holo_blue),
            res.getColor(R.color.eq_holo_dark)
        };
        float[] responsePositions = {
            0, 0.2f, 0.45f, 0.6f, 1f
        };

        mFrequencyResponseBg.setShader(new LinearGradient(0, 0, 0, mHeight,
                responseColors, responsePositions, Shader.TileMode.CLAMP));

        int[] barColors = {
            res.getColor(R.color.cb_shader),
            res.getColor(R.color.cb_shader_alpha)
        };
        float[] barPositions = {
            0, 1
        };

        mControlBar.setShader(new LinearGradient(0, 0, 0, mHeight,
                barColors, barPositions, Shader.TileMode.CLAMP));
    }

    public void setBand(int i, float value) {
        mLevels[i] = value;
        postInvalidate();
    }

    public float getBand(int i) {
        return mLevels[i];
    }

    @Override
    protected void onDraw(Canvas canvas) {
        /* clear canvas */
        canvas.drawRGB(0, 0, 0);

        Biquad[] biquads = {
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad(),
            new Biquad()
        };

        /*
         * The filtering is realized with 2nd order high shelf filters, and each
         * band is realized as a transition relative to the previous band. The
         * center point for each filter is actually between the bands. 1st band
         * has no previous band, so it's just a fixed gain.
         */
        double gain = Math.pow(10, mLevels[0] / 20);
        for (int i = 0; i < biquads.length; i++) {
            double freq = 15.625 * Math.pow(2, i+1);
            biquads[i].setHighShelf(freq * 2, SAMPLING_RATE, mLevels[i + 1] - mLevels[i]);
        }

        Path freqResponse = new Path();
        for (int i = 0; i < 71; i ++) {
            double freq = reverseProjectX(i / 70f);
            double omega = freq / SAMPLING_RATE * Math.PI * 2;
            Complex z = new Complex(Math.cos(omega), Math.sin(omega));

            /* Evaluate the response at frequency z */

            /* Complex z1 = z.mul(gain); */
            Complex z2 = biquads[0].evaluateTransfer(z);
            Complex z3 = biquads[1].evaluateTransfer(z);
            Complex z4 = biquads[2].evaluateTransfer(z);
            Complex z5 = biquads[3].evaluateTransfer(z);
            Complex z6 = biquads[4].evaluateTransfer(z);
            Complex z7 = biquads[5].evaluateTransfer(z);
            Complex z8 = biquads[6].evaluateTransfer(z);
            Complex z9 = biquads[7].evaluateTransfer(z);
            Complex z10 = biquads[8].evaluateTransfer(z);

            /* Magnitude response, dB */
            double dB = lin2dB(gain * z2.rho() * z3.rho() * z4.rho() * z5.rho() * z6.rho()
                    * z7.rho() * z8.rho() * z9.rho() * z10.rho());
            float x = projectX(freq) * mWidth;
            float y = projectY(dB) * mHeight;

            /* Set starting point at first point */
            if (i == 0) {
                freqResponse.moveTo(x, y);
            } else {
                freqResponse.lineTo(x, y);
            }
        }

        Path freqResponseBg = new Path();
        freqResponseBg.addPath(freqResponse);
        freqResponseBg.offset(0, -4);
        freqResponseBg.lineTo(mWidth, mHeight);
        freqResponseBg.lineTo(0, mHeight);
        freqResponseBg.close();
        canvas.drawPath(freqResponseBg, mFrequencyResponseBg);

        canvas.drawPath(freqResponse, mFrequencyResponseHighlight);
        canvas.drawPath(freqResponse, mFrequencyResponseHighlight2);

        /* Set the width of the bars according to canvas size */
        canvas.drawRect(0, 0, mWidth - 1, mHeight - 1, mWhite);

        /* draw vertical lines */
        for (int freq = MIN_FREQ; freq < MAX_FREQ;) {
            float x = projectX(freq) * mWidth;
            canvas.drawLine(x, 0, x, mHeight - 1, mGridLines);
            if (freq < 100) {
                freq += 10;
            } else if (freq < 1000) {
                freq += 100;
            } else {
                freq += freq < 10000 ? 1000 : 10000;
            }
        }

        /* draw horizontal lines */
        for (int dB = MIN_DB + 3; dB <= MAX_DB - 3; dB += 3) {
            float y = projectY(dB) * mHeight;
            canvas.drawLine(0, y, mWidth - 1, y, mGridLines);
            canvas.drawText(String.format("%+d", dB), 1, y - 1, mWhite);
        }

        for (int i = 0; i < mLevels.length; i ++) {
            double freq = 15.625 * Math.pow(2, i+1);
            float x = projectX(freq) * mWidth;
            float y = projectY(mLevels[i]) * mHeight;
            String frequencyText = String.format(freq < 1000 ? "%.0f" : "%.0fk",
                    freq < 1000 ? freq : freq / 1000);

            canvas.drawLine(x, mHeight, x, y, mControlBar);
            canvas.drawCircle(x, y, mControlBar.getStrokeWidth() * 0.66f, mControlBarKnob);
            canvas.drawText(String.format("%+1.1f", mLevels[i]), x, mHeight - 2, mControlBarText);
            canvas.drawText(frequencyText, x, mWhite.getTextSize(), mControlBarText);
        }
    }

    private float projectX(double freq) {
        double pos = Math.log(freq);
        double minPos = Math.log(MIN_FREQ);
        double maxPos = Math.log(MAX_FREQ);
        return (float) ((pos - minPos) / (maxPos - minPos));
    }

    private double reverseProjectX(float pos) {
        double minPos = Math.log(MIN_FREQ);
        double maxPos = Math.log(MAX_FREQ);
        return Math.exp(pos * (maxPos - minPos) + minPos);
    }

    private float projectY(double dB) {
        double pos = (dB - MIN_DB) / (MAX_DB - MIN_DB);
        return (float) (1 - pos);
    }

    private double lin2dB(double rho) {
        return rho != 0 ? Math.log(rho) / Math.log(10) * 20 : -99.9;
    }

    /**
     * Find the closest control to given horizontal pixel for adjustment
     *
     * @param px
     * @return index of best match
     */
    public int findClosest(float px) {
        int idx = 0;
        float best = 1e9f;
        for (int i = 0; i < mLevels.length; i ++) {
            double freq = 15.625 * Math.pow(2, i+1);
            float cx = projectX(freq) * mWidth;
            float distance = Math.abs(cx - px);

            if (distance < best) {
                idx = i;
                best = distance;
            }
        }

        return idx;
    }
}
