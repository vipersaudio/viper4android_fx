package com.vipercn.viper4android_v2.activity;

import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
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
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.ViewPager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.service.ViPER4AndroidService;

public final class ViPER4Android extends FragmentActivity
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

        if (mAudioServiceInstance != null)
        {
        	try
        	{
        		if (!mAudioServiceInstance.GetServicePrepared())
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
				String szDrvVer = mAudioServiceInstance.GetDriverVersion();

				Log.i("ViPER4Android", "Proceeding drvier check");
				if (!szApkVer.equalsIgnoreCase(szDrvVer))
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
		String szDriverFile = "libv4a_fx_";

		if (Build.VERSION.SDK_INT >= 18)
			szDriverFile = szDriverFile + "jb_";
		else szDriverFile = szDriverFile + "ics_";

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

    protected MyAdapter pagerAdapter;
    protected ActionBar actionBar;
    protected ViewPager viewPager;

    private ArrayList<String> mProfileList = new ArrayList<String>();
    private boolean mKillAllThread = false;
    private Context mActivityContext = this;
    private ViPER4AndroidService mAudioServiceInstance = null;

    // Driver install handler
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

        // Start background service
        mKillAllThread = false;
        Log.i("ViPER4Android", "Starting service, reason = ViPER4Android::onCreate");
        Intent serviceIntent = new Intent(this, ViPER4AndroidService.class);
        startService(serviceIntent);

        // Setup ui
        setContentView(R.layout.top);
        pagerAdapter = new MyAdapter(getFragmentManager(), this);
        actionBar = getActionBar();
        viewPager = (ViewPager)findViewById(R.id.viewPager);

        // Setup action bar
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
        actionBar.setDisplayShowTitleEnabled(true);
        for (String entry : pagerAdapter.getEntries())
        {
            ActionBar.Tab tab = actionBar.newTab();
            tab.setTabListener(new TabListener()
            {
                @Override public void onTabReselected(Tab tab, FragmentTransaction ft) {}
                @Override public void onTabSelected(Tab tab, FragmentTransaction ft) { viewPager.setCurrentItem(tab.getPosition()); }
                @Override public void onTabUnselected(Tab tab, FragmentTransaction ft) {}
            });
            try
            {
                int stringId = R.string.class.getField(entry + "_title").getInt(null);
                tab.setText(getString(stringId));
            }
            catch (Exception e)
            {
                throw new RuntimeException(e);
            }
            actionBar.addTab(tab);
        }

        // Setup effect setting page
        viewPager.setAdapter(pagerAdapter);
        viewPager.setOnPageChangeListener(new ViewPager.OnPageChangeListener()
        {
            @Override public void onPageSelected(int idx) { actionBar.selectTab(actionBar.getTabAt(idx)); }
            @Override public void onPageScrolled(int arg0, float arg1, int arg2) {}
            @Override public void onPageScrollStateChanged(int arg0) {}
        });

        // Show changelog
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
			SetFirstRun();
			if (!szChangeLog.equalsIgnoreCase(""))
			{
				AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
				mChglog.setTitle(R.string.text_changelog);
				mChglog.setMessage(szChangeLog);
				mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
				mChglog.show();
			}
		}

		// Start active thread
		Thread activeThread = new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				if (CheckSoftwareActive())
				{
					if (SubmitInformation())
						SetSoftwareActive();
				}
			}
		});
		activeThread.start();

		// Start driver check thread
		Thread driverCheckThread = new Thread(new Runnable()
		{
			@Override
			public void run()
			{
				Log.i("ViPER4Android", "Begin driver check ...");
				while (!mKillAllThread)
				{
					if (ProcessDriverCheck()) break;
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

        ServiceConnection connection = new ServiceConnection()
        {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder)
            {
            	ViPER4AndroidService service = ((ViPER4AndroidService.LocalBinder)binder).getService();
                mAudioServiceInstance = service;

                String routing = service.getAudioOutputRouting();
                String[] entries = pagerAdapter.getEntries();
                for (int i = 0; i < entries.length; i++)
                {
                    if (routing.equals(entries[i]))
                    {
                        viewPager.setCurrentItem(i);
                        actionBar.selectTab(actionBar.getTabAt(i));
                        break;
                    }
                }
                unbindService(this);
            }

            @Override
            public void onServiceDisconnected(ComponentName name)
            { Log.i("ViPER4Android", "ViPER4Android service disconnected."); }
        };

        Log.i("ViPER4Android", "Binding service, reason = ViPER4Android::onResume");
        Intent serviceIntent = new Intent(this, ViPER4AndroidService.class);
        bindService(serviceIntent, connection, 0);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
    	Log.i("ViPER4Android", "Enter onCreateOptionsMenu()");
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        Log.i("ViPER4Android", "Exit onCreateOptionsMenu()");
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu)
    {
    	SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
    	boolean bEnableNotify = preferences.getBoolean("viper4android.settings.show_notify_icon", false);
    	String szDriverMode = preferences.getString("viper4android.settings.compatiblemode", "global");

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

    	// Driver mode menu
    	boolean bDriverInGlobalMode = true;
    	if (!szDriverMode.equalsIgnoreCase("global"))
    		bDriverInGlobalMode = false;
    	if (!bDriverInGlobalMode)
    	{
    		/* If the driver is in compatible mode, driver status is invalid */
    		MenuItem miDrvStatus = menu.findItem(R.id.drvstatus);
    		miDrvStatus.setEnabled(false);
    	}
    	else
    	{
    		MenuItem miDrvStatus = menu.findItem(R.id.drvstatus);
    		miDrvStatus.setEnabled(true);
    	}

    	// Driver install/uninstall menu
    	if (mAudioServiceInstance == null)
    	{
    		MenuItem drvInstItem = menu.findItem(R.id.drvinst);
    		String szMenuTitle = getResources().getString(R.string.text_install);
    		drvInstItem.setTitle(szMenuTitle);
    	}
    	else
    	{
    		boolean bDriverIsReady = mAudioServiceInstance.GetDriverIsReady();
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

    // For convenient parameter passing, we use global variable
    private String szSaveProfileNameGlobal = "";

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
    	SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);

        int choice = item.getItemId();
        switch (choice)
        {
	        case R.id.about:
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
				{ szVersion = "N/A"; }
				String szAbout = getResources().getString(R.string.about_text);
				szAbout = String.format(szAbout, szVersion) + "\n";
				szAbout = szAbout + getResources().getString(R.string.text_help_content);
	
				AlertDialog.Builder mHelp = new AlertDialog.Builder(this);
				mHelp.setTitle(getResources().getString(R.string.about_title));
				mHelp.setMessage(szAbout);
				mHelp.setPositiveButton(getResources().getString(R.string.text_ok), new DialogInterface.OnClickListener()
				{ @Override public void onClick(DialogInterface arg0, int arg1) { return; } });
				mHelp.setNegativeButton(getResources().getString(R.string.text_view_forum), new DialogInterface.OnClickListener()
				{
					@Override
					public void onClick(DialogInterface arg0, int arg1)
					{
						Uri uri = Uri.parse(getResources().getString(R.string.text_forum_link));  
				        Intent intent = new Intent(Intent.ACTION_VIEW, uri);  
				        ViPER4Android.this.startActivity(intent);
					}
				});
				mHelp.show();
		        return true;
	        }

	        case R.id.checkupdate:
	        {
				Uri uri = Uri.parse(getResources().getString(R.string.text_updatelink));  
		        Intent intent = new Intent(Intent.ACTION_VIEW, uri);  
		        ViPER4Android.this.startActivity(intent);
	        	return true;
	        }

            case R.id.drvstatus:
            {
                DialogFragment df = new DialogFragment()
                {
					@Override
					public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state)
					{
						if (mAudioServiceInstance == null)
						{
							View v = inflater.inflate(R.layout.drvstatus, null);
							TextView tv = (TextView)v.findViewById(R.id.drv_status);
							tv.setText(R.string.text_service_error);
							return v;
						}
						else
						{
							mAudioServiceInstance.StartStatusUpdating();
							try
							{
								Thread.sleep(500);
							}
							catch (InterruptedException e)
							{
								mAudioServiceInstance.StopStatusUpdating();
								View v = inflater.inflate(R.layout.drvstatus, null);
								TextView tv = (TextView)v.findViewById(R.id.drv_status);
								tv.setText(R.string.text_service_error);
								return v;
							}
							mAudioServiceInstance.StopStatusUpdating();

							String szDrvNEONEnabled = getResources().getString(R.string.text_yes);
							if (!mAudioServiceInstance.GetDriverNEON()) szDrvNEONEnabled = getResources().getString(R.string.text_no);
							String szDrvEnabled = getResources().getString(R.string.text_yes);
							if (!mAudioServiceInstance.GetDriverEnabled()) szDrvEnabled = getResources().getString(R.string.text_no);
							String szDrvUsable = getResources().getString(R.string.text_normal);
							if (!mAudioServiceInstance.GetDriverUsable()) szDrvUsable = getResources().getString(R.string.text_abnormal);
							String szDrvProcess = getResources().getString(R.string.text_yes);
							if (!mAudioServiceInstance.GetDriverProcess()) szDrvProcess = getResources().getString(R.string.text_no);

							String szDrvEffType = getResources().getString(R.string.text_disabled);
							if (mAudioServiceInstance.GetDriverEffectType() == ViPER4AndroidService.V4A_FX_TYPE_HEADPHONE)
								szDrvEffType = getResources().getString(R.string.text_headset);
							else if (mAudioServiceInstance.GetDriverEffectType() == ViPER4AndroidService.V4A_FX_TYPE_SPEAKER)
								szDrvEffType = getResources().getString(R.string.text_speaker);

							String szDrvStatus = "";
							szDrvStatus = getResources().getString(R.string.text_drv_status_view);
							szDrvStatus = String.format(szDrvStatus,
									mAudioServiceInstance.GetDriverVersion(), szDrvNEONEnabled,
									szDrvEnabled, szDrvUsable, szDrvProcess,
									szDrvEffType,
									mAudioServiceInstance.GetDriverSamplingRate(),
									mAudioServiceInstance.GetDriverChannels());

							View v = inflater.inflate(R.layout.drvstatus, null);
							TextView tv = (TextView)v.findViewById(R.id.drv_status);
							tv.setText(szDrvStatus);
							return v;
						}
					}
				};
				df.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		        df.show(getFragmentManager(), "v4astatus");
		        return true;
            }

            case R.id.changelog:
            {
            	// Proceed changelog file name
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
    			catch (Exception e) {}

    			if (szChangeLog.equalsIgnoreCase("")) return true;
    			AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
    			mChglog.setTitle(R.string.text_changelog);
    			mChglog.setMessage(szChangeLog);
    			mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
    			mChglog.show();
            	return true;
            }

            case R.id.loadprofile:
            {
            	// Profiles are stored at external storage
            	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
            		return true;

            	// Lets cache all profiles first
            	String szProfilePath = Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/";
            	mProfileList = Utils.GetProfileList(szProfilePath);
            	if (mProfileList.size() <= 0) return true;
            	String arrayProfileList[] = new String[mProfileList.size()];
            	for (int nPrfIdx = 0; nPrfIdx < mProfileList.size(); nPrfIdx++)
            		arrayProfileList[nPrfIdx] = mProfileList.get(nPrfIdx);

            	// Get current audio mode
            	final int nCurrentPage = actionBar.getSelectedNavigationIndex();

            	// Now please choose which profile you want to load
            	new AlertDialog.Builder(this)
                .setTitle(R.string.text_loadfxprofile)
                .setIcon(R.drawable.icon)
                .setItems(arrayProfileList, new DialogInterface.OnClickListener()
                {
                	public void onClick(DialogInterface dialog, int which)
                	{
                		String szProfilePath = Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/";
						Log.i("ViPER4Android", "Load effect profile, current page = " + nCurrentPage);
						String szPreferenceName[] = new String[3];
						szPreferenceName[0] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".headset";
						szPreferenceName[1] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".speaker";
						szPreferenceName[2] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".bluetooth";

						// Make sure index is in range
						int nIndex = nCurrentPage;
						if (nIndex < 0) nIndex = 0;
						if (nIndex > 2) nIndex = 2;

						// Now load the profile please
                    	String arrayProfileList[] = new String[mProfileList.size()];
                    	for (int nPrfIdx = 0; nPrfIdx < mProfileList.size(); nPrfIdx++)
                    		arrayProfileList[nPrfIdx] = mProfileList.get(nPrfIdx);
                		String szProfileName = arrayProfileList[which];
                		if (Utils.LoadProfile(szProfileName, szProfilePath, szPreferenceName[nIndex], mActivityContext))
                		{
                			AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                			mResult.setTitle("ViPER4Android");
                			mResult.setMessage(getResources().getString(R.string.text_profileload_ok));
                			mResult.setNegativeButton(getResources().getString(R.string.text_ok), new DialogInterface.OnClickListener()
                			{ @Override public void onClick(DialogInterface dialog, int which) { finish(); } });
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
            	// Profiles are stored at external storage
            	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
            		return true;

            	// Get current audio mode
            	final int nCurrentPage = actionBar.getSelectedNavigationIndex();

            	// Now please give me the name of profile
                DialogFragment df = new DialogFragment()
                {
                	private EditText editProfileName = null;

					@Override
					public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state)
					{
						View v = inflater.inflate(R.layout.saveprofile, null);
						editProfileName = (EditText)v.findViewById(R.id.save_profile_name);
						Button btnSaveProfile = (Button)v.findViewById(R.id.profile_save_button);
						btnSaveProfile.setOnClickListener(new OnClickListener()
						{
							public void onClick(View v)
							{
								/* Really sanity check */
								if (editProfileName == null)
								{
									dismiss();
									return;
								}
								if (editProfileName.getText() == null)
								{
									dismiss();
									return;
								}
								if (editProfileName.getText().toString() == null)
								{
									dismiss();
									return;
								}
								/***********************/

								String szProfileName = editProfileName.getText().toString().trim();
								if (szProfileName == null) Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
								else if (szProfileName.equals("")) Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
								else
								{
									// Deal with the directory
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
										// Name already exist, overwritten ?
					        			AlertDialog.Builder mConfirm = new AlertDialog.Builder(mActivityContext);
					        			mConfirm.setTitle("ViPER4Android");
					        			mConfirm.setMessage(getResources().getString(R.string.text_profilesaved_overwrite));
					        			mConfirm.setPositiveButton(getResources().getString(R.string.text_yes), new DialogInterface.OnClickListener()
					        			{
											@Override
											public void onClick(DialogInterface dialog, int which)
											{
												Log.i("ViPER4Android", "Save effect profile, current page = " + nCurrentPage);
												String szPreferenceName[] = new String[3];
												szPreferenceName[0] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".headset";
												szPreferenceName[1] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".speaker";
												szPreferenceName[2] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".bluetooth";
												int nIndex = nCurrentPage;
												if (nIndex < 0) nIndex = 0;
												if (nIndex > 2) nIndex = 2;
												Utils.SaveProfile(szSaveProfileNameGlobal, Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/", szPreferenceName[nIndex], mActivityContext);
												Toast.makeText(mActivityContext, mActivityContext.getResources().getString(R.string.text_profilesaved_ok), Toast.LENGTH_LONG).show();
											}
										});
					        			mConfirm.setNegativeButton(getResources().getString(R.string.text_no), null);
					        			mConfirm.show();
										dismiss();
										return;
									}

									// Save the profile please
									Log.i("ViPER4Android", "Save effect profile, current page = " + nCurrentPage);
									String szPreferenceName[] = new String[3];
									szPreferenceName[0] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".headset";
									szPreferenceName[1] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".speaker";
									szPreferenceName[2] = ViPER4Android.SHARED_PREFERENCES_BASENAME + ".bluetooth";
									int nIndex = nCurrentPage;
									if (nIndex < 0) nIndex = 0;
									if (nIndex > 2) nIndex = 2;
									Utils.SaveProfile(szProfileName, Environment.getExternalStorageDirectory() + "/ViPER4Android/Profile/", szPreferenceName[nIndex], mActivityContext);
									Toast.makeText(mActivityContext, getResources().getString(R.string.text_profilesaved_ok), Toast.LENGTH_LONG).show();
								}
								dismiss();
							}
						});

						Button btnCancelProfile = (Button)v.findViewById(R.id.profile_cancel_button);
						btnCancelProfile.setOnClickListener(new OnClickListener()
						{ public void onClick(View v) { dismiss(); } });

						return v;
					}
				};
				df.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		        df.show(getFragmentManager(), "v4a_saveprofile");
            	return true;
            }

            case R.id.drvinst:
            {
            	String szMenuText = item.getTitle().toString();
            	if (getResources().getString(R.string.text_uninstall).equals(szMenuText))
            	{
            		// Please confirm the process
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

            case R.id.compatible:
            {
            	String szCompatibleMode = prefSettings.getString("viper4android.settings.compatiblemode", "global");
            	int nSelIdx = 0;
            	if (szCompatibleMode.equals("global")) nSelIdx = 0;
            	else nSelIdx = 1;
            	Dialog selectDialog = new AlertDialog.Builder(this)
                .setTitle(R.string.text_commode)
                .setIcon(R.drawable.icon)
                .setSingleChoiceItems(R.array.compatible_mode, nSelIdx, new DialogInterface.OnClickListener()
                {
                	public void onClick(DialogInterface dialog, int which)
                	{
                		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
                		Editor e = prefSettings.edit();
                		switch (which)
                		{
                			case 0: e.putString("viper4android.settings.compatiblemode", "global"); break;
                			case 1: e.putString("viper4android.settings.compatiblemode", "local"); break;
                		}
                		e.commit();
                		// Tell background service to change the mode
                		sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
                		dialog.dismiss();
                	}
                }).setCancelable(false).create();
            	selectDialog.show();
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
                			case 0: e.putString("viper4android.settings.lock_effect", "none"); break;
                			case 1: e.putString("viper4android.settings.lock_effect", "headset"); break;
                			case 2: e.putString("viper4android.settings.lock_effect", "speaker"); break;
                			case 3: e.putString("viper4android.settings.lock_effect", "bluetooth"); break;
                		}
                		e.commit();
                		// Tell background service to change the mode
                		sendBroadcast(new Intent(ViPER4Android.ACTION_UPDATE_PREFERENCES));
                		dialog.dismiss();
                	}
                }).setCancelable(false).create();
            	selectDialog.show();

            	return true;
            }

		    default: return false;
        }
    }
}

class MyAdapter extends FragmentPagerAdapter
{
    private final ArrayList<String> tmpEntries;
    private final String[] entries;

    public MyAdapter(FragmentManager fm, Context context)
    {
        super(fm);

        tmpEntries = new ArrayList<String>();
        tmpEntries.add("headset");
        tmpEntries.add("speaker");
        tmpEntries.add("bluetooth");

        entries = (String[]) tmpEntries.toArray(new String[tmpEntries.size()]);
    }

    public String[] getEntries()
    {
        return entries;
    }

    @Override
    public int getCount()
    {
        return entries.length;
    }

    @Override
    public Fragment getItem(int position)
    {
        final MainDSPScreen dspFragment = new MainDSPScreen();
        Bundle b = new Bundle();
        b.putString("config", entries[position]);
        dspFragment.setArguments(b);
        return dspFragment;
    }
}
