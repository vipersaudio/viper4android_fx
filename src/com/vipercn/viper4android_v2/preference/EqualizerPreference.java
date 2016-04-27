package com.vipercn.viper4android_v2.preference;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.service.ViPER4AndroidService;

import java.util.Locale;

public class EqualizerPreference extends DialogPreference {
    protected EqualizerSurface mListEqualizer, mDialogEqualizer;
    private ViPER4AndroidService mAudioService;

    private final ServiceConnection connectionForDialog = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            mAudioService = ((ViPER4AndroidService.LocalBinder) binder).getService();
            updateDspFromDialogEqualizer();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            mAudioService = null;
        }
    };

    public EqualizerPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setLayoutResource(R.layout.equalizer);
        setDialogLayoutResource(R.layout.equalizer_popup);
    }

    protected void updateDspFromDialogEqualizer() {
        if (mAudioService != null) {
            float[] levels = new float[10];
            for (int i = 0; i < levels.length; i++) {
                levels[i] = mDialogEqualizer.getBand(i);
            }
            mAudioService.setEqualizerLevels(levels);
        }
    }

    private void updateListEqualizerFromValue() {
        String value = getPersistedString(null);
        if (value != null && mListEqualizer != null) {
            String[] levelsStr = value.split(";");
            for (int i = 0; i < 10; i++) {
                mListEqualizer.setBand(i, Float.valueOf(levelsStr[i]));
            }
        }
    }

    @Override
    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);

        mDialogEqualizer = (EqualizerSurface) view.findViewById(R.id.FrequencyResponse);
        mDialogEqualizer.setOnTouchListener(new OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                float x = event.getX();
                float y = event.getY();

                int band = mDialogEqualizer.findClosest(x);

                int wy = v.getHeight();
                float level = y / wy * (EqualizerSurface.MIN_DB - EqualizerSurface.MAX_DB)
                        - EqualizerSurface.MIN_DB;
                if (level < EqualizerSurface.MIN_DB) {
                    level = EqualizerSurface.MIN_DB;
                } else if (level > EqualizerSurface.MAX_DB) {
                    level = EqualizerSurface.MAX_DB;
                }

                mDialogEqualizer.setBand(band, level);
                updateDspFromDialogEqualizer();
                return true;
            }
        });

        if (mListEqualizer != null) {
            for (int i = 0; i < 10; i++) {
                mDialogEqualizer.setBand(i, mListEqualizer.getBand(i));
            }
        }

        Intent serviceIntent = new Intent(getContext(), ViPER4AndroidService.class);
        getContext().bindService(serviceIntent, connectionForDialog, 0);
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        if (positiveResult) {
            StringBuilder value = new StringBuilder();
            for (int i = 0; i < 10; i ++) {
                value.append(String.format(Locale.ROOT, "%.1f", mDialogEqualizer.getBand(i)));
                value.append(';');
            }
            persistString(value.toString());
            updateListEqualizerFromValue();
        }

        if (mAudioService != null) {
            mAudioService.setEqualizerLevels(null);
        }
        getContext().unbindService(connectionForDialog);
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        mListEqualizer = (EqualizerSurface) view.findViewById(R.id.FrequencyResponse);
        updateListEqualizerFromValue();
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        String value = restorePersistedValue ? getPersistedString(null) : (String) defaultValue;
        if (shouldPersist()) {
            persistString(value);
        }
    }

    public void refreshFromPreference() {
        onSetInitialValue(true, null);
    }
}
