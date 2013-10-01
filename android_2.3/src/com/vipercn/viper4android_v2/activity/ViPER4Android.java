package com.vipercn.viper4android_v2.activity;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.Random;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.preference.PreferenceActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import com.vipercn.viper4android_v2.HeadsetService;
import com.vipercn.viper4android_v2.R;

public final class ViPER4Android extends PreferenceActivity
{
	private boolean CheckFirstRun()
	{
		PackageManager packageMgr = getPackageManager();
		PackageInfo packageInfo = null;
		String szVersion = "";
		try
		{
			packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
			szVersion = packageInfo.versionName;
		}
		catch (NameNotFoundException e)
		{
			return false;
		}

		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
		String szLastVersion = prefSettings.getString("viper4android.settings.lastversion", "");
		if (szLastVersion == null) return true;
		if (szLastVersion.equals("")) return true;
		if (szLastVersion.equalsIgnoreCase(szVersion)) return false;
		return true;
	}

	private void SetFirstRun()
	{
		PackageManager packageMgr = getPackageManager();
		PackageInfo packageInfo = null;
		String szVersion = "";
		try
		{
			packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
			szVersion = packageInfo.versionName;
		}
		catch (NameNotFoundException e)
		{
			return;
		}

		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
		Editor edSettingsEditor = prefSettings.edit();
		if (edSettingsEditor != null)
		{
			edSettingsEditor.putString("viper4android.settings.lastversion", szVersion);
			edSettingsEditor.commit();
		}
	}

	private boolean CheckSoftwareActive()
	{
		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
		boolean bActived = prefSettings.getBoolean("viper4android.settings.onlineactive", false);
		return !bActived;
	}

	private void SetSoftwareActive()
	{
		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
		Editor edSettingsEditor = prefSettings.edit();
		if (edSettingsEditor != null)
		{
			edSettingsEditor.putBoolean("viper4android.settings.onlineactive", true);
			edSettingsEditor.commit();
		}
	}

