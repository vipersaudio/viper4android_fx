package com.vipercn.viper4android_v2.activity;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
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
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.SystemClock;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.PagerTabStrip;
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

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.service.ViPER4AndroidService;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;

public final class ViPER4Android extends FragmentActivity {

    private boolean checkFirstRun() {
        PackageManager packageMgr = getPackageManager();
        PackageInfo packageInfo;
        String mVersion;
        try {
            packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
            mVersion = packageInfo.versionName;
        } catch (NameNotFoundException e) {
            return false;
        }

        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", 0);
        String mLastVersion = prefSettings.getString("viper4android.settings.lastversion", "");
        return mLastVersion == null || mLastVersion.equals("")
                || !mLastVersion.equalsIgnoreCase(mVersion);
    }

    private void setFirstRun() {
        PackageManager packageMgr = getPackageManager();
        PackageInfo packageInfo;
        String mVersion;
        try {
            packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
            mVersion = packageInfo.versionName;
        } catch (NameNotFoundException e) {
            return;
        }

        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", 0);
        Editor editSettings = prefSettings.edit();
        if (editSettings != null) {
            editSettings.putString("viper4android.settings.lastversion", mVersion);
            editSettings.commit();
        }
    }

    private boolean checkSoftwareActive() {
        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", 0);
        boolean bActived = prefSettings.getBoolean("viper4android.settings.onlineactive", false);
        return !bActived;
    }

    private void setSoftwareActive() {
        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", 0);
        Editor editSettings = prefSettings.edit();
        if (editSettings != null) {
            editSettings.putBoolean("viper4android.settings.onlineactive", true);
            editSettings.commit();
        }
    }

