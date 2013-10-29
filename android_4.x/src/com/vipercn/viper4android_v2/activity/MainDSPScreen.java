package com.vipercn.viper4android_v2.activity;

import android.app.AlertDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.util.Log;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.preference.EqualizerPreference;
import com.vipercn.viper4android_v2.preference.SummariedListPreference;

public final class MainDSPScreen extends PreferenceFragment
{
	private final OnSharedPreferenceChangeListener listener = new OnSharedPreferenceChangeListener()
	{
		@Override
		public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key)
		{
			Log.i("ViPER4Android", "Update key = " + key);

			if ("viper4android.headphonefx.fireq".equals(key))
			{
				String newValue = sharedPreferences.getString(key, null);
				if (!"custom".equals(newValue))
				{
					Editor e = sharedPreferences.edit();
					e.putString("viper4android.headphonefx.fireq.custom", newValue);
					e.commit();
					EqualizerPreference eq = (EqualizerPreference)getPreferenceScreen().findPreference("viper4android.headphonefx.fireq.custom");
					eq.refreshFromPreference();
				}
			}

			if ("viper4android.headphonefx.fireq.custom".equals(key))
			{
				String newValue = sharedPreferences.getString(key, null);
				String desiredValue = "custom";
				SummariedListPreference preset = (SummariedListPreference)getPreferenceScreen().findPreference("viper4android.headphonefx.fireq");
				for (CharSequence entry : preset.getEntryValues())
				{
					if (entry.equals(newValue))
					{
						desiredValue = newValue;
						break;
					}
				}
				if (!desiredValue.equals(preset.getEntry()))
				{
					Editor e = sharedPreferences.edit();
					e.putString("viper4android.headphonefx.fireq", desiredValue);
					e.commit();
					preset.refreshFromPreference();
				}
			}

			if ("viper4android.global.forceenable.enable".equals(key))
			{
				if (sharedPreferences.getBoolean(key, false))
				{
					// If force-enable switched on, popup a warning
	    			AlertDialog.Builder mResult = new AlertDialog.Builder(getActivity());
	    			mResult.setTitle("ViPER4Android");
	    			mResult.setMessage(getActivity().getResources().getString(R.string.pref_force_enable_warn));
	    			mResult.setNegativeButton(getActivity().getResources().getString(R.string.text_ok), null);
	    			mResult.show();
				}
			}

			getActivity().sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
		}
	};

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		String config = getArguments().getString("config");

		SharedPreferences prefSettings = getActivity().getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
		int nControlLevel = prefSettings.getInt("viper4android.settings.uiprefer", 0);
		if ((nControlLevel < 0) || (nControlLevel > 2)) nControlLevel = 0;

		getPreferenceManager().setSharedPreferencesName(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + config);
		try
		{
			int xmlId = R.xml.class.getField(config + "_preferences_l" + nControlLevel).getInt(null);
			addPreferencesFromResource(xmlId);
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}

		getPreferenceManager().getSharedPreferences().registerOnSharedPreferenceChangeListener(listener);
	}

	@Override
	public void onDestroy()
	{
		super.onDestroy();
		getPreferenceManager().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(listener);
	}
}