	private boolean SubmitInformation()
	{
		String szCode = "";
		byte[] pchHexTab = (new String("0123456789abcdef")).getBytes();
		Random rndMachine = new Random(System.currentTimeMillis());
		for (int i = 0; i < 8; i++)
		{
			byte btCode = (byte)rndMachine.nextInt(256);
			if (btCode < 0)
	        {
	            short shortData = (short)(256 + btCode);
	            szCode = szCode + String.format("%c%c", pchHexTab[shortData >> 4], pchHexTab[shortData & 0x0F]);
	        }
			else szCode = szCode + String.format("%c%c", pchHexTab[btCode >> 4], pchHexTab[btCode & 0x0F]);
		}
		szCode = szCode + "-";
		for (int i = 0; i < 4; i++)
		{
			byte btCode = (byte)rndMachine.nextInt(256);
			if (btCode < 0)
	        {
	            short shortData = (short)(256 + btCode);
	            szCode = szCode + String.format("%c%c", pchHexTab[shortData >> 4], pchHexTab[shortData & 0x0F]);
	        }
			else szCode = szCode + String.format("%c%c", pchHexTab[btCode >> 4], pchHexTab[btCode & 0x0F]);
		}
		szCode = szCode + "-" + Build.VERSION.SDK_INT;

		String szURL = "http://vipersaudio.com/stat/v4a_stat.php?code=" + szCode + "&ver=viper4android-fx";
		Log.i("ViPER4Android", "Submit code = \"" + szURL + "\"");

		try
		{
			HttpGet httpRequest = new HttpGet(szURL);
			HttpClient httpClient = new DefaultHttpClient();
			HttpResponse httpResponse = httpClient.execute(httpRequest);
			if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK)
				return true;
			return false;
		}
		catch (Exception e)
		{
			Log.i("ViPER4Android", "Submit failed, error = " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	private boolean ProcessDriverCheck()
	{
		Log.i("ViPER4Android", "Enter ProcessDriverCheck()");

        if (mHeadsetServiceInstance != null)
        {
        	try
        	{
        		if (!mHeadsetServiceInstance.GetServicePrepared())
        		{
        			Log.i("ViPER4Android", "Service not prepared");
        			return false;
        		}
        		Thread.sleep(1000);
        	}
        	catch (Exception e)
        	{
        		Log.i("ViPER4Android", "Service instance is broken");
        		return false;
        	}

        	// Check driver version
			PackageManager packageMgr = getPackageManager();
			PackageInfo packageInfo = null;
			String szApkVer = "";
			try
			{
				packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
				szApkVer = packageInfo.versionName;
				String szDrvVer = mHeadsetServiceInstance.GetDriverVersion();

				Log.i("ViPER4Android", "Proceeding drvier check");
				if (!szApkVer.equals(szDrvVer))
				{
			        Message message = new Message();
			        message.what = 0xA00A;
			        message.obj = (Context)this;
			        hProceedDriverHandler.sendMessage(message);
				}
				return true;
			}
			catch (NameNotFoundException e)
			{
				Log.i("ViPER4Android", "Can not get application version, error = " + e.getMessage());
				return false;
			}
            catch (Exception e)
            {
            	Log.i("ViPER4Android", "Driver check error = " + e.getMessage());
            	return false;
            }
        }
        else
        {
        	Log.i("ViPER4Android", "Service instance is null");
        	return false;
        }
	}

	public static String DetermineCPUWithDriver()
	{
		String szDriverFile = "libv4a_fx_gb_";

		Utils.CPUInfo mCPUInfo = new Utils.CPUInfo();
		if (mCPUInfo.HasNEON()) szDriverFile = szDriverFile + "NEON";
		else if (mCPUInfo.HasVFP()) szDriverFile = szDriverFile + "VFP";
		else szDriverFile = szDriverFile + "NOVFP";

		szDriverFile = szDriverFile + ".so";
		Log.i("ViPER4Android", "Driver selection = " + szDriverFile);

		return szDriverFile;
	}

	public static String ReadTextFile(InputStream inputStream)
	{
	    InputStreamReader inputStreamReader = null;
	    try
	    {
	        inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
	    }
	    catch (UnsupportedEncodingException e1)
	    {
	        return "";
	    }
	    BufferedReader reader = new BufferedReader(inputStreamReader);
	    StringBuffer sb = new StringBuffer("");
	    String line;
	    try
	    {
	        while ((line = reader.readLine()) != null)
	        {
	            sb.append(line);
	            sb.append("\n");
	        }
	    }
	    catch (IOException e)
	    {
	        return "";
	    }
	    return sb.toString();
	}

	public static final String SHARED_PREFERENCES_BASENAME = "com.vipercn.viper4android_v2";
	public static final String ACTION_UPDATE_PREFERENCES = "com.vipercn.viper4android_v2.UPDATE";
    public static final String ACTION_SHOW_NOTIFY = "com.vipercn.viper4android_v2.SHOWNOTIFY";
    public static final String ACTION_CANCEL_NOTIFY = "com.vipercn.viper4android_v2.CANCELNOTIFY";
	public static final int NOTIFY_FOREGROUND_ID = 1;

	private boolean mKillAllThread = false;
    private Context mActivityContext = this;
    private HeadsetService mHeadsetServiceInstance = null;

	private static Handler hProceedDriverHandler = new Handler()
	{
	    @Override
	    public void handleMessage(Message msg)
	    {
	    	try
	    	{
	    		if (msg.what == 0xA00A)
	    		{
	    			if (msg.obj == null)
	    			{
	    				super.handleMessage(msg);
	    				return;
	    			}
	    			final Context ctxInstance = (Context)msg.obj;
					AlertDialog.Builder mUpdateDrv = new AlertDialog.Builder(ctxInstance);
					mUpdateDrv.setTitle("ViPER4Android");
					mUpdateDrv.setMessage(ctxInstance.getResources().getString(R.string.text_drvvernotmatch));
					mUpdateDrv.setPositiveButton(ctxInstance.getResources().getString(R.string.text_yes), new DialogInterface.OnClickListener()
					{
						@Override
						public void onClick(DialogInterface dialog, int which)
						{
		            		// Install/Update driver
							String szDriverFileName = DetermineCPUWithDriver();
                    		if (Utils.InstallDrv_FX(ctxInstance, szDriverFileName))
                    		{
                    			AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                    			mResult.setTitle("ViPER4Android");
                    			mResult.setMessage(ctxInstance.getResources().getString(R.string.text_drvinst_ok));
                    			mResult.setNegativeButton(ctxInstance.getResources().getString(R.string.text_ok), null);
                    			mResult.show();	
                    		}
                    		else
                    		{
                    			AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                    			mResult.setTitle("ViPER4Android");
                    			mResult.setMessage(ctxInstance.getResources().getString(R.string.text_drvinst_failed));
                    			mResult.setNegativeButton(ctxInstance.getResources().getString(R.string.text_ok), null);
                    			mResult.show();	
                    		}
						}
					});
					mUpdateDrv.setNegativeButton(ctxInstance.getResources().getString(R.string.text_no), new DialogInterface.OnClickListener()
					{ @Override public void onClick(DialogInterface dialog, int which) { return; } });
					mUpdateDrv.show();
	    		}
		    	super.handleMessage(msg);
	    	}
	    	catch (Exception e)
	    	{
	    		super.handleMessage(msg);
	    	}
	    }
	};

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
    	super.onCreate(savedInstanceState);

        // Welcome window
        if (CheckFirstRun())
        {
        	// TODO: Welcome window
        	// Maybe leave this until v2.3.0.2
        }

    	addPreferencesFromResource(R.xml.main_preferences);
    	mKillAllThread = false;
		startService(new Intent(HeadsetService.NAME));
		Log.i("ViPER4Android", "Starting service, reason = ViPER4Android::onCreate");

		if (CheckFirstRun())
		{
			String szLocale = Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry();
			String szChangelog_AssetsName = "Changelog_";
			if (szLocale.equalsIgnoreCase("zh_CN"))
				szChangelog_AssetsName = szChangelog_AssetsName + "zh_CN";
			else if (szLocale.equalsIgnoreCase("zh_TW"))
				szChangelog_AssetsName = szChangelog_AssetsName + "zh_TW";
			else szChangelog_AssetsName = szChangelog_AssetsName + "en_US";
			szChangelog_AssetsName = szChangelog_AssetsName + ".txt";

			String szChangeLog = "";
			InputStream isHandle = null;
			try
			{
				isHandle = getAssets().open(szChangelog_AssetsName);
				szChangeLog = ReadTextFile(isHandle);
				isHandle.close();
			}
			catch (Exception e)
			{
			}

			if (szChangeLog.equalsIgnoreCase("")) return;
			SetFirstRun();

			AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
			mChglog.setTitle(R.string.text_changelog);
			mChglog.setMessage(szChangeLog);
			mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
			mChglog.show();
		}

		Thread activeThread = new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				if (CheckSoftwareActive())
				{
					if (SubmitInformation())
					{
						SetSoftwareActive();
						Log.i("ViPER4Android", "Software actived");
					}
				}
			}
		});
		activeThread.start();

		Thread driverCheckThread = new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				Log.i("ViPER4Android", "Begin driver check ...");
				while (!mKillAllThread)
				{
					if (ProcessDriverCheck())
						break;
					try
					{ Thread.sleep(1000); }
					catch (InterruptedException e) { continue; }
				}
				Log.i("ViPER4Android", "Driver check finished");
			}
		});
		driverCheckThread.start();
    }

    @Override
    public void onDestroy()
    {
    	Log.i("ViPER4Android", "Main activity onDestroy()");
    	mKillAllThread = true;
    	super.onDestroy();
    }

    @Override
    public void onResume()
    {
    	super.onResume();

        Log.i("ViPER4Android", "Main activity onResume()");
        mKillAllThread = false;

    	ServiceConnection mServiceConnection = new ServiceConnection()
    	{
    		@Override
    		public void onServiceConnected(ComponentName name, IBinder service)
    		{
    			Log.i("ViPER4Android", "onServiceConnected()");
    			HeadsetService v4aService = ((HeadsetService.LocalBinder)service).getService();
                mHeadsetServiceInstance = v4aService;
                unbindService(this);
            }

            @Override
            public void onServiceDisconnected(ComponentName name)
            { Log.i("ViPER4Android", "ViPER4Android service disconnected."); }
        };

    	Log.i("ViPER4Android", "Binding service, reason = ViPER4Android::onResume");
        Intent serviceIntent = new Intent(this, HeadsetService.class);
        bindService(serviceIntent, mServiceConnection, 0);
    }

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
    	Log.i("ViPER4Android", "Enter onCreateOptionsMenu()");
	    MenuInflater inflater = getMenuInflater();
	    inflater.inflate(R.menu.settings_menu, menu);
		Log.i("ViPER4Android", "Exit onCreateOptionsMenu()");
	    return true;
	}

    @Override
    public boolean onPrepareOptionsMenu(Menu menu)
    {
    	SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
    	boolean bEnableNotify = preferences.getBoolean("viper4android.settings.show_notify_icon", false);

    	/* Just for debug */
    	String szLockedEffect = preferences.getString("viper4android.settings.lock_effect", "none");
    	Log.i("ViPER4Android", "lock_effect = " + szLockedEffect);
    	/******************/

    	// Notification icon menu
    	if (bEnableNotify)
    	{
    		MenuItem miNotify = menu.findItem(R.id.notify);
    		String szNotifyTitle = getResources().getString(R.string.text_hidetrayicon);
    		miNotify.setTitle(szNotifyTitle);
    	}
    	else
    	{
    		MenuItem miNotify = menu.findItem(R.id.notify);
    		String szNotifyTitle = getResources().getString(R.string.text_showtrayicon);
    		miNotify.setTitle(szNotifyTitle);
    	}

    	if (mHeadsetServiceInstance == null)
    	{
    		MenuItem drvInstItem = menu.findItem(R.id.drvinst);
    		String szMenuTitle = getResources().getString(R.string.text_install);
    		drvInstItem.setTitle(szMenuTitle);
    	}
    	else
    	{
    		boolean bDriverIsReady = mHeadsetServiceInstance.GetDriverIsReady();
    		if (bDriverIsReady)
    		{
        		MenuItem drvInstItem = menu.findItem(R.id.drvinst);
        		String szMenuTitle = getResources().getString(R.string.text_uninstall);
        		drvInstItem.setTitle(szMenuTitle);
    		}
    		else
    		{
        		MenuItem drvInstItem = menu.findItem(R.id.drvinst);
        		String szMenuTitle = getResources().getString(R.string.text_install);
        		drvInstItem.setTitle(szMenuTitle);
    		}
    	}

    	return super.onPrepareOptionsMenu(menu);
    }

	@Override
	public boolean onMenuItemSelected(int featureId, MenuItem item)
	{
		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);

		switch (item.getItemId())
		{
        case R.id.checkupdate:
        {
			Uri uri = Uri.parse(getResources().getString(R.string.text_updatelink));  
	        Intent intent = new Intent(Intent.ACTION_VIEW, uri);  
	        ViPER4Android.this.startActivity(intent);

        	return true;
        }

		case R.id.changelog:
		{
			String szLocale = Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry();
			String szChangelog_AssetsName = "Changelog_";
			if (szLocale.equalsIgnoreCase("zh_CN"))
				szChangelog_AssetsName = szChangelog_AssetsName + "zh_CN";
			else if (szLocale.equalsIgnoreCase("zh_TW"))
				szChangelog_AssetsName = szChangelog_AssetsName + "zh_TW";
			else szChangelog_AssetsName = szChangelog_AssetsName + "en_US";
			szChangelog_AssetsName = szChangelog_AssetsName + ".txt";

			String szChangeLog = "";
			InputStream isHandle = null;
			try
			{
				isHandle = getAssets().open(szChangelog_AssetsName);
				szChangeLog = ReadTextFile(isHandle);
				isHandle.close();
			}
			catch (Exception e)
			{
			}
			if (szChangeLog.equalsIgnoreCase("")) return true;

			AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
			mChglog.setTitle(R.string.text_changelog);
			mChglog.setMessage(szChangeLog);
			mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
			mChglog.show();

			return true;
		}

		case R.id.drvstatus:
		{
			String szMessages = "";
			if (mHeadsetServiceInstance == null)
			{
				szMessages = getResources().getString(R.string.text_service_error);
			}
			else
			{
				mHeadsetServiceInstance.StartStatusUpdating();
				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException e)
				{
					mHeadsetServiceInstance.StopStatusUpdating();
					szMessages = getResources().getString(R.string.text_service_error);
				}
				mHeadsetServiceInstance.StopStatusUpdating();

				String szDrvNEONEnabled = getResources().getString(R.string.text_yes);
				if (!mHeadsetServiceInstance.GetDriverNEON()) szDrvNEONEnabled = getResources().getString(R.string.text_no);
				String szDrvEnabled = getResources().getString(R.string.text_yes);
				if (!mHeadsetServiceInstance.GetDriverEnabled()) szDrvEnabled = getResources().getString(R.string.text_no);
				String szDrvUsable = getResources().getString(R.string.text_normal);
				if (!mHeadsetServiceInstance.GetDriverUsable()) szDrvUsable = getResources().getString(R.string.text_abnormal);
				String szDrvProcess = getResources().getString(R.string.text_yes);
				if (!mHeadsetServiceInstance.GetDriverProcess()) szDrvProcess = getResources().getString(R.string.text_no);

				String szDrvEffType = getResources().getString(R.string.text_disabled);
				if (mHeadsetServiceInstance.GetDriverEffectType() == HeadsetService.V4A_FX_TYPE_HEADPHONE)
					szDrvEffType = getResources().getString(R.string.text_headset);
				else if (mHeadsetServiceInstance.GetDriverEffectType() == HeadsetService.V4A_FX_TYPE_SPEAKER)
					szDrvEffType = getResources().getString(R.string.text_speaker);

				String szDrvStatus = "";
				szDrvStatus = getResources().getString(R.string.text_drv_status_view);
				szDrvStatus = String.format(szDrvStatus,
						mHeadsetServiceInstance.GetDriverVersion(), szDrvNEONEnabled,
						szDrvEnabled, szDrvUsable, szDrvProcess,
						szDrvEffType,
						mHeadsetServiceInstance.GetDriverSamplingRate(),
						mHeadsetServiceInstance.GetDriverChannels());
				szMessages = szDrvStatus;
			}

			Dialog alertDialog = new AlertDialog.Builder(this).setTitle(R.string.text_drv_status).setMessage(szMessages).setIcon(R.drawable.icon).create();
	        alertDialog.show();

	        return true;
		}

        case R.id.notify:
        {
        	boolean bEnableNotify = prefSettings.getBoolean("viper4android.settings.show_notify_icon", false);
        	bEnableNotify = !bEnableNotify;
        	if (bEnableNotify) item.setTitle(getResources().getString(R.string.text_hidetrayicon));
        	else item.setTitle(getResources().getString(R.string.text_showtrayicon));
        	Editor e = prefSettings.edit();
        	e.putBoolean("viper4android.settings.show_notify_icon", bEnableNotify);
        	e.commit();
        	// Tell background service to deal with the notification icon
        	if (bEnableNotify) sendBroadcast(new Intent(ViPER4Android.ACTION_SHOW_NOTIFY));
        	else sendBroadcast(new Intent(ViPER4Android.ACTION_CANCEL_NOTIFY));
        	return true;
        }

        case R.id.lockeffect:
        {
        	String szLockedEffect = prefSettings.getString("viper4android.settings.lock_effect", "none");
        	int nLockIndex = -1;
        	if (szLockedEffect.equalsIgnoreCase("none")) nLockIndex = 0;
        	else if (szLockedEffect.equalsIgnoreCase("headset")) nLockIndex = 1;
        	else if (szLockedEffect.equalsIgnoreCase("speaker")) nLockIndex = 2;
        	else if (szLockedEffect.equalsIgnoreCase("bluetooth")) nLockIndex = 3;
        	else nLockIndex = 4;

        	String [] szModeList =
        	{
        		getResources().getString(R.string.text_disabled),
        		getResources().getString(R.string.text_headset),
        		getResources().getString(R.string.text_speaker),
        		getResources().getString(R.string.text_bluetooth)
        	};

        	Dialog selectDialog = new AlertDialog.Builder(this)
            .setTitle(R.string.text_lockeffect)
            .setIcon(R.drawable.icon)
            .setSingleChoiceItems(szModeList, nLockIndex, new DialogInterface.OnClickListener()
            {
            	public void onClick(DialogInterface dialog, int which)
            	{
            		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
            		Editor e = prefSettings.edit();
            		switch (which)
            		{
            			case 0:
            			{
            				e.putString("viper4android.settings.lock_effect", "none");
            				break;
            			}
            			case 1:
            			{
            				e.putString("viper4android.settings.lock_effect", "headset");
            				break;
            			}
            			case 2:
            			{
            				e.putString("viper4android.settings.lock_effect", "speaker");
            				break;
            			}
            			case 3:
            			{
            				e.putString("viper4android.settings.lock_effect", "bluetooth");
            				break;
            			}
            		}
            		e.commit();
            		sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
            		dialog.dismiss();
            	}
            }).setCancelable(false).create();
        	selectDialog.show();
        	
        	return true;
        }

        case R.id.drvinst:
        {
        	String szMenuText = item.getTitle().toString();

        	if (getResources().getString(R.string.text_uninstall).equals(szMenuText))
        	{
    			AlertDialog.Builder mConfirm = new AlertDialog.Builder(this);
    			mConfirm.setTitle("ViPER4Android");
    			mConfirm.setMessage(getResources().getString(R.string.text_drvuninst_confim));
    			mConfirm.setPositiveButton(getResources().getString(R.string.text_yes), new DialogInterface.OnClickListener()
    			{
					@Override
					public void onClick(DialogInterface dialog, int which)
					{
		        		// Uninstall driver
						Utils.UninstallDrv_FX();
		    			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
		    			mResult.setTitle("ViPER4Android");
		    			mResult.setMessage(getResources().getString(R.string.text_drvuninst_ok));
		    			mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
		    			mResult.show();
					}
				});
    			mConfirm.setNegativeButton(getResources().getString(R.string.text_no), null);
    			mConfirm.show();
        	}
        	else if (getResources().getString(R.string.text_install).equals(szMenuText))
        	{
        		// Install driver
        		String szDriverFileName = DetermineCPUWithDriver();
        		if (Utils.InstallDrv_FX(mActivityContext, szDriverFileName))
        		{
        			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
        			mResult.setTitle("ViPER4Android");
        			mResult.setMessage(getResources().getString(R.string.text_drvinst_ok));
        			mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
        			mResult.show();
        		}
        		else
        		{
        			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
        			mResult.setTitle("ViPER4Android");
        			mResult.setMessage(getResources().getString(R.string.text_drvinst_failed));
        			mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
        			mResult.show();
        		}
        	}
        	else
        	{
        		String szTip = getResources().getString(R.string.text_service_error);
        		Toast.makeText(this, szTip, Toast.LENGTH_LONG).show();
        	}
        	return true;
        }

		default:
			return super.onMenuItemSelected(featureId, item);
		}
	}
}