    private boolean submitInformation() {
        String szCode = "";
        byte[] pchHexTab = ("0123456789abcdef").getBytes();
        Random rndMachine = new Random();
        for (int i = 0; i < 8; i++) {
            byte btCode = (byte) rndMachine.nextInt(256);
            if (btCode < 0) {
                short shortData = (short) (256 + btCode);
                szCode = szCode + String.format("%c%c", pchHexTab[shortData >> 4],
                        pchHexTab[shortData & 0x0F]);
            } else {
                szCode = szCode + String.format("%c%c", pchHexTab[btCode >> 4],
                        pchHexTab[btCode & 0x0F]);
            }
        }
        szCode = szCode + "-";
        for (int i = 0; i < 4; i++) {
            byte btCode = (byte) rndMachine.nextInt(256);
            if (btCode < 0) {
                short shortData = (short) (256 + btCode);
                szCode = szCode + String.format("%c%c", pchHexTab[shortData >> 4],
                        pchHexTab[shortData & 0x0F]);
            } else {
                szCode = szCode + String.format("%c%c", pchHexTab[btCode >> 4],
                        pchHexTab[btCode & 0x0F]);
            }
        }
        szCode = szCode + "-" + Build.VERSION.SDK_INT;

        String szURL = "http://vipersaudio.com/stat/v4a_stat.php?code=" + szCode
                + "&ver=viper4android-fx";
        Log.i("ViPER4Android", "Submit code = \"" + szURL + "\"");

        try {
            HttpGet httpRequest = new HttpGet(szURL);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse httpResponse = httpClient.execute(httpRequest);
            return httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK;
        } catch (Exception e) {
            Log.i("ViPER4Android", "Submit failed, error = " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private void processDriverCheck() {
        boolean bDriverIsUsable;

        Utils.AudioEffectUtils aeuUtils = (new Utils()).new AudioEffectUtils();
        if (!aeuUtils.isViPER4AndroidEngineFound()) {
            bDriverIsUsable = false;
        } else {
            PackageManager packageMgr = getPackageManager();
            PackageInfo packageInfo;
            String szApkVer;
            try {
                int[] iaDrvVer = aeuUtils.getViper4AndroidEngineVersion();
                String szDriverVersion = iaDrvVer[0] + "." + iaDrvVer[1] + "." + iaDrvVer[2] + "."
                        + iaDrvVer[3];
                packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
                szApkVer = packageInfo.versionName;
                bDriverIsUsable = szApkVer.equalsIgnoreCase(szDriverVersion);
            } catch (NameNotFoundException e) {
                Log.i("ViPER4Android", "Cannot found ViPER4Android's apk [weird]");
                bDriverIsUsable = true;
            }
        }

        if (!bDriverIsUsable) {
            Log.i("ViPER4Android",
                    "Android audio effect engine reports the v4a driver is not usable");
            Message message = new Message();
            message.what = 0xA00A;
            message.obj = this;
            hProceedDriverHandler.sendMessage(message);
        }
    }

    private static boolean cpuHasQualitySelection() {
        Utils.cpuInfo mCPUInfo = new Utils.cpuInfo();
        return mCPUInfo.hasNEON();
    }

    private static String determineCPUWithDriver(String mQual) {
        String mDriverFile = "libv4a_fx_";

        if (Build.VERSION.SDK_INT >= 18) {
            mDriverFile = mDriverFile + "jb_";
        } else {
            mDriverFile = mDriverFile + "ics_";
        }

        Utils.cpuInfo mCPUInfo = new Utils.cpuInfo();
        if (mCPUInfo.hasNEON()) {
            if (mQual == null) {
                mDriverFile = mDriverFile + "NEON";
            } else if (mQual.equals("")) {
                mDriverFile = mDriverFile + "NEON";
            } else if (mQual.equalsIgnoreCase("sq")) {
                mDriverFile = mDriverFile + "NEON_SQ";
            } else if (mQual.equalsIgnoreCase("hq")) {
                mDriverFile = mDriverFile + "NEON_HQ";
            } else {
                mDriverFile = mDriverFile + "NEON";
            }
        } else if (mCPUInfo.hasVFP()) {
            mDriverFile = mDriverFile + "VFP";
        } else {
            mDriverFile = mDriverFile + "NOVFP";
        }

        mDriverFile = mDriverFile + ".so";
        Log.i("ViPER4Android", "Driver selection = " + mDriverFile);

        return mDriverFile;
    }

    private static String readTextFile(InputStream inputStream) {
        InputStreamReader inputStreamReader;
        try {
            inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            return "";
        }
        BufferedReader reader = new BufferedReader(inputStreamReader);
        StringBuilder sb = new StringBuilder("");
        String line;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
                sb.append("\n");
            }
        } catch (IOException e) {
            return "";
        }
        return sb.toString();
    }

    public static final String SHARED_PREFERENCES_BASENAME = "com.vipercn.viper4android_v2";
    public static final String ACTION_UPDATE_PREFERENCES = "com.vipercn.viper4android_v2.UPDATE";
    public static final String ACTION_SHOW_NOTIFY = "com.vipercn.viper4android_v2.SHOWNOTIFY";
    public static final String ACTION_CANCEL_NOTIFY = "com.vipercn.viper4android_v2.CANCELNOTIFY";
    public static final int NOTIFY_FOREGROUND_ID = 1;

    private MyAdapter pagerAdapter;
    private ActionBar actionBar;
    private ViewPager viewPager;
    private PagerTabStrip pagerTabStrip;
    private ArrayList<String> mProfileList = new ArrayList<String>();
    private final Context mActivityContext = this;
    private ViPER4AndroidService mAudioServiceInstance = null;

    // Driver install handler
    private static final Handler hProceedDriverHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            try {
                if (msg.what == 0xA00A) {
                    if (msg.obj == null) {
                        super.handleMessage(msg);
                        return;
                    }
                    final Context ctxInstance = (Context) msg.obj;
                    AlertDialog.Builder mUpdateDrv = new AlertDialog.Builder(ctxInstance);
                    mUpdateDrv.setTitle("ViPER4Android");
                    mUpdateDrv.setMessage(ctxInstance.getResources().getString(
                            R.string.text_drvvernotmatch));
                    mUpdateDrv.setPositiveButton(
                            ctxInstance.getResources().getString(R.string.text_yes),
                            new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            // Install/Update driver
                            boolean bCanChooseQuality = cpuHasQualitySelection();
                            if (bCanChooseQuality) {
                                new AlertDialog.Builder(ctxInstance)
                                        .setTitle(R.string.text_drvinst_prefer)
                                        .setIcon(R.drawable.icon)
                                        .setItems(R.array.drvinst_prefer, new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        String[] szQual = ctxInstance.getResources().getStringArray(
                                                R.array.drvinst_prefer_values);
                                        final String szResult = szQual[which];
                                        if (szResult.equalsIgnoreCase("sq")) {
                                            AlertDialog.Builder mSQWarn = new AlertDialog.Builder(ctxInstance);
                                            mSQWarn.setTitle("ViPER4Android");
                                            mSQWarn.setMessage(ctxInstance.getResources().getString(R.string.text_drvinst_sqdrv));
                                            mSQWarn.setPositiveButton(ctxInstance.getResources().getString(R.string.text_ok),
                                                    new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface dialog,int which) {
                                                    if (!Utils.isBusyBoxInstalled(ctxInstance)) {
                                                        AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                                        mResult.setTitle("ViPER4Android");
                                                        mResult.setMessage(ctxInstance.getResources().getString(
                                                                R.string.text_busybox_not_installed));
                                                        mResult.setNegativeButton(ctxInstance.getResources().getString(
                                                                R.string.text_ok), null);
                                                        mResult.show();
                                                    }

                                                    if (Utils.InstallDrv_FX(ctxInstance,
                                                            determineCPUWithDriver(szResult))) {
                                                        AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                                        mResult.setTitle("ViPER4Android");
                                                        mResult.setMessage(ctxInstance.getResources().getString(
                                                                R.string.text_drvinst_ok));
                                                        mResult.setNegativeButton(ctxInstance.getResources()
                                                                .getString(R.string.text_ok), null);
                                                        mResult.show();
                                                    } else {
                                                        AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                                        mResult.setTitle("ViPER4Android");
                                                        mResult.setMessage(ctxInstance.getResources().getString(
                                                                R.string.text_drvinst_failed));
                                                        mResult.setNegativeButton(ctxInstance.getResources().getString(
                                                                R.string.text_ok), null);
                                                        mResult.show();
                                                    }
                                                    dialog.dismiss();

                                                    if (!Utils.buildPropOk(ctxInstance)) {
                                                        Log.i("ViPER4Android", "Build.prop modifications failed.");
                                                    }
                                                }
                                            });
                                            mSQWarn.setNegativeButton(ctxInstance.getResources().getString(R.string.text_cancel),
                                                    new DialogInterface.OnClickListener() {
                                                @Override
                                                public void onClick(DialogInterface dialog,int which) {
                                                    dialog.dismiss();
                                                }
                                            });
                                            mSQWarn.show();
                                        } else {
                                            if (!Utils.isBusyBoxInstalled(ctxInstance)) {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder( ctxInstance);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(ctxInstance.getResources()
                                                        .getString(R.string.text_busybox_not_installed));
                                                mResult.setNegativeButton(ctxInstance.getResources()
                                                        .getString(R.string.text_ok),null);
                                                mResult.show();
                                            }

                                            if (Utils.InstallDrv_FX(ctxInstance,
                                                    determineCPUWithDriver(szResult))) {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder( ctxInstance);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(ctxInstance.getResources()
                                                        .getString(R.string.text_drvinst_ok));
                                                mResult.setNegativeButton(ctxInstance.getResources()
                                                        .getString(R.string.text_ok),null);
                                                mResult.show();
                                            } else {
                                                AlertDialog.Builder mResult= new AlertDialog.Builder(ctxInstance);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(ctxInstance.getResources()
                                                        .getString(R.string.text_drvinst_failed));
                                                mResult.setNegativeButton(ctxInstance.getResources()
                                                        .getString(R.string.text_ok),null);
                                                mResult.show();
                                            }

                                            if (!Utils.buildPropOk(ctxInstance)) {
                                                Log.i("ViPER4Android", "Build.prop modifications failed.");
                                            }
                                        }
                                    }
                                })
                                .setNegativeButton(R.string.text_cancel,
                                        new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                    }
                                }).create().show();
                            } else {
                                String mDriverFileName = determineCPUWithDriver("");

                                if (!Utils.isBusyBoxInstalled(ctxInstance)) {
                                    AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                    mResult.setTitle("ViPER4Android");
                                    mResult.setMessage(ctxInstance.getResources()
                                            .getString(R.string.text_busybox_not_installed));
                                    mResult.setNegativeButton(ctxInstance.getResources()
                                            .getString(R.string.text_ok), null);
                                    mResult.show();
                                }

                                if (Utils.InstallDrv_FX(ctxInstance, mDriverFileName)) {
                                    AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                    mResult.setTitle("ViPER4Android");
                                    mResult.setMessage(ctxInstance.getResources()
                                            .getString(R.string.text_drvinst_ok));
                                    mResult.setNegativeButton(ctxInstance.getResources()
                                            .getString(R.string.text_ok), null);
                                    mResult.show();
                                } else {
                                    AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                    mResult.setTitle("ViPER4Android");
                                    mResult.setMessage(ctxInstance.getResources()
                                            .getString(R.string.text_drvinst_failed));
                                    mResult.setNegativeButton(ctxInstance.getResources()
                                            .getString(R.string.text_ok), null);
                                    mResult.show();
                                }

                                if (!Utils.buildPropOk(ctxInstance)) {
                                    Log.i("ViPER4Android", "Build.prop modifications failed.");
                                }
                            }
                        }
                    });
                    mUpdateDrv.setNegativeButton(ctxInstance.getResources().getString(R.string.text_no),
                            new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                        }
                    });
                    mUpdateDrv.show();
                }
                super.handleMessage(msg);
            } catch (Exception e) {
                super.handleMessage(msg);
            }
        }
    };

    private final ServiceConnection mAudioServiceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            ViPER4AndroidService service;
            service = ((ViPER4AndroidService.LocalBinder) binder).getService();
            mAudioServiceInstance = service;
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            Log.i("ViPER4Android", "ViPER4Android service disconnected.");
        }
    };

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load jni first
        boolean jniLoaded = V4AJniInterface.CheckLibrary();
        Log.i("ViPER4Android", "Jni library status = " + jniLoaded);

        // Welcome window
        if (checkFirstRun()) {
            // TODO: Welcome window
        }

        // Start background service
        Log.i("ViPER4Android", "Starting service, reason = ViPER4Android::onCreate");
        Intent serviceIntent = new Intent(this, ViPER4AndroidService.class);
        startService(serviceIntent);
        bindService(serviceIntent, mAudioServiceConnection, BIND_IMPORTANT);

        // Setup ui
        setContentView(R.layout.top);
        pagerAdapter = new MyAdapter(getFragmentManager(), mActivityContext);
        actionBar = getActionBar();
        viewPager = (ViewPager) findViewById(R.id.viewPager);
        pagerTabStrip = (PagerTabStrip) findViewById(R.id.pagerTabStrip);

        actionBar.setDisplayShowTitleEnabled(true);

        viewPager.setAdapter(pagerAdapter);
        pagerTabStrip.setDrawFullUnderline(true);
        pagerTabStrip
                .setTabIndicatorColor(getResources().getColor(android.R.color.holo_blue_light));

        // Show changelog
        if (checkFirstRun()) {
            String mLocale = Locale.getDefault().getLanguage() + "_"
                    + Locale.getDefault().getCountry();
            String mChangelog_AssetsName = "Changelog_";
            if (mLocale.equalsIgnoreCase("zh_CN")) {
                mChangelog_AssetsName = mChangelog_AssetsName + "zh_CN";
            } else if (mLocale.equalsIgnoreCase("zh_TW")) {
                mChangelog_AssetsName = mChangelog_AssetsName + "zh_TW";
            } else {
                mChangelog_AssetsName = mChangelog_AssetsName + "en_US";
            }
            mChangelog_AssetsName = mChangelog_AssetsName + ".txt";

            String mChangeLog = "";
            InputStream isHandle;
            try {
                isHandle = getAssets().open(mChangelog_AssetsName);
                mChangeLog = readTextFile(isHandle);
                isHandle.close();
            } catch (Exception e) {
            }
            setFirstRun();
            if (!mChangeLog.equalsIgnoreCase("")) {
                AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
                mChglog.setTitle(R.string.text_changelog);
                mChglog.setMessage(mChangeLog);
                mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
                mChglog.show();
            }
        }

        // Start active thread
        Thread activeThread = new Thread(new Runnable() {
            @Override
            public void run() {
                if (checkSoftwareActive()) {
                    if (submitInformation()) {
                        setSoftwareActive();
                    }
                }
            }
        });
        activeThread.start();

        // Start post init thread
        Thread postInitThread = new Thread(new Runnable() {
            @Override
            public void run() {
                // Init environment
                Log.i("ViPER4Android", "Init environment");
                StaticEnvironment.initEnvironment();

                // Driver check loop
                Log.i("ViPER4Android", "Check driver");
                processDriverCheck();
            }
        });
        postInitThread.start();
    }

    @Override
    public void onDestroy() {
        Log.i("ViPER4Android", "Main activity onDestroy()");
        unbindService(mAudioServiceConnection);
        mAudioServiceInstance = null;
        super.onDestroy();
    }

    @Override
    public void onResume() {
        Log.i("ViPER4Android", "Main activity onResume()");

        super.onResume();

        String routing = ViPER4AndroidService.getAudioOutputRouting(getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE));
        String[] entries = pagerAdapter.getEntries();
        for (int i = 0; i < entries.length; i++) {
            if (routing.equals(entries[i])) {
                viewPager.setCurrentItem(i);
                break;
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        SharedPreferences preferences = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
        boolean bEnableNotify = preferences.getBoolean("viper4android.settings.show_notify_icon", false);
        String mDriverMode = preferences.getString("viper4android.settings.compatiblemode", "global");

        /* Just for debug */
        String szLockedEffect = preferences.getString("viper4android.settings.lock_effect", "none");
        Log.i("ViPER4Android", "lock_effect = " + szLockedEffect);
        /******************/

        // Notification icon menu
        if (bEnableNotify) {
            MenuItem mNotify = menu.findItem(R.id.notify);
            String mNotifyTitle = getResources().getString(R.string.text_hidetrayicon);
            mNotify.setTitle(mNotifyTitle);
        } else {
            MenuItem miNotify = menu.findItem(R.id.notify);
            String szNotifyTitle = getResources().getString(R.string.text_showtrayicon);
            miNotify.setTitle(szNotifyTitle);
        }

        // Driver mode menu
        boolean isDriverInGlobalMode = true;
        if (!mDriverMode.equalsIgnoreCase("global")) {
            isDriverInGlobalMode = false;
        }
        if (!isDriverInGlobalMode) {
            /* If the driver is in compatible mode, driver status is invalid */
            MenuItem mDrvStatus = menu.findItem(R.id.drvstatus);
            mDrvStatus.setEnabled(false);
        } else {
            MenuItem miDrvStatus = menu.findItem(R.id.drvstatus);
            miDrvStatus.setEnabled(true);
        }

        // Driver install/uninstall menu
        if (mAudioServiceInstance == null) {
            MenuItem drvInstItem = menu.findItem(R.id.drvinst);
            String menuTitle = getResources().getString(R.string.text_install);
            drvInstItem.setTitle(menuTitle);
            if (!StaticEnvironment.isEnvironmentInitialized()) {
                drvInstItem.setEnabled(false);
            } else {
                drvInstItem.setEnabled(true);
            }
        } else {
            boolean isDriverReady = mAudioServiceInstance.getDriverIsReady();
            if (isDriverReady) {
                MenuItem drvInstItem = menu.findItem(R.id.drvinst);
                String menuTitle = getResources().getString(R.string.text_uninstall);
                drvInstItem.setTitle(menuTitle);
                if (!StaticEnvironment.isEnvironmentInitialized()) {
                    drvInstItem.setEnabled(false);
                } else {
                    drvInstItem.setEnabled(true);
                }
            } else {
                MenuItem drvInstItem = menu.findItem(R.id.drvinst);
                String menuTitle = getResources().getString(R.string.text_install);
                drvInstItem.setTitle(menuTitle);
                if (!StaticEnvironment.isEnvironmentInitialized()) {
                    drvInstItem.setEnabled(false);
                } else {
                    drvInstItem.setEnabled(true);
                }
            }
        }

        // Load&save profile menu
        MenuItem mSaveProfile = menu.findItem(R.id.saveprofile);
        MenuItem mLoadProfile = menu.findItem(R.id.loadprofile);
        if (!StaticEnvironment.isEnvironmentInitialized()) {
            mSaveProfile.setEnabled(false);
            mLoadProfile.setEnabled(false);
        } else {
            mSaveProfile.setEnabled(true);
            mLoadProfile.setEnabled(true);
        }

        return super.onPrepareOptionsMenu(menu);
    }

    // For convenient parameter passing, we use global variable
    private String mSaveProfileNameGlobal = "";

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);

        int choice = item.getItemId();
        switch (choice) {
            case R.id.about: {
                PackageManager packageMgr = getPackageManager();
                PackageInfo packageInfo;
                String mVersion;
                try {
                    packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
                    mVersion = packageInfo.versionName;
                } catch (NameNotFoundException e) {
                    mVersion = "N/A";
                }
                String mAbout = getResources().getString(R.string.about_text);
                mAbout = String.format(mAbout, mVersion) + "\n";
                mAbout = mAbout + getResources().getString(R.string.text_help_content);

                AlertDialog.Builder mHelp = new AlertDialog.Builder(this);
                mHelp.setTitle(getResources().getString(R.string.about_title));
                mHelp.setMessage(mAbout);
                mHelp.setPositiveButton(getResources().getString(R.string.text_ok),
                        new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                    }
                });
                mHelp.setNegativeButton(getResources().getString(R.string.text_view_forum),
                        new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        Uri uri = Uri.parse(getResources().getString(
                                R.string.text_forum_link));
                        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                        ViPER4Android.this.startActivity(intent);
                    }
                });
                mHelp.show();
                return true;
            }

            case R.id.checkupdate: {
                Uri uri = Uri.parse(getResources().getString(R.string.text_updatelink));
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                ViPER4Android.this.startActivity(intent);
                return true;
            }

            case R.id.drvstatus: {
                DialogFragment df = new DialogFragment() {
                    @Override
                    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                            Bundle state) {
                        if (mAudioServiceInstance == null) {
                            View v = inflater.inflate(R.layout.drvstatus, null);
                            TextView tv = (TextView) v.findViewById(R.id.drv_status);
                            tv.setText(R.string.text_service_error);
                            return v;
                        } else {
                            mAudioServiceInstance.startStatusUpdating();
                            SystemClock.sleep(500);
                            mAudioServiceInstance.stopStatusUpdating();

                            String mDrvNEONEnabled = getResources().getString(R.string.text_yes);
                            if (!mAudioServiceInstance.getDriverNEON()) {
                                mDrvNEONEnabled = getResources().getString(R.string.text_no);
                            }
                            String mDrvEnabled = getResources().getString(R.string.text_yes);
                            if (!mAudioServiceInstance.getDriverEnabled()) {
                                mDrvEnabled = getResources().getString(R.string.text_no);
                            }
                            String mDrvUsable = getResources().getString(R.string.text_normal);
                            if (!mAudioServiceInstance.getDriverUsable()) {
                                mDrvUsable = getResources().getString(R.string.text_abnormal);
                            }
                            String mDrvProcess = getResources().getString(R.string.text_yes);
                            if (!mAudioServiceInstance.getDriverProcess()) {
                                mDrvProcess = getResources().getString(R.string.text_no);
                            }

                            String mDrvEffType = getResources().getString(R.string.text_disabled);
                            if (mAudioServiceInstance.getDriverEffectType()
                                    == ViPER4AndroidService.V4A_FX_TYPE_HEADPHONE) {
                                mDrvEffType = getResources().getString(R.string.text_headset);
                            } else if (mAudioServiceInstance.getDriverEffectType()
                                    == ViPER4AndroidService.V4A_FX_TYPE_SPEAKER) {
                                mDrvEffType = getResources().getString(R.string.text_speaker);
                            }

                            Utils.AudioEffectUtils aeuUtils = (new Utils()).new AudioEffectUtils();
                            int[] iaDrvVer = aeuUtils.getViper4AndroidEngineVersion();
                            String mDriverVersion = iaDrvVer[0] + "." + iaDrvVer[1] + "."
                                    + iaDrvVer[2] + "." + iaDrvVer[3];

                            String mDrvStatus;
                            mDrvStatus = getResources().getString(R.string.text_drv_status_view);
                            mDrvStatus = String.format(mDrvStatus,
                                    mDriverVersion, mDrvNEONEnabled,
                                    mDrvEnabled, mDrvUsable, mDrvProcess,
                                    mDrvEffType,
                                    mAudioServiceInstance.getDriverSamplingRate(),
                                    mAudioServiceInstance.getDriverChannels());

                            View v = inflater.inflate(R.layout.drvstatus, null);
                            TextView tv = (TextView) v.findViewById(R.id.drv_status);
                            tv.setText(mDrvStatus);
                            return v;
                        }
                    }
                };
                df.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
                df.show(getFragmentManager(), "v4astatus");
                return true;
            }

            case R.id.changelog: {
                // Proceed changelog file name
                String mLocale = Locale.getDefault().getLanguage() + "_"
                        + Locale.getDefault().getCountry();
                String mChangelog_AssetsName = "Changelog_";
                if (mLocale.equalsIgnoreCase("zh_CN")) {
                    mChangelog_AssetsName = mChangelog_AssetsName + "zh_CN";
                } else if (mLocale.equalsIgnoreCase("zh_TW")) {
                    mChangelog_AssetsName = mChangelog_AssetsName + "zh_TW";
                } else {
                    mChangelog_AssetsName = mChangelog_AssetsName + "en_US";
                }
                mChangelog_AssetsName = mChangelog_AssetsName + ".txt";

                String mChangeLog = "";
                InputStream isHandle;
                try {
                    isHandle = getAssets().open(mChangelog_AssetsName);
                    mChangeLog = readTextFile(isHandle);
                    isHandle.close();
                } catch (Exception e) {
                }

                if (mChangeLog.equalsIgnoreCase("")) {
                    return true;
                }
                AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
                mChglog.setTitle(R.string.text_changelog);
                mChglog.setMessage(mChangeLog);
                mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
                mChglog.show();
                return true;
            }

            case R.id.loadprofile: {
                // Profiles are stored at external storage
                if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
                    return true;
                }

                // Lets cache all profiles first
                String szProfilePath = StaticEnvironment.getV4aProfilePath();
                mProfileList = Utils.getProfileList(szProfilePath);
                if (mProfileList.size() <= 0) {
                    return true;
                }
                String arrayProfileList[] = new String[mProfileList.size()];
                for (int mProfileIndex = 0; mProfileIndex < mProfileList.size(); mProfileIndex++) {
                    arrayProfileList[mProfileIndex] = mProfileList.get(mProfileIndex);
                }

                // Get current audio mode
                final int mCurrentPage = actionBar.getSelectedNavigationIndex();

                // Now please choose which profile you want to load
                new AlertDialog.Builder(this)
                        .setTitle(R.string.text_loadfxprofile)
                        .setIcon(R.drawable.icon)
                        .setItems(arrayProfileList, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        String mProfilePath = StaticEnvironment.getV4aProfilePath();
                        Log.i("ViPER4Android", "Load effect profile, current page = " + mCurrentPage);
                        String mPreferenceName[] = new String[3];
                        mPreferenceName[0] = SHARED_PREFERENCES_BASENAME + ".headset";
                        mPreferenceName[1] = SHARED_PREFERENCES_BASENAME + ".speaker";
                        mPreferenceName[2] = SHARED_PREFERENCES_BASENAME + ".bluetooth";

                        // Make sure index is in range
                        int nIndex = mCurrentPage;
                        if (nIndex < 0) {
                            nIndex = 0;
                        }
                        if (nIndex > 2) {
                            nIndex = 2;
                        }

                        // Now load the profile please
                        String arrayProfileList[] = new String[mProfileList.size()];
                        for (int mProfileIndex = 0; mProfileIndex < mProfileList.size(); mProfileIndex++) {
                            arrayProfileList[mProfileIndex] = mProfileList.get(mProfileIndex);
                        }
                        String mProfileName = arrayProfileList[which];
                        if (Utils.loadProfile(mProfileName, mProfilePath,
                                mPreferenceName[nIndex], mActivityContext)) {
                            AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                            mResult.setTitle("ViPER4Android");
                            mResult.setMessage(getResources().getString(R.string.text_profileload_ok));
                            mResult.setNegativeButton(getResources().getString(R.string.text_ok),
                                    new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    finish();
                                }
                            });
                            mResult.show();
                        } else {
                            AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                            mResult.setTitle("ViPER4Android");
                            mResult.setMessage(getResources().getString(R.string.text_profileload_err));
                            mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
                            mResult.show();
                        }
                    }
                })
                .setNegativeButton(R.string.text_cancel,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                    }
                    }).create().show();

                return true;
            }

            case R.id.saveprofile: {
                // Profiles are stored at external storage
                if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
                    return true;
                }

                // Get current audio mode
                final int mCurrentPage = actionBar.getSelectedNavigationIndex();

                // Now please give me the name of profile
                DialogFragment df = new DialogFragment() {
                    private EditText editProfileName = null;

                    @Override
                    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                            Bundle state) {
                        View v = inflater.inflate(R.layout.saveprofile, null);
                        editProfileName = (EditText) v.findViewById(R.id.save_profile_name);
                        Button btnSaveProfile = (Button) v.findViewById(R.id.profile_save_button);
                        btnSaveProfile.setOnClickListener(new OnClickListener() {
                            public void onClick(View v) {
                                /* Really sanity check */
                                if (editProfileName == null) {
                                    dismiss();
                                    return;
                                }
                                if (editProfileName.getText() == null) {
                                    dismiss();
                                    return;
                                }
                                if (editProfileName.getText().toString() == null) {
                                    dismiss();
                                    return;
                                }
                                /***********************/

                                String mProfileName = editProfileName.getText().toString().trim();
                                if (mProfileName == null) {
                                    Toast.makeText(mActivityContext, getResources().getString(
                                            R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
                                } else if (mProfileName.equals("")) {
                                    Toast.makeText(mActivityContext, getResources().getString(
                                            R.string.text_profilesaved_err), Toast.LENGTH_LONG).show();
                                } else {
                                    // Deal with the directory
                                    String mProfilePath = StaticEnvironment.getV4aProfilePath();
                                    File mProfileDir = new File(mProfilePath);
                                    if (!mProfileDir.exists()) {
                                        boolean mActionOk = mProfileDir.mkdirs();
                                        mActionOk &= mProfileDir.mkdir();
                                        if (!mActionOk) {
                                            Toast.makeText(mActivityContext, getResources().getString(
                                                    R.string.text_rwsd_error), Toast.LENGTH_LONG).show();
                                            dismiss();
                                            return;
                                        }
                                    }
                                    mProfileDir = new File(mProfilePath);
                                    if (!mProfileDir.exists()) {
                                        Toast.makeText(mActivityContext,getResources().getString(
                                                R.string.text_rwsd_error), Toast.LENGTH_LONG).show();
                                        dismiss();
                                        return;
                                    }

                                    mSaveProfileNameGlobal = mProfileName;
                                    if (Utils.checkProfileExists(mProfileName,
                                            StaticEnvironment.getV4aProfilePath())) {
                                        // Name already exist, overwritten ?
                                        AlertDialog.Builder mConfirm = new AlertDialog.Builder(
                                                mActivityContext);
                                        mConfirm.setTitle("ViPER4Android");
                                        mConfirm.setMessage(getResources().getString(
                                                R.string.text_profilesaved_overwrite));
                                        mConfirm.setPositiveButton(getResources().getString(
                                                R.string.text_yes), new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface dialog, int which) {
                                                Log.i("ViPER4Android", "Save effect profile, current page = "
                                                                + mCurrentPage);
                                                String szPreferenceName[] = new String[3];
                                                szPreferenceName[0] = SHARED_PREFERENCES_BASENAME + ".headset";
                                                szPreferenceName[1] = SHARED_PREFERENCES_BASENAME + ".speaker";
                                                szPreferenceName[2] = SHARED_PREFERENCES_BASENAME + ".bluetooth";
                                                int mIndex = mCurrentPage;
                                                if (mIndex < 0) {
                                                    mIndex = 0;
                                                }
                                                if (mIndex > 2) {
                                                    mIndex = 2;
                                                }
                                                Utils.saveProfile(mSaveProfileNameGlobal,
                                                        StaticEnvironment.getV4aProfilePath(),
                                                        szPreferenceName[mIndex], mActivityContext);
                                                Toast.makeText(mActivityContext, mActivityContext.getResources()
                                                        .getString(R.string.text_profilesaved_ok),
                                                        Toast.LENGTH_LONG).show();
                                            }
                                        });
                                        mConfirm.setNegativeButton(getResources().getString(R.string.text_no), null);
                                        mConfirm.show();
                                        dismiss();
                                        return;
                                    }

                                    // Save the profile please
                                    Log.i("ViPER4Android", "Save effect profile, current page = "+ mCurrentPage);
                                    String szPreferenceName[] = new String[3];
                                    szPreferenceName[0] = SHARED_PREFERENCES_BASENAME + ".headset";
                                    szPreferenceName[1] = SHARED_PREFERENCES_BASENAME + ".speaker";
                                    szPreferenceName[2] = SHARED_PREFERENCES_BASENAME+ ".bluetooth";
                                    int nIndex = mCurrentPage;
                                    if (nIndex < 0) {
                                        nIndex = 0;
                                    }
                                    if (nIndex > 2) {
                                        nIndex = 2;
                                    }
                                    Utils.saveProfile(mProfileName, StaticEnvironment.getV4aProfilePath(),
                                            szPreferenceName[nIndex], mActivityContext);
                                    Toast.makeText(mActivityContext, getResources().getString(
                                            R.string.text_profilesaved_ok), Toast.LENGTH_LONG).show();
                                }
                                dismiss();
                            }
                        });

                        Button btnCancelProfile = (Button) v.findViewById(R.id.profile_cancel_button);
                        btnCancelProfile.setOnClickListener(new OnClickListener() {
                            public void onClick(View v) {
                                dismiss();
                            }
                        });

                        return v;
                    }
                };
                df.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
                df.show(getFragmentManager(), "v4a_saveprofile");
                return true;
            }

            case R.id.drvinst: {
                String menuText = item.getTitle().toString();
                if (getResources().getString(R.string.text_uninstall).equals(menuText)) {
                    // Please confirm the process
                    AlertDialog.Builder mConfirm = new AlertDialog.Builder(this);
                    mConfirm.setTitle("ViPER4Android");
                    mConfirm.setMessage(getResources().getString(R.string.text_drvuninst_confim));
                    mConfirm.setPositiveButton(getResources().getString(R.string.text_yes),
                            new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            // Uninstall driver
                            Utils.uninstallDrv_FX();
                            AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                            mResult.setTitle("ViPER4Android");
                            mResult.setMessage(getResources().getString(R.string.text_drvuninst_ok));
                            mResult.setNegativeButton(getResources().getString(R.string.text_ok), null);
                            mResult.show();
                        }
                    });
                    mConfirm.setNegativeButton(getResources().getString(R.string.text_no), null);
                    mConfirm.show();
                } else if (getResources().getString(R.string.text_install).equals(menuText)) {
                    // Install driver
                    boolean bCanChooseQuality = cpuHasQualitySelection();
                    if (bCanChooseQuality) {
                        new AlertDialog.Builder(mActivityContext)
                                .setTitle(R.string.text_drvinst_prefer)
                                .setIcon(R.drawable.icon)
                                .setItems(R.array.drvinst_prefer,
                                new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                String[] mQual = mActivityContext.getResources()
                                        .getStringArray(R.array.drvinst_prefer_values);
                                final String mResult = mQual[which];
                                if (mResult.equalsIgnoreCase("sq")) {
                                    AlertDialog.Builder mSQWarn = new AlertDialog.Builder(mActivityContext);
                                    mSQWarn.setTitle("ViPER4Android");
                                    mSQWarn.setMessage(mActivityContext.getResources()
                                            .getString(R.string.text_drvinst_sqdrv));
                                    mSQWarn.setPositiveButton(
                                            mActivityContext.getResources().getString(R.string.text_ok),
                                            new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            if (Utils.InstallDrv_FX(mActivityContext,
                                                    determineCPUWithDriver(mResult))) {
                                                AlertDialog.Builder mResult= new AlertDialog.Builder(mActivityContext);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(mActivityContext.getResources()
                                                        .getString(R.string.text_drvinst_ok));
                                                mResult.setNegativeButton(mActivityContext.getResources()
                                                        .getString(R.string.text_ok), null);
                                                mResult.show();
                                            } else {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(mActivityContext.getResources()
                                                        .getString(R.string.text_drvinst_failed));
                                                mResult.setNegativeButton(mActivityContext.getResources()
                                                        .getString(R.string.text_ok), null);
                                                mResult.show();
                                            }
                                            dialog.dismiss();
                                        }
                                    });
                                    mSQWarn.setNegativeButton(mActivityContext.getResources()
                                            .getString(R.string.text_cancel),
                                            new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.dismiss();
                                        }
                                    });
                                    mSQWarn.show();
                                } else {
                                    if (Utils.InstallDrv_FX(mActivityContext,
                                            determineCPUWithDriver(mResult))) {
                                        AlertDialog.Builder result = new AlertDialog.Builder(mActivityContext);
                                        result.setTitle("ViPER4Android");
                                        result.setMessage(mActivityContext.getResources().getString(
                                                R.string.text_drvinst_ok));
                                        result.setNegativeButton(mActivityContext.getResources()
                                                .getString(R.string.text_ok), null);
                                        result.show();
                                    } else {
                                        AlertDialog.Builder result = new AlertDialog.Builder(mActivityContext);
                                        result.setTitle("ViPER4Android");
                                        result.setMessage(mActivityContext.getResources().getString(
                                                R.string.text_drvinst_failed));
                                        result.setNegativeButton(mActivityContext.getResources()
                                                .getString(R.string.text_ok), null);
                                        result.show();
                                    }
                                }
                            }
                        })
                        .setNegativeButton(R.string.text_cancel,
                                new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                            }
                        }).create().show();
                    } else {
                        String mDriverFileName = determineCPUWithDriver("");
                        if (Utils.InstallDrv_FX(mActivityContext, mDriverFileName)) {
                            AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                            mResult.setTitle("ViPER4Android");
                            mResult.setMessage(mActivityContext.getResources().getString(
                                    R.string.text_drvinst_ok));
                            mResult.setNegativeButton(
                                    mActivityContext.getResources().getString(R.string.text_ok),
                                    null);
                            mResult.show();
                        } else {
                            AlertDialog.Builder mResult = new AlertDialog.Builder(mActivityContext);
                            mResult.setTitle("ViPER4Android");
                            mResult.setMessage(mActivityContext.getResources().getString(
                                    R.string.text_drvinst_failed));
                            mResult.setNegativeButton(
                                    mActivityContext.getResources().getString(R.string.text_ok),
                                    null);
                            mResult.show();
                        }
                    }
                } else {
                    String szTip = getResources().getString(R.string.text_service_error);
                    Toast.makeText(this, szTip, Toast.LENGTH_LONG).show();
                }
                return true;
            }

            case R.id.uiprefer: {
                int nUIPrefer = prefSettings.getInt("viper4android.settings.uiprefer", 0);
                if ((nUIPrefer < 0) || (nUIPrefer > 2)) {
                    nUIPrefer = 0;
                }
                Dialog selectDialog = new AlertDialog.Builder(this)
                        .setTitle(R.string.text_uiprefer_dialog)
                        .setIcon(R.drawable.icon)
                        .setSingleChoiceItems(R.array.ui_prefer, nUIPrefer,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        if ((which < 0) || (which > 2)) {
                            which = 0;
                        }
                        SharedPreferences prefSettings = getSharedPreferences(
                                SHARED_PREFERENCES_BASENAME + ".settings",
                                MODE_PRIVATE);
                        int nOldSelIdx = prefSettings.getInt(
                                "viper4android.settings.uiprefer", 0);
                        if (nOldSelIdx == which) {
                            dialog.dismiss();
                            return;
                        }
                        Editor e = prefSettings.edit();
                        e.putInt("viper4android.settings.uiprefer", which);
                        e.commit();
                        sendBroadcast(new Intent(ACTION_UPDATE_PREFERENCES));
                        dialog.dismiss();
                        finish();
                    }
                }).setCancelable(false).create();
                selectDialog.show();
                return true;
            }

            case R.id.compatible: {
                String mCompatibleMode = prefSettings.getString(
                        "viper4android.settings.compatiblemode", "global");
                int mSelectIndex;
                if (mCompatibleMode.equals("global")) {
                    mSelectIndex = 0;
                } else {
                    mSelectIndex = 1;
                }
                Dialog selectDialog = new AlertDialog.Builder(this)
                        .setTitle(R.string.text_commode)
                        .setIcon(R.drawable.icon)
                        .setSingleChoiceItems(R.array.compatible_mode, mSelectIndex,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        SharedPreferences prefSettings = getSharedPreferences(
                                SHARED_PREFERENCES_BASENAME + ".settings",
                                MODE_PRIVATE);
                        Editor e = prefSettings.edit();
                        switch (which) {
                            case 0:
                                e.putString(
                                        "viper4android.settings.compatiblemode",
                                        "global");
                                break;
                            case 1:
                                e.putString(
                                        "viper4android.settings.compatiblemode",
                                        "local");
                                break;
                        }
                        e.commit();
                        dialog.dismiss();
                    }
                }).setCancelable(false).create();
                selectDialog.show();
                return true;
            }

            case R.id.notify: {
                boolean enableNotify = prefSettings.getBoolean(
                        "viper4android.settings.show_notify_icon", false);
                enableNotify = !enableNotify;
                if (enableNotify) {
                    item.setTitle(getResources().getString(R.string.text_hidetrayicon));
                } else {
                    item.setTitle(getResources().getString(R.string.text_showtrayicon));
                }
                Editor e = prefSettings.edit();
                e.putBoolean("viper4android.settings.show_notify_icon", enableNotify);
                e.commit();
                // Tell background service to deal with the notification icon
                if (enableNotify) {
                    sendBroadcast(new Intent(ACTION_SHOW_NOTIFY));
                } else {
                    sendBroadcast(new Intent(ACTION_CANCEL_NOTIFY));
                }
                return true;
            }

            case R.id.lockeffect: {
                String mLockedEffect = prefSettings.getString(
                        "viper4android.settings.lock_effect", "none");
                int mLockIndex;
                if (mLockedEffect.equalsIgnoreCase("none")) {
                    mLockIndex = 0;
                } else if (mLockedEffect.equalsIgnoreCase("headset")) {
                    mLockIndex = 1;
                } else if (mLockedEffect.equalsIgnoreCase("speaker")) {
                    mLockIndex = 2;
                } else if (mLockedEffect.equalsIgnoreCase("bluetooth")) {
                    mLockIndex = 3;
                } else {
                    mLockIndex = 4;
                }

                String[] modeList =
                    {
                        getResources().getString(R.string.text_disabled),
                        getResources().getString(R.string.text_headset),
                        getResources().getString(R.string.text_speaker),
                        getResources().getString(R.string.text_bluetooth)
                    };

                Dialog selectDialog = new AlertDialog.Builder(this)
                        .setTitle(R.string.text_lockeffect)
                        .setIcon(R.drawable.icon)
                        .setSingleChoiceItems(modeList, mLockIndex,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        SharedPreferences prefSettings = getSharedPreferences(
                                SHARED_PREFERENCES_BASENAME + ".settings",
                                MODE_PRIVATE);
                        Editor e = prefSettings.edit();
                        switch (which) {
                            case 0:
                                e.putString("viper4android.settings.lock_effect",
                                        "none");
                                break;
                            case 1:
                                e.putString("viper4android.settings.lock_effect",
                                        "headset");
                                break;
                            case 2:
                                e.putString("viper4android.settings.lock_effect",
                                        "speaker");
                                break;
                            case 3:
                                e.putString("viper4android.settings.lock_effect",
                                        "bluetooth");
                                break;
                        }
                        e.commit();
                        // Tell background service to change the
                        // mode
                        sendBroadcast(new Intent(ACTION_UPDATE_PREFERENCES));
                        dialog.dismiss();
                    }
                }).setCancelable(false).create();
                selectDialog.show();

                return true;
            }

            default:
                return false;
        }
    }
}

