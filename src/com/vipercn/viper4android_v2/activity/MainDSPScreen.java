package com.vipercn.viper4android_v2.activity;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.util.Log;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.preference.EqualizerPreference;
import com.vipercn.viper4android_v2.preference.SummariedListPreference;

public final class MainDSPScreen extends PreferenceFragment {

    public static final String PREF_KEY_EQ = "viper4android.headphonefx.fireq";
    public static final String PREF_KEY_CUSTOM_EQ = "viper4android.headphonefx.fireq.custom";
    public static final String EQ_VALUE_CUSTOM = "custom";
    public static final String PREF_KEY_FORCE = "viper4android.global.forceenable.enable";
    public static final String PREF_KEY_DDC = "viper4android.headphonefx.viperddc.enable";
    public static final String PREF_KEY_VSE = "viper4android.headphonefx.vse.enable";

    private final OnSharedPreferenceChangeListener listener
            = new OnSharedPreferenceChangeListener() {
        @Override
        public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
            Log.i("ViPER4Android", "Update key = " + key);

            if (PREF_KEY_EQ.equals(key)) {
                String newValue = prefs.getString(key, null);
                if (!EQ_VALUE_CUSTOM.equals(newValue)) {
                    prefs.edit().putString(PREF_KEY_CUSTOM_EQ, newValue).commit();

                    /* Now tell the equalizer that it must display something else. */
                    EqualizerPreference eq =
                            (EqualizerPreference) findPreference(PREF_KEY_CUSTOM_EQ);
                    eq.refreshFromPreference();
                    eq = null;
                }
            }

            /* If the equalizer surface is updated, select matching pref entry or "custom". */
            if (PREF_KEY_CUSTOM_EQ.equals(key)) {
                String newValue = prefs.getString(key, null);
                String desiredValue = EQ_VALUE_CUSTOM;
                SummariedListPreference preset = (SummariedListPreference) findPreference(PREF_KEY_EQ);
                for (CharSequence entry : preset.getEntryValues()) {
                    if (entry.equals(newValue)) {
                        desiredValue = newValue;
                        break;
                    }
                }

                /* Tell listpreference that it must display something else. */
                if (!desiredValue.equals(preset.getEntry())) {
                    prefs.edit().putString(PREF_KEY_EQ, desiredValue).commit();
                    preset.refreshFromPreference();
                }
                preset = null;
            }

            if (PREF_KEY_FORCE.equals(key)) {
                if (prefs.getBoolean(key, false)) {
                    // If force-enable switched on, popup a warning
                    AlertDialog.Builder mDlgWarning = new AlertDialog.Builder(getActivity());
                    mDlgWarning.setTitle("ViPER4Android");
                    mDlgWarning.setMessage(getActivity().getResources().getString(
                            R.string.pref_force_enable_warn));
                    mDlgWarning.setNegativeButton(
                            getActivity().getResources().getString(R.string.text_ok), null);
                    mDlgWarning.show();
                    mDlgWarning = null;
                }
            }

            if (PREF_KEY_DDC.equals(key)) {
                if (prefs.getBoolean(key, false)) {
                    SharedPreferences prefSettings = getActivity().getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
                    if (!prefSettings.getBoolean("viper4android.settings.viperddc.notice", false)) {
                    	prefSettings.edit().putBoolean("viper4android.settings.viperddc.notice", true).commit();
	                    AlertDialog.Builder mNotice = new AlertDialog.Builder(getActivity());
	                    mNotice.setTitle("ViPER4Android");
	                    mNotice.setMessage(getActivity().getResources().getString(
	                            R.string.pref_viperddc_tips));
	                    mNotice.setNegativeButton(
	                            getActivity().getResources().getString(R.string.text_ok), null);
	                    mNotice.show();
	                    mNotice = null;
                    }
                    prefSettings = null;
                }
            }

            if (PREF_KEY_VSE.equals(key)) {
                if (prefs.getBoolean(key, false)) {
                    SharedPreferences prefSettings = getActivity().getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
                    if (!prefSettings.getBoolean("viper4android.settings.vse.notice", false)) {
                    	prefSettings.edit().putBoolean("viper4android.settings.vse.notice", true).commit();
	                    AlertDialog.Builder mNotice = new AlertDialog.Builder(getActivity());
	                    mNotice.setTitle("ViPER4Android");
	                    mNotice.setMessage(getActivity().getResources().getString(
	                            R.string.pref_vse_tips));
	                    mNotice.setNegativeButton(
	                            getActivity().getResources().getString(R.string.text_ok), null);
	                    mNotice.show();
	                    mNotice = null;
                    }
                    prefSettings = null;
                }
            }

            getActivity().sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
        }
    };

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String config = getArguments().getString("config");
        PreferenceManager prefManager = getPreferenceManager();

        SharedPreferences prefSettings = getActivity().getSharedPreferences(
                ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
        int mControlLevel = prefSettings.getInt("viper4android.settings.uiprefer", 0);
        if (mControlLevel < 0 || mControlLevel > 2) {
            mControlLevel = 0;
        }

        prefManager.setSharedPreferencesName(
                ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + config);
        prefManager.setSharedPreferencesMode(Context.MODE_MULTI_PROCESS);
        try {
            int xmlId = R.xml.class.getField(config + "_preferences_l" + mControlLevel)
                    .getInt(null);
            addPreferencesFromResource(xmlId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        prefManager.getSharedPreferences().registerOnSharedPreferenceChangeListener(listener);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        getPreferenceManager().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(listener);
    }
}
