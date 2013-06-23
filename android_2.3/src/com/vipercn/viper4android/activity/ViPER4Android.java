package com.vipercn.viper4android.activity;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
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

import com.vipercn.viper4android.HeadsetService;
import com.vipercn.viper4android.R;

public final class ViPER4Android extends PreferenceActivity
{
	private String GetBasePath()
    {   	
    	Context cont = getApplicationContext();
    	String szBasePath = cont.getFilesDir().toString();
    	if (!cont.getFilesDir().exists())
    		if (!cont.getFilesDir().mkdir()) return "";
    	return szBasePath;
	}

    private boolean IsFileExisted(String szFilePath)
    {
    	return Utils.fileExists(szFilePath);
    }

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

		String szVersionFile = GetBasePath() + "/" + szVersion;
		if (IsFileExisted(szVersionFile)) return false;
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
		}

		String szVersionFile = GetBasePath() + "/" + szVersion;
		OutputStream osFirstRunSign = null;
		try
		{
			osFirstRunSign = new FileOutputStream(szVersionFile);
			byte[] tBlank = new byte[16];
			osFirstRunSign.write(tBlank);
			osFirstRunSign.flush();
			osFirstRunSign.close();
		}
		catch(Exception e)
		{
			return;
		}
	}

	private boolean CheckSoftwareActive()
	{
		String szActiveFile = GetBasePath() + "/" + getResources().getString(R.string.text_user_statistics);
		if (IsFileExisted(szActiveFile)) return false;
		return true;
	}

	private void SetSoftwareActive()
	{
		String szActiveFile = GetBasePath() + "/" + getResources().getString(R.string.text_user_statistics);
		OutputStream osActiveSign = null;
		try
		{
			osActiveSign = new FileOutputStream(szActiveFile);
			byte[] tBlank = new byte[16];
			osActiveSign.write(tBlank);
			osActiveSign.flush();
			osActiveSign.close();
		}
		catch(Exception e)
		{
			return;
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

	public static final String SHARED_PREFERENCES_BASENAME = "com.vipercn.viper4android";
	public static final String ACTION_UPDATE_PREFERENCES = "com.vipercn.viper4android.UPDATE";
    public static final String ACTION_SHOW_NOTIFY = "com.vipercn.viper4android.SHOWNOTIFY";
    public static final String ACTION_CANCEL_NOTIFY = "com.vipercn.viper4android.CANCELNOTIFY";
	public static final int NOTIFY_FOREGROUND_ID = 1;

	private boolean mKillAllThread = false;
    private Context mActivityContext = this;
    private HeadsetService mHeadsetServiceInstance = null;
    private static final String V4ASettingsPreference = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings";

	private Handler hProceedDriverHandler = new Handler()
	{
	    @Override
	    public void handleMessage(Message msg)
	    {
	    	try
	    	{
	    		if (msg.what == 0xA00A)
	    		{
					AlertDialog.Builder mUpdateDrv = new AlertDialog.Builder(mActivityContext);
					mUpdateDrv.setTitle("ViPER4Android");
					mUpdateDrv.setMessage(getResources().getString(R.string.text_drvvernotmatch));
					mUpdateDrv.setPositiveButton(getResources().getString(R.string.text_yes), new DialogInterface.OnClickListener()
					{
						@Override
						public void onClick(DialogInterface dialog, int which)
						{
		            		// Update the driver
		                	new AlertDialog.Builder(mActivityContext)
		                    .setTitle(R.string.text_select_cpu)
		                    .setIcon(R.drawable.icon)
		                    .setItems(R.array.cpu_platform_fx, new DialogInterface.OnClickListener()
		                    {
		                    	public void onClick(DialogInterface dialog, int which)
		                    	{
		                    		String[] szV4A_CPU = getResources().getStringArray(R.array.cpu_platform_fx_values);
		                    		String V4ALIB = szV4A_CPU[which];
		                    		if (Utils.InstallDrv_FX(V4ASettingsPreference, mActivityContext, V4ALIB))
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
		                    }).setNegativeButton(R.string.text_cancel, new DialogInterface.OnClickListener()
		                    {public void onClick(DialogInterface dialog, int which){ return; }}).create().show();
						}
					});
					mUpdateDrv.setNegativeButton(getResources().getString(R.string.text_no), new DialogInterface.OnClickListener()
					{
						@Override
						public void onClick(DialogInterface dialog, int which) { return; }
					});
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
    	addPreferencesFromResource(R.xml.main_preferences);

    	mKillAllThread = false;

        Log.i("ViPER4Android", "Acquire root permission ...");
        if (!Utils.AcquireRoot())
        {
            AlertDialog.Builder mResult = new AlertDialog.Builder(this);
    		mResult.setTitle("ViPER4Android");
    		mResult.setMessage(getResources().getString(R.string.text_su_missing));
    		mResult.setNegativeButton(getResources().getString(R.string.text_ok), new DialogInterface.OnClickListener()
    		{
    			@Override
    			public void onClick(DialogInterface arg0, int arg1)
    			{ System.exit(0); }
    		});
    		mResult.show();	
        }

        SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
        String szFunctionalToolbox = prefSettings.getString("viper4android.settings.toolbox", "none");
        if (szFunctionalToolbox.equals("none") || szFunctionalToolbox.equals(""))
        {
        	Log.i("ViPER4Android", "Proceed toolbox ...");
        	boolean bToolboxFunctional = Utils.PerformToolboxTest("toolbox", false);
        	String szFunctionalToolboxPathname = Utils.GetToolbox("toolbox");
        	if (szFunctionalToolboxPathname == null) bToolboxFunctional = false;
        	else
        	{
        		if (szFunctionalToolboxPathname.equals(""))
        			bToolboxFunctional = false;
        	}

        	if (bToolboxFunctional)
        	{
        		Editor e = prefSettings.edit();
        		e.putString("viper4android.settings.toolbox", szFunctionalToolboxPathname);
        		e.putString("viper4android.settings.copycmd", "dd");
        		e.commit();
        	}
        	else
        	{
        		bToolboxFunctional = Utils.PerformToolboxTest("busybox", true);
            	szFunctionalToolboxPathname = Utils.GetToolbox("busybox");
            	if (szFunctionalToolboxPathname == null) bToolboxFunctional = false;
            	else
            	{
            		if (szFunctionalToolboxPathname.equals(""))
            			bToolboxFunctional = false;
            	}

               	if (bToolboxFunctional)
            	{
            		Editor e = prefSettings.edit();
            		e.putString("viper4android.settings.toolbox", szFunctionalToolboxPathname);
            		e.putString("viper4android.settings.copycmd", "cp");
            		e.commit();
            	}
               	else
               	{
            		Editor e = prefSettings.edit();
            		e.putString("viper4android.settings.toolbox", "none");
            		e.putString("viper4android.settings.copycmd", "dd");
            		e.commit();

                    AlertDialog.Builder mResult = new AlertDialog.Builder(this);
            		mResult.setTitle("ViPER4Android");
            		mResult.setMessage(getResources().getString(R.string.text_busybox_missing));
            		mResult.setNegativeButton(getResources().getString(R.string.text_ok), new DialogInterface.OnClickListener()
            		{
            			@Override
            			public void onClick(DialogInterface arg0, int arg1)
            			{ System.exit(0); }
            		});
            		mResult.show();
               	}
        	}
        }

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
					{
						Thread.sleep(500);
					}
					catch (InterruptedException e)
					{
						Log.i("ViPER4Android", "Driver check error = " + e.getMessage());
						continue;
					}
				}
				Log.i("ViPER4Android", "Driver check finished");
			}
		});
		driverCheckThread.start();
    }

    @Override
    public void onDestroy()
    {
    	super.onDestroy();

    	Log.i("ViPER4Android", "Main activity onDestroy()");
    	mKillAllThread = true;
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
    			HeadsetService v4aService = ((HeadsetService.LocalBinder)service).getService();
                mHeadsetServiceInstance = v4aService;
                unbindService(this);
            }

            @Override
            public void onServiceDisconnected(ComponentName name)
            {
            	Log.i("ViPER4Android", "ViPER4Android service disconnected.");
            }
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
    	String szLockedEffect = preferences.getString("viper4android.settings.lock_effect", "none");

    	if (bEnableNotify) Log.i("ViPER4Android", "show_notify = true, menu checked.");
    	else Log.i("ViPER4Android", "show_notify = false, menu unchecked.");
    	Log.i("ViPER4Android", "lock_effect = " + szLockedEffect);

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

    	/* TODO: Some android system does not support the menu item with checkbox */
		/*       so these items should move to a setting page */
    	/*
    	MenuItem notifyItem = menu.findItem(R.id.notify);
    	notifyItem.setChecked(bEnableNotify);

    	MenuItem lockEffectItem = menu.findItem(R.id.lockeffect);
    	if (szLockedEffect.equalsIgnoreCase("none"))
    		lockEffectItem.setChecked(false);
    	else lockEffectItem.setChecked(true);
		*/

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

			/* TODO: Some android system does not support the menu item with checkbox */
			/*       so these items should move to a setting page */
           	//item.setChecked(bEnableNotify);

        	Editor e = prefSettings.edit();
        	e.putBoolean("viper4android.settings.show_notify_icon", bEnableNotify);
        	e.commit();
        	if (bEnableNotify)
        	{
        		Log.i("ViPER4Android", "show_notify = true");
        		sendBroadcast(new Intent(ViPER4Android.ACTION_SHOW_NOTIFY));
        	}
        	else
        	{
        		Log.i("ViPER4Android", "show_notify = false");
        		sendBroadcast(new Intent(ViPER4Android.ACTION_CANCEL_NOTIFY));
        	}
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
		        		Utils.UninstallDrv_FX(V4ASettingsPreference, mActivityContext);

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
            	new AlertDialog.Builder(this)
                .setTitle(R.string.text_select_cpu)
                .setIcon(R.drawable.icon)
                .setItems(R.array.cpu_platform_fx, new DialogInterface.OnClickListener()
                {
                	public void onClick(DialogInterface dialog, int which)
                	{
                		String[] szV4A_CPU = getResources().getStringArray(R.array.cpu_platform_fx_values);
                		String V4ALIB = szV4A_CPU[which];
                		if (Utils.InstallDrv_FX(V4ASettingsPreference, mActivityContext, V4ALIB))
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
                }).setNegativeButton(R.string.text_cancel, new DialogInterface.OnClickListener()
                {public void onClick(DialogInterface dialog, int which){ return; }}).create().show();
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