class MyAdapter extends FragmentPagerAdapter {

    private final String[] entries;

    private final String[] titles;

    public MyAdapter(FragmentManager fm, Context context) {
        super(fm);
        Resources res = context.getResources();
        ArrayList<String> tmpEntries = new ArrayList<String>();
        tmpEntries.add("headset");
        tmpEntries.add("speaker");
        tmpEntries.add("bluetooth");

        ArrayList<String> tmpTitles = new ArrayList<String>();
        tmpTitles.add(res.getString(R.string.headset_title).toUpperCase());
        tmpTitles.add(res.getString(R.string.speaker_title).toUpperCase());
        tmpTitles.add(res.getString(R.string.bluetooth_title).toUpperCase());

        entries = tmpEntries.toArray(new String[tmpEntries.size()]);
        titles = tmpTitles.toArray(new String[tmpTitles.size()]);
    }

    @Override
    public CharSequence getPageTitle(int position) {
        return titles[position];
    }

    public String[] getEntries() {
        return entries;
    }

    @Override
    public int getCount() {
        return entries.length;
    }

    @Override
    public Fragment getItem(int position) {
        final MainDSPScreen v4aFragment = new MainDSPScreen();
        Bundle b = new Bundle();
        b.putString("config", entries[position]);
        v4aFragment.setArguments(b);
        return v4aFragment;
    }
}