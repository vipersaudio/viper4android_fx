package com.vipercn.viper4android.activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.util.Log;

import com.vipercn.viper4android.R;
import com.vipercn.viper4android.preference.EqualizerPreference;
import com.vipercn.viper4android.preference.SummariedListPreference;

public final class MainDSPScreen extends PreferenceFragment
{
	private Context mParentContext = null;

	public void setParentContext(Context mCtx)
	{
		mParentContext = mCtx;
	}

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

			if ("viper4android.headphonefx.convolver.kernel".equals(key))
			{
				if (mParentContext != null)
				{
					String szSrcIRFile = sharedPreferences.getString(key, "");
					if (szSrcIRFile != "")
					{
						szSrcIRFile = "\"" + szSrcIRFile + "\"";
	
						Log.i("ViPER4Android", "IR sample = " + szSrcIRFile);
						int iAndroidVersion = Build.VERSION.SDK_INT;
						Log.i("ViPER4Android", "System version: " + iAndroidVersion);
	
						String szDstFile = "/data/v4a_conv.irs";
						Log.i("ViPER4Android", "Copy ir sample to " + szDstFile);
	
						String szToolbox = Utils.GetSavedToolbox(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", mParentContext);
				    	if (!szToolbox.equals(""))
				    	{
				        	String szCopy   = Utils.MakeCopyCmdLine(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", mParentContext, szSrcIRFile, szDstFile);
				        	String szChmod  = szToolbox + " chmod";
				        	String szSync   = szToolbox + " sync";
							String szCmdLine[] = new String[3];
							szCmdLine[0] = szCopy;
							szCmdLine[1] = szSync;  /* FIXME: do i need a 'sync' to flush io buffer ? */
							szCmdLine[2] = szChmod + " 777 " + szDstFile;
							Utils.runRootCommand(szCmdLine, 100);
				    	}
					}
					else
					{
						Log.i("ViPER4Android", "Remove /data/v4a_conv.irs");
						String szDstFile = "/data/v4a_conv.irs";
				    	String szToolbox = Utils.GetSavedToolbox(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", mParentContext);
				    	if (!szToolbox.equals(""))
				    	{
				        	String szRemove = szToolbox + " rm";
				        	String szSync   = szToolbox + " sync";
				        	String szCmdLine[] = new String[2];
				        	szCmdLine[0] = szRemove + " " + szDstFile;
				        	szCmdLine[1] = szSync;  /* FIXME: do i need a 'sync' to flush io buffer ? */
							Utils.runRootCommand(szCmdLine, 100);
				    	}
					}
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

		getPreferenceManager().setSharedPreferencesName(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + config);

		try
		{
			int xmlId = R.xml.class.getField(config + "_preferences").getInt(null);
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
