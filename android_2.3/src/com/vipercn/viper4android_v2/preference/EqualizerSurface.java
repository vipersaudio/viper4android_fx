package com.vipercn.viper4android_v2.preference;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.view.SurfaceView;

public class EqualizerSurface extends SurfaceView
{
	private static double FreqTable[] = {27.34375f, 54.6875f, 109.375f, 218.75f, 437.5f, 875f, 1750f, 3500f, 7000f, 14000f};

	public static int MIN_FREQ = 10;
	public static int MAX_FREQ = 20000;
	public static int SAMPLING_RATE = 44100;
	public static int MIN_DB = -10;
	public static int MAX_DB = 10;
	public static final float CURVE_RESOLUTION = 1.25f;

	private LinearGradient gradient = null;
	private Biquad[] biquads = null;
	private Complex z_sur = null;

	private float[] levels = new float[10];
	private final Paint white, whiteCentered, gray, green, blue, purple, red;
	private int width, height, barwidth;

	public EqualizerSurface(Context context, AttributeSet attributeSet)
	{
		super(context, attributeSet);
		
		gradient = new LinearGradient(0, 0, 0, height, 0xffbfff00, 0xff003300, Shader.TileMode.CLAMP);
		biquads = new Biquad[]
		{
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
			new Biquad(),
		};
		z_sur = new Complex();

		setWillNotDraw(false);

		white = new Paint();
		white.setColor(0xffffffff);
		white.setStyle(Style.STROKE);
		white.setTextSize(13);
		white.setAntiAlias(true);

		whiteCentered = new Paint(white);
		whiteCentered.setTextAlign(Paint.Align.CENTER);

		gray = new Paint();
		gray.setColor(0x22ffffff);
		gray.setStyle(Style.STROKE);

		green = new Paint();
		green.setColor(0x8800ff00);
		green.setStyle(Style.STROKE);
		green.setAntiAlias(true);
		green.setStrokeWidth(4);

		purple = new Paint();
		purple.setColor(0x88ff00ff);
		purple.setStyle(Style.STROKE);

		blue = new Paint();
		blue.setColor(0x880000ff);
		blue.setStyle(Style.FILL_AND_STROKE);
		blue.setStrokeWidth(1);
		blue.setAntiAlias(true);

		red = new Paint();
		red.setColor(0x88ff0000);
		red.setStyle(Style.FILL_AND_STROKE);
		red.setStrokeWidth(2);
		red.setAntiAlias(true);
	}

	@Override
	protected void onLayout(boolean changed, int left, int top, int right, int bottom)
	{
		super.onLayout(changed, left, top, right, bottom);

		width = right - left;
		height = bottom - top;
		barwidth = (width / (levels.length + 1)) / 4;
		green.setShader(gradient);
	}

	public void setBand(int i, float value)
	{
		levels[i] = value;
		postInvalidate();
	}

	public float getBand(int i)
	{
		return levels[i];
	}

	@Override
	protected void onDraw(Canvas canvas)
	{
		canvas.drawRGB(0, 0, 0);
		green.setStrokeWidth(barwidth);	
		canvas.drawRect(0, 0, width - 1, height - 1, white);

		for (int freq = MIN_FREQ; freq < MAX_FREQ;)
		{
			if (freq < 100)
			{
				freq += 10;
			}
			else if (freq < 1000)
			{
				freq += 100;
			}
			else if (freq < 10000)
			{ 
				freq += 1000;
			}
			else
			{
				freq += 10000;
			}

			float x = projectX(freq) * width;
			canvas.drawLine(x, 0, x, height - 1, gray);
		}

		for (int i = 0; i < levels.length; i ++)
		{
			float freq = (float)FreqTable[i];
			float x = projectX(freq) * width - 8;
			canvas.drawText(String.format(freq < 1000 ? "%.0f" : "%.0fk", freq < 1000 ? freq : freq / 1000), x, height-1, white);
		}

		for (int dB = MIN_DB; dB <= MAX_DB; dB += 5)
		{
			float y = projectY(dB) * height;
			if (dB == 0)
			{
				canvas.drawLine(0, y, width - 1, y, red);
			}
			else
			{
				canvas.drawLine(0, y, width - 1, y, gray);
			}
			canvas.drawText(String.format("%d", Math.abs(dB)), 1, y - 1, white);
		}

		float gain = (float) Math.pow(10, levels[0] / 20);
		for (int i = 0; i < biquads.length; i ++)
		{
			float freq = (float)FreqTable[i];
			biquads[i].setHighShelf(freq * 2f, SAMPLING_RATE, levels[i + 1] - levels[i], 1f);
		}

		float oldx = -1;
		float olddB = 0;
		for (float freq = MIN_FREQ / CURVE_RESOLUTION; freq < MAX_FREQ * CURVE_RESOLUTION; freq *= CURVE_RESOLUTION)
		{
			float omega = freq / SAMPLING_RATE * (float) Math.PI * 2;
			z_sur.SetValue(FloatMath.cos(omega), FloatMath.sin(omega));

			/* Evaluate the response at frequency z */
			Complex z2 = biquads[0].evaluateTransfer(z_sur);
			Complex z3 = biquads[1].evaluateTransfer(z_sur);
			Complex z4 = biquads[2].evaluateTransfer(z_sur);
			Complex z5 = biquads[3].evaluateTransfer(z_sur);
			Complex z6 = biquads[4].evaluateTransfer(z_sur);
			Complex z7 = biquads[5].evaluateTransfer(z_sur);
			Complex z8 = biquads[6].evaluateTransfer(z_sur);
			Complex z9 = biquads[7].evaluateTransfer(z_sur);
			Complex z10 = biquads[8].evaluateTransfer(z_sur);

			/* Magnitude response, dB */
			float dB = lin2dB(gain * z2.rho() * z3.rho() * z4.rho() * z5.rho() * z6.rho() * z7.rho() * z8.rho() * z9.rho() * z10.rho());
			float newBb = projectY(dB) * height;	
			float newx = projectX(freq) * width;

			if (oldx != -1)
			{
				canvas.drawLine(oldx, olddB, newx, newBb, blue);
			}
			oldx = newx;
			olddB = newBb;
		}

		for (int i = 0; i < levels.length; i ++)
		{
			float freq = (float)FreqTable[i];
			float x = projectX(freq) * width;
			float y = projectY(levels[i]) * height;
			canvas.drawLine(x, height/2, x, y, green);
			canvas.drawText(String.format("%1.1f", Math.abs(levels[i])), x, height / 2, whiteCentered);
		}
	}

	private float projectX(float freq)
	{
		double pos = Math.log(freq);
		double minPos = Math.log(MIN_FREQ);
		double maxPos = Math.log(MAX_FREQ);
		pos = (pos - minPos) / (maxPos - minPos);
		return (float) pos;
	}

	private float projectY(float dB)
	{
		float pos = (dB - MIN_DB) / (MAX_DB - MIN_DB);
		return 1 - pos;
	}

	private float lin2dB(float rho)
	{
		return rho != 0 ? (float) (Math.log(rho) / Math.log(10) * 20) : -99f;
	}

	public int findClosest(float px)
	{
		int idx = 0;
		float best = 99999;
		for (int i = 0; i < levels.length; i ++)
		{
			float freq = (float)FreqTable[i];
			float cx = projectX(freq) * width;
			float distance = Math.abs(cx - px);

			if (distance < best)
			{
				idx = i;
				best = distance;
			}
		}

		return idx;
	}
}
