package com.vipercn.viper4android_v2.activity;

import java.io.File;
import java.util.ArrayList;
import java.util.Locale;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import android.util.Log;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.preference.EqualizerPreference;
import com.vipercn.viper4android_v2.preference.SummariedListPreference;

public final class DSPScreen extends PreferenceActivity
{
	private Context mActivityContext = this;
    private ArrayList<String> mProfileList = new ArrayList<String>();

	private final OnSharedPreferenceChangeListener serviceLauncher = new OnSharedPreferenceChangeListener()
	{
		public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key)
		{
			Log.i("ViPER4Android", "Update key = " + key);

			if ("viper4android.headphonefx.fireq".equals(key))
			{
				String pref = sharedPreferences.getString(key, null);
				if (!"custom".equals(pref))
				{
					Editor e = sharedPreferences.edit();
					e.putString("viper4android.headphonefx.fireq.custom", pref);
					e.commit();
					EqualizerPreference eq = (EqualizerPreference) getPreferenceScreen().findPreference("viper4android.headphonefx.fireq.custom");
					eq.refreshFromPreference();
				}
			}

			if ("viper4android.headphonefx.fireq.custom".equals(key))
			{
				String customSetting = sharedPreferences.getString("viper4android.headphonefx.fireq.custom", null);
				String desiredValue = "custom";
				SummariedListPreference preset = (SummariedListPreference) getPreferenceScreen().findPreference("viper4android.headphonefx.fireq");
				for (CharSequence entry : preset.getEntryValues())
				{
					if (entry.equals(customSetting))
					{
						desiredValue = customSetting.toString();
						break;
					}
				}

				if (!desiredValue.equals(sharedPreferences.getString("viper4android.headphonefx.fireq", null)))
				{
					Editor e = sharedPreferences.edit();
					e.putString("viper4android.headphonefx.fireq", desiredValue);
					e.commit();
					preset.refreshFromPreference();
				}
			}

			sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
		}
	};

	private String getSubPage()
	{
		String[] action = getIntent().getAction().split("\\.");
		return action[action.length - 1].toLowerCase(Locale.US);
	}

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		try
		{
			addPreferencesFromResource(getResources().getIdentifier(getSubPage() + "_preferences", "xml", getPackageName()));
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}

		SharedPreferences preferences = getSharedPreferences(null, 0);
		preferences.registerOnSharedPreferenceChangeListener(serviceLauncher);
	}

	@Override
	protected void onDestroy()
	{
		super.onDestroy();

		SharedPreferences preferences = getSharedPreferences(null, 0);
		preferences.unregisterOnSharedPreferenceChangeListener(serviceLauncher);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
	    MenuInflater inflater = getMenuInflater();
	    inflater.inflate(R.menu.menu, menu);
	    return true;
	}

	private String szSaveProfileNameGlobal = "";
	@Override
	public boolean onMenuItemSelected(int featureId, MenuItem item)
	{
		final String szSharedPref = ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + getSubPage();

		switch (item.getItemId())
		{
		case R.id.reset:
			clearPrefs();
			return true;

        case R.id.loadprofile:
        {
        	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
        		return true;
        	String szProfilePath = Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/";
        	mProfileList = Utils.GetProfileList(szProfilePath);
        	if (mProfileList.size() <= 0) return true;

        	String arrayProfileList[] = new String[mProfileList.size()];
        	for (int nPrfIdx = 0; nPrfIdx < mProfileList.size(); nPrfIdx++)
        		arrayProfileList[nPrfIdx] = mProfileList.get(nPrfIdx);

        	new AlertDialog.Builder(this)
            .setTitle(R.string.text_loadfxprofile)
            .setIcon(R.drawable.icon)
            .setItems(arrayProfileList, new DialogInterface.OnClickListener()
            {
            	public void onClick(DialogInterface dialog, int which)
            	{
            		String szProfilePath = Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/";
					Log.i("ViPER4Android", "Load effect profile, current sharedPref = " + szSharedPref);

                	String arrayProfileList[] = new String[mProfileList.size()];
                	for (int nPrfIdx = 0; nPrfIdx < mProfileList.size(); nPrfIdx++)
                		arrayProfileList[nPrfIdx] = mProfileList.get(nPrfIdx);

            		String szProfileName = arrayProfileList[which];
            		if (Utils.LoadProfile(szProfileName, szProfilePath, szSharedPref, mActivityContext))
            		{
            			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
            			mResult.setTitle("ViPER4Android");
            			mResult.setMessage(getResources().getString(R.string.text_profileload_ok));
            			mResult.setNegativeButton(getResources().getString(R.string.text_ok), new DialogInterface.OnClickListener()
            			{
							@Override
							public void onClick(DialogInterface dialog, int which)
							{ finish(); }
						});
            			mResult.show();
            		}
            		else
            		{
            			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
            			mResult.setTitle("ViPER4Android");
            			mResult.setMessage(getResources().getString(R.string.text_profileload_err));
            			mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
            			mResult.show();
            		}
            	}
            }).setNegativeButton(R.string.text_cancel, new DialogInterface.OnClickListener()
            {public void onClick(DialogInterface dialog, int which){ return; }}).create().show();

        	return true;
        }

        case R.id.saveprofile:
        {
        	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
        		return true;

        	Dialog dlgSaveProfile = new Dialog(mActivityContext)
            {
            	private EditText editProfileName = null;

				@Override
				protected void onCreate(Bundle savedInstanceState)
				{
					super.onCreate(savedInstanceState);

					this.setContentView(R.layout.saveprofile);

					editProfileName = (EditText)findViewById(R.id.save_profile_name);
					Button btnSaveProfile = (Button)findViewById(R.id.profile_save_button);

					btnSaveProfile.setOnClickListener(new View.OnClickListener()
					{
						public void onClick(View v)
						{
							if (editProfileName == null)
							{
								Log.i("ViPER4Android", "editProfileName == null");
								dismiss();
								return;
							}
							if (editProfileName.getText() == null)
							{
								Log.i("ViPER4Android", "editProfileName.getText() == null");
								dismiss();
								return;
							}
							if (editProfileName.getText().toString() == null)
							{
								Log.i("ViPER4Android", "editProfileName.getText().toString() == null");
								dismiss();
								return;
							}
							String szProfileName = editProfileName.getText().toString().trim();
							if (szProfileName == null)
							{
								Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
							}
							else if (szProfileName.equals(""))
							{
								Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
							}
							else
							{
								String szProfilePath = Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/";
								File mProfileDir = new File(szProfilePath);
								if (!mProfileDir.exists())
								{
									mProfileDir.mkdirs();
									mProfileDir.mkdir();
								}
								mProfileDir = new File(szProfilePath);
								if (!mProfileDir.exists())
								{
									Toast.makeText(mActivityContext, getResources().getString(R.string.text_rwsd_error), Toast.LENGTH_LONG).show();
									dismiss();
									return;
								}

								szSaveProfileNameGlobal = szProfileName;
								if (Utils.CheckProfileExists(szProfileName, Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/"))
								{
				        			AlertDialog.Builder mConfirm = new AlertDialog.Builder(mActivityContext);
				        			mConfirm.setTitle("ViPER4Android");
				        			mConfirm.setMessage(getResources().getString(R.string.text_profilesaved_overwrite));
				        			mConfirm.setPositiveButton(getResources().getString(R.string.text_yes), new DialogInterface.OnClickListener()
				        			{
										@Override
										public void onClick(DialogInterface dialog, int which)
										{
											Log.i("ViPER4Android", "Save effect profile, current sharedPref = " + szSharedPref);
											Utils.SaveProfile(szSaveProfileNameGlobal, Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/", szSharedPref, mActivityContext);
											Toast.makeText(mActivityContext, mActivityContext.getResources().getString(R.string.text_profilesaved_ok), Toast.LENGTH_LONG).show();
										}
									});
				        			mConfirm.setNegativeButton(getResources().getString(R.string.text_no), null);
				        			mConfirm.show();
									dismiss();
									return;
								}

								Log.i("ViPER4Android", "Save effect profile, current sharedPref = " + szSharedPref);
								Utils.SaveProfile(szProfileName, Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/", szSharedPref, mActivityContext);
								Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_ok), Toast.LENGTH_LONG).show();
							}
							dismiss();
						}
					});

					Button btnCancelProfile = (Button)findViewById(R.id.profile_cancel_button);
					btnCancelProfile.setOnClickListener(new View.OnClickListener()
					{ public void onClick(View v) { dismiss(); } });
				}
			};

			dlgSaveProfile.setTitle(getResources().getString(R.string.text_loadfxprofile));
			dlgSaveProfile.show();

        	return true;
        }

		default:
			return super.onMenuItemSelected(featureId, item);
		}
	}

	@Override
	public SharedPreferences getSharedPreferences(String name, int mode)
	{
		return super.getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + getSubPage(), mode);
	}

	private void clearPrefs()
	{
		SharedPreferences preferences = getSharedPreferences(null, 0);
		SharedPreferences.Editor preferencesEditor = preferences.edit();

		for (String preference : preferences.getAll().keySet())
		{
			preferencesEditor.remove(preference);
		}
		preferencesEditor.commit();

		finish();
	}
}
