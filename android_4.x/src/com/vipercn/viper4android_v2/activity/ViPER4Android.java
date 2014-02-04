package com.vipercn.viper4android_v2.activity;

import android.app.ActionBar;
import android.app.Activity;
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
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.PagerTabStrip;
import android.support.v4.view.ViewPager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.service.ViPER4AndroidService;
import com.vipercn.viper4android_v2.widgets.CustomDrawerLayout;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

public final class ViPER4Android extends Activity {

    //==================================
    // Static Fields
    //==================================
    private static final String STATE_SELECTED_POSITION = "selected_navigation_drawer_position";
    private static final String PREF_USER_LEARNED_DRAWER = "navigation_drawer_learned";
    private static final String PREF_IS_TABBED = "pref_is_tabbed";
    //==================================
    public static final String SHARED_PREFERENCES_BASENAME = "com.vipercn.viper4android_v2";
    public static final String ACTION_UPDATE_PREFERENCES = "com.vipercn.viper4android_v2.UPDATE";
    public static final String ACTION_SHOW_NOTIFY = "com.vipercn.viper4android_v2.SHOWNOTIFY";
    public static final String ACTION_CANCEL_NOTIFY = "com.vipercn.viper4android_v2.CANCELNOTIFY";
    public static final int NOTIFY_FOREGROUND_ID = 1;
    //==================================
    private static String[] mEntries;
    private static List<HashMap<String, String>> mTitles;

    //==================================
    // Drawer
    //==================================
    private ActionBarDrawerToggle mDrawerToggle;
    private CustomDrawerLayout mDrawerLayout;
    private ListView mDrawerListView;
    private View mFragmentContainerView;
    private int mCurrentSelectedPosition;
    private boolean mFromSavedInstanceState;
    private boolean mUserLearnedDrawer;

    //==================================
    // ViewPager
    //==================================
    protected MyAdapter pagerAdapter;
    protected ViewPager viewPager;
    protected PagerTabStrip pagerTabStrip;

    //==================================
    // Fields
    //==================================
    private SharedPreferences mPreferences;
    private boolean mIsTabbed = true;
    private CharSequence mTitle;


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
        boolean mActived = prefSettings.getBoolean("viper4android.settings.onlineactive", false);
        return !mActived;
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
        String mCode = "";
        byte[] mHexTab = "0123456789abcdef".getBytes();
        Random rndMachine = new Random();
        for (int i = 0; i < 8; i++) {
            byte btCode = (byte) rndMachine.nextInt(256);
            if (btCode < 0) {
                short shortData = (short) (256 + btCode);
                //TODO: malformed string: "%c%c" does not match to the type of its arguments
                mCode = mCode + String.format("%c%c", mHexTab[shortData >> 4],
                        mHexTab[shortData & 0x0F]);
            } else {
                mCode = mCode + String.format("%c%c", mHexTab[btCode >> 4],
                        mHexTab[btCode & 0x0F]);
            }
        }
        mCode = mCode + "-";
        for (int i = 0; i < 4; i++) {
            byte btCode = (byte) rndMachine.nextInt(256);
            if (btCode < 0) {
                short shortData = (short) (256 + btCode);
                mCode = mCode + String.format("%c%c", mHexTab[shortData >> 4],
                        mHexTab[shortData & 0x0F]);
            } else {
                mCode = mCode + String.format("%c%c", mHexTab[btCode >> 4],
                        mHexTab[btCode & 0x0F]);
            }
        }
        mCode = mCode + "-" + Build.VERSION.SDK_INT;

        String mURL = "http://vipersaudio.com/stat/v4a_stat.php?code=" + mCode
                + "&ver=viper4android-fx";
        Log.i("ViPER4Android", "Submit code = \"" + mURL + "\"");

        try {
            HttpGet httpRequest = new HttpGet(mURL);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse httpResponse = httpClient.execute(httpRequest);
            return httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK;
        } catch (Exception e) {
            Log.i("ViPER4Android", "Submit failed, error = " + e.getMessage());
            return false;
        }
    }

    private void processDriverCheck() {
        boolean isDriverUsable;

        Utils.AudioEffectUtils aeuUtils = new Utils().new AudioEffectUtils();
        if (!aeuUtils.isViPER4AndroidEngineFound()) {
            isDriverUsable = false;
        } else {
            PackageManager packageMgr = getPackageManager();
            PackageInfo packageInfo;
            String apkVersion;
            try {
                int[] iaDrvVer = aeuUtils.getViper4AndroidEngineVersion();
                String mDriverVersion = iaDrvVer[0] + "." + iaDrvVer[1] + "." + iaDrvVer[2] + "."
                        + iaDrvVer[3];
                packageInfo = packageMgr.getPackageInfo(getPackageName(), 0);
                apkVersion = packageInfo.versionName;
                isDriverUsable = apkVersion.equalsIgnoreCase(mDriverVersion);
            } catch (NameNotFoundException e) {
                Log.i("ViPER4Android", "Cannot found ViPER4Android's apk [weird]");
                isDriverUsable = true;
            }
        }

        if (!isDriverUsable) {
            Log.i("ViPER4Android",
                    "Android audio effect engine reports the v4a driver is not usable");
            Message message = new Message();
            message.what = 0xA00A;
            message.obj = this;
            mDriverHandler.sendMessage(message);
        }
    }

    private static boolean cpuHasQualitySelection() {
        Utils.CpuInfo mCPUInfo = new Utils.CpuInfo();
        return mCPUInfo.hasNEON();
    }

    private static String determineCPUWithDriver(String mQual) {
        String mDriverFile = "libv4a_fx_";

        if (Build.VERSION.SDK_INT >= 18) {
            mDriverFile = mDriverFile + "jb_";
        } else {
            mDriverFile = mDriverFile + "ics_";
        }

        Utils.CpuInfo mCPUInfo = new Utils.CpuInfo();
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
        StringBuilder build = new StringBuilder("");
        String line;
        try {
            while ((line = reader.readLine()) != null) {
                build.append(line);
                build.append("\n");
            }
        } catch (IOException e) {
            return "";
        }
        return build.toString();
    }

    private final Context mActivityContext = this;
    private ViPER4AndroidService mAudioServiceInstance;

    // Driver install handler
    private static final Handler mDriverHandler = new Handler() {
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
                            boolean canChooseQuality = cpuHasQualitySelection();
                            if (canChooseQuality) {
                                new AlertDialog.Builder(ctxInstance)
                                        .setTitle(R.string.text_drvinst_prefer)
                                        .setIcon(R.drawable.icon)
                                        .setItems(R.array.drvinst_prefer, new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        String[] mQual = ctxInstance.getResources().getStringArray(
                                                R.array.drvinst_prefer_values);
                                        final String result = mQual[which];
                                        if (result.equalsIgnoreCase("sq")) {
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

                                                    if (Utils.installDrv_FX(ctxInstance,
                                                            determineCPUWithDriver(result))) {
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
                                                public void onClick(DialogInterface dialog, int which) {
                                                    dialog.dismiss();
                                                }
                                            });
                                            mSQWarn.show();
                                        } else {
                                            if (!Utils.isBusyBoxInstalled(ctxInstance)) {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(ctxInstance.getResources()
                                                        .getString(R.string.text_busybox_not_installed));
                                                mResult.setNegativeButton(ctxInstance.getResources()
                                                        .getString(R.string.text_ok),null);
                                                mResult.show();
                                            }

                                            if (Utils.installDrv_FX(ctxInstance,
                                                    determineCPUWithDriver(result))) {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder( ctxInstance);
                                                mResult.setTitle("ViPER4Android");
                                                mResult.setMessage(ctxInstance.getResources()
                                                        .getString(R.string.text_drvinst_ok));
                                                mResult.setNegativeButton(ctxInstance.getResources()
                                                        .getString(R.string.text_ok),null);
                                                mResult.show();
                                            } else {
                                                AlertDialog.Builder mResult = new AlertDialog.Builder(ctxInstance);
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

                                if (Utils.installDrv_FX(ctxInstance, mDriverFileName)) {
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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Load jni first
        boolean jniLoaded = V4AJniInterface.CheckLibrary();
        Log.i("ViPER4Android", "Jni library status = " + jniLoaded);

        // Welcome window
        if (checkFirstRun()) {
            // TODO: Welcome window
        }

        // Setup ui
        mPreferences = PreferenceManager.getDefaultSharedPreferences(this);
        mUserLearnedDrawer = mPreferences.getBoolean(PREF_USER_LEARNED_DRAWER, false);

        if (getResources().getBoolean(R.bool.config_allow_toggle_tabbed)) {
            mIsTabbed = mPreferences.getBoolean(PREF_IS_TABBED,
                    getResources().getBoolean(R.bool.config_use_tabbed));
        } else {
            mIsTabbed = getResources().getBoolean(R.bool.config_use_tabbed);
        }

        mTitle = getTitle();

        // Setup action bar
        ActionBar mActionBar = getActionBar();
        mActionBar.setDisplayHomeAsUpEnabled(true);
        mActionBar.setHomeButtonEnabled(true);
        mActionBar.setDisplayShowTitleEnabled(true);

        // Setup effect setting page
        if (savedInstanceState != null) {
            mCurrentSelectedPosition = savedInstanceState.getInt(STATE_SELECTED_POSITION);
            mFromSavedInstanceState = true;
        }

        // Show changelog
        if (checkFirstRun()) {
            String mLocale = Locale.getDefault().getLanguage() + "_"
                    + Locale.getDefault().getCountry();
            String mChangelog_AssetsName = "Changelog_";
            if (mLocale.equalsIgnoreCase("zh_CN")) {
                mChangelog_AssetsName = mChangelog_AssetsName + "zh_CN";
            } else {
                mChangelog_AssetsName = mLocale.equalsIgnoreCase("zh_TW") ? mChangelog_AssetsName
                        + "zh_TW" : mChangelog_AssetsName + "en_US";
                mChangelog_AssetsName = mChangelog_AssetsName + ".txt";
            }

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

        setUpUi();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (!mIsTabbed) {
            mDrawerToggle.onConfigurationChanged(newConfig);
        }
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (!mIsTabbed) {
            outState.putInt(STATE_SELECTED_POSITION, mCurrentSelectedPosition);
        }
    }

    @Override
    public void onResume() {
        Log.i("ViPER4Android", "Main activity onResume()");

        super.onResume();

        ServiceConnection connection = new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder binder) {
                ViPER4AndroidService service = ((ViPER4AndroidService.LocalBinder)binder).getService();
                mAudioServiceInstance = service;
                String routing = ViPER4AndroidService.getAudioOutputRouting(getSharedPreferences(
                        SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE));
                if (mIsTabbed && viewPager != null) {
                    String[] entries = getEntries();
                    for (int i = 0; i < entries.length; i++) {
                        if (routing.equals(entries[i])) {
                            viewPager.setCurrentItem(i);
                            break;
                        }
                    }
                }
                unbindService(this);
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
                Log.i("ViPER4Android", "ViPER4Android service disconnected.");
            }
        };
        Intent serviceIntent = new Intent(this, ViPER4AndroidService.class);
        bindService(serviceIntent, connection, 0);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (!isDrawerOpen()) {
            getMenuInflater().inflate(mIsTabbed ? R.menu.menu_tabbed : R.menu.menu, menu);
            if (!getResources().getBoolean(R.bool.config_allow_toggle_tabbed)) {
                menu.removeItem(R.id.v4a_action_tabbed);
            }
            getActionBar().setTitle(mTitle);
            return true;
        } else {
            getActionBar().setTitle(getString(R.string.app_name));
            return super.onCreateOptionsMenu(menu);
        }
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        SharedPreferences preferences = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
        boolean mEnableNotify = preferences.getBoolean("viper4android.settings.show_notify_icon", false);
        String mDriverMode = preferences.getString("viper4android.settings.compatiblemode", "global");

        /* Just for debug */
        String mLockedEffect = preferences.getString("viper4android.settings.lock_effect", "none");
        Log.i("ViPER4Android", "lock_effect = " + mLockedEffect);
        /******************/

        if (!isDrawerOpen()) {
            // Notification icon menu
            if (mEnableNotify) {
                MenuItem mNotify = menu.findItem(R.id.notify);
                String mNotifyTitle = getResources().getString(R.string.text_hidetrayicon);
                mNotify.setTitle(mNotifyTitle);
            } else {
                MenuItem mNotify = menu.findItem(R.id.notify);
                String mNotifyTitle = getResources().getString(R.string.text_showtrayicon);
                mNotify.setTitle(mNotifyTitle);
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
                MenuItem mDrvStatus = menu.findItem(R.id.drvstatus);
                mDrvStatus.setEnabled(true);
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
                boolean mDriverIsReady = mAudioServiceInstance.getDriverIsReady();
                if (mDriverIsReady) {
                    MenuItem drvInstItem = menu.findItem(R.id.drvinst);
                    String menuTitle = getResources().getString(R.string.text_uninstall);
                    drvInstItem.setTitle(menuTitle);
                    if (!StaticEnvironment.isEnvironmentInitialized())
                        drvInstItem.setEnabled(false);
                    else drvInstItem.setEnabled(true);
                } else {
                    MenuItem drvInstItem = menu.findItem(R.id.drvinst);
                    String menuTitle = getResources().getString(R.string.text_install);
                    drvInstItem.setTitle(menuTitle);
                    if (!StaticEnvironment.isEnvironmentInitialized())
                        drvInstItem.setEnabled(false);
                    else drvInstItem.setEnabled(true);
                }
            }
        }
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        SharedPreferences prefSettings = getSharedPreferences(
                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
        if (!mIsTabbed) {
            if (mDrawerToggle.onOptionsItemSelected(item)) {
                return true;
            }
        }

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
                        startActivity(intent);
                    }
                });
                mHelp.show();
                return true;
            }

            case R.id.checkupdate: {
                Uri uri = Uri.parse(getResources().getString(R.string.text_updatelink));
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                startActivity(intent);
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

                            Utils.AudioEffectUtils aeuUtils = new Utils().new AudioEffectUtils();
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
                } else {
                    mChangelog_AssetsName = mLocale.equalsIgnoreCase("zh_TW") ?
                            mChangelog_AssetsName + "zh_TW" : mChangelog_AssetsName + "en_US";
                    mChangelog_AssetsName = mChangelog_AssetsName + ".txt";
                }
                String mChangeLog = "";
                InputStream isHandle;
                try {
                    isHandle = getAssets().open(mChangelog_AssetsName);
                    mChangeLog = readTextFile(isHandle);
                    isHandle.close();
                } catch (Exception e) {
                }

                if (mChangeLog.equalsIgnoreCase("")) return true;
                AlertDialog.Builder mChglog = new AlertDialog.Builder(this);
                mChglog.setTitle(R.string.text_changelog);
                mChglog.setMessage(mChangeLog);
                mChglog.setNegativeButton(getResources().getString(R.string.text_ok), null);
                mChglog.show();
                return true;
            }

            case R.id.loadprofile: {
                loadProfileDialog();
                return true;
            }

            case R.id.saveprofile: {
                saveProfileDialog();
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
                    boolean canChooseQuality = cpuHasQualitySelection();
                    if (canChooseQuality) {
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
                                            if (Utils.installDrv_FX(mActivityContext,
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
                                    if (Utils.installDrv_FX(mActivityContext,
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
                        })
                        .create().show();

                    } else {
                        String mDriverFileName = determineCPUWithDriver("");
                        if (Utils.installDrv_FX(mActivityContext, mDriverFileName)) {
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
                if (nUIPrefer < 0 || nUIPrefer > 2) {
                    nUIPrefer = 0;
                }
                Dialog selectDialog = new AlertDialog.Builder(this)
                        .setTitle(R.string.text_uiprefer_dialog)
                        .setIcon(R.drawable.icon)
                        .setSingleChoiceItems(R.array.ui_prefer, nUIPrefer,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        if (which < 0 || which > 2) which = 0;
                        SharedPreferences prefSettings = getSharedPreferences(
                                SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
                        int nOldSelIdx = prefSettings.getInt(
                                "viper4android.settings.uiprefer", 0);
                        if (nOldSelIdx == which) {
                            dialog.dismiss();
                            return;
                        }
                        Editor edit = prefSettings.edit();
                        edit.putInt("viper4android.settings.uiprefer", which);
                        edit.commit();
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
                mSelectIndex = mCompatibleMode.equals("global") ? 0 : 1;
                Dialog selectDialog = new AlertDialog.Builder(this)
                        .setTitle(R.string.text_commode)
                        .setIcon(R.drawable.icon)
                        .setSingleChoiceItems(R.array.compatible_mode, mSelectIndex,
                        new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        SharedPreferences prefSettings = getSharedPreferences(
                                SHARED_PREFERENCES_BASENAME + ".settings",
                                MODE_PRIVATE);
                        Editor edit = prefSettings.edit();
                        switch (which) {
                            case 0:
                                edit.putString(
                                        "viper4android.settings.compatiblemode",
                                        "global");
                                break;
                            case 1:
                                edit.putString(
                                        "viper4android.settings.compatiblemode",
                                        "local");
                                break;
                        }
                        edit.commit();
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
                Editor edit = prefSettings.edit();
                edit.putBoolean("viper4android.settings.show_notify_icon", enableNotify);
                edit.commit();
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
                } else if (mLockedEffect.equalsIgnoreCase("usb")) {
                    mLockIndex = 4;
                } else {
                    mLockIndex = 5;
                }

                String[] modeList = {
                    getResources().getString(R.string.text_disabled),
                    getResources().getString(R.string.text_headset),
                    getResources().getString(R.string.text_speaker),
                    getResources().getString(R.string.text_bluetooth),
                    getResources().getString(R.string.text_usb)
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
                        Editor edit = prefSettings.edit();
                        switch (which) {
                            case 0:
                                edit.putString("viper4android.settings.lock_effect",
                                        "none");
                                break;
                            case 1:
                                edit.putString("viper4android.settings.lock_effect",
                                        "headset");
                                break;
                            case 2:
                                edit.putString("viper4android.settings.lock_effect",
                                        "speaker");
                                break;
                            case 3:
                                edit.putString("viper4android.settings.lock_effect",
                                        "bluetooth");
                                break;
                            case 4:
                                edit.putString("viper4android.settings.lock_effect", "usb");
                                break;
                        }
                        edit.commit();
                        // Tell background service to change the mode
                        sendBroadcast(new Intent(ACTION_UPDATE_PREFERENCES));
                        dialog.dismiss();
                    }
                }).setCancelable(false).create();
                selectDialog.show();

                return true;
            }

            case R.id.v4a_action_tabbed: {
                mIsTabbed = !mIsTabbed;
                mPreferences.edit().putBoolean(PREF_IS_TABBED, mIsTabbed).commit();
                Utils.restartActivity(this);
                return true;
            }

            default:
                return false;
        }
    }

    //==================================
    // Methods
    //==================================

    private void setUpUi() {

        mTitles = getTitles();
        mEntries = getEntries();

        if (!mIsTabbed) {
            setContentView(R.layout.activity_main);
            mDrawerListView = (ListView) findViewById(R.id.v4a_navigation_drawer);
            mDrawerListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    selectItem(position);
                }
            });

            mDrawerListView.setAdapter(new SimpleAdapter(
                    getActionBar().getThemedContext(),
                    mTitles,
                    R.layout.drawer_item,
                    new String[]{"ICON", "TITLE"},
                    new int[]{R.id.drawer_icon, R.id.drawer_title}));
            mDrawerListView.setItemChecked(mCurrentSelectedPosition, true);

            setUpNavigationDrawer(
                    findViewById(R.id.v4a_navigation_drawer),
                    findViewById(R.id.v4a_drawer_layout));

        } else {
            setContentView(R.layout.activity_main_tabbed);

            pagerAdapter = new MyAdapter(getFragmentManager());
            viewPager = (ViewPager) findViewById(R.id.viewPager);
            viewPager.setAdapter(pagerAdapter);
            viewPager.setCurrentItem(0);
            pagerTabStrip = (PagerTabStrip) findViewById(R.id.pagerTabStrip);

            Intent serviceIntent = new Intent(this, ViPER4AndroidService.class);
            startService(serviceIntent);

            pagerTabStrip.setDrawFullUnderline(true);
            pagerTabStrip.setTabIndicatorColor(
                    getResources().getColor(R.color.action_bar_divider));

        }
    }

    public void saveProfileDialog() {
        // We first list existing profiles
        File profileDir = new File(StaticEnvironment.getV4aProfilePath());
        profileDir.mkdirs();

        Log.e("ViPER4Android", "Saving preset to " + profileDir.getAbsolutePath());

        // The first entry is "New profile", so we offset
        File[] profiles = profileDir.listFiles((FileFilter) null);
        final String[] names = new String[profiles != null ? profiles.length + 1 : 1];
        names[0] = getString(R.string.text_savefxprofile);
        if (profiles != null) {
            for (int i = 0; i < profiles.length; i++) {
                names[i + 1] = profiles[i].getName();
            }
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(R.string.text_savefxprofile)
                .setItems(names, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        if (which == 0) {
                            // New profile, we ask for the name
                            AlertDialog.Builder inputBuilder =
                                    new AlertDialog.Builder(ViPER4Android.this);

                            inputBuilder.setTitle(R.string.text_newfxprofile);

                            // Set an EditText view to get user input
                            final EditText input = new EditText(ViPER4Android.this);
                            inputBuilder.setView(input);

                            inputBuilder.setPositiveButton(
                                    "Ok", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int whichButton) {
                                    String value = input.getText().toString();
                                    saveProfile(value);
                                }
                            });
                            inputBuilder.setNegativeButton(
                                    "Cancel", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int whichButton) {
                                    // Canceled.
                                }
                            });

                            inputBuilder.show();
                        } else {
                            saveProfile(names[which]);
                        }
                    }
                });
        Dialog dlg = builder.create();
        dlg.show();
    }

    public void loadProfileDialog() {
        File profileDir = new File(StaticEnvironment.getV4aProfilePath());
        profileDir.mkdirs();

        File[] profiles = profileDir.listFiles((FileFilter) null);
        final String[] names = new String[profiles != null ? profiles.length : 0];
        if (profiles != null) {
            for (int i = 0; i < profiles.length; i++) {
                names[i] = profiles[i].getName();
            }
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(R.string.text_loadfxprofile)
                .setItems(names, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        loadProfile(names[which]);
                    }
                });
        builder.create().show();
    }

    public void saveProfile(String name) {
        final String spDir = getApplicationInfo().dataDir + "/shared_prefs/";

        // Copy the SharedPreference to our output directory
        File profileDir = new File(StaticEnvironment.getV4aProfilePath() + "/" + name);
        profileDir.mkdirs();

        Log.e("ViPER4Android", "Saving profile to " + profileDir.getAbsolutePath());

        final String packageName = "com.vipercn.viper4android_v2.";

        try {
            copy(new File(spDir + packageName + "bluetooth.xml"),
                    new File(profileDir, packageName + "bluetooth.xml"));
            copy(new File(spDir + packageName + "headset.xml"),
                    new File(profileDir, packageName + "headset.xml"));
            copy(new File(spDir + packageName + "speaker.xml"),
                    new File(profileDir, packageName + "speaker.xml"));
            copy(new File(spDir + packageName + "usb.xml"),
                    new File(profileDir, packageName + "usb.xml"));
        } catch (IOException e) {
            Log.e("ViPER4Android", "Cannot save preset", e);
        }
    }

    public void loadProfile(String name) {
        // Copy the SharedPreference to our local directory
        File profileDir = new File(StaticEnvironment.getV4aProfilePath() + "/" + name);
        if (!profileDir.exists()) profileDir.mkdirs();

        final String packageName = "com.vipercn.viper4android_v2.";
        final String spDir = getApplicationInfo().dataDir + "/shared_prefs/";

        try {
            copy(new File(profileDir, packageName + "bluetooth.xml"),
                    new File(spDir + packageName + "bluetooth.xml"));
            copy(new File(profileDir, packageName + "headset.xml"),
                    new File(spDir + packageName + "headset.xml"));
            copy(new File(profileDir, packageName + "speaker.xml"),
                    new File(spDir + packageName + "speaker.xml"));
            copy(new File(profileDir, packageName + "usb.xml"),
                    new File(spDir + packageName + "usb.xml"));
        } catch (IOException e) {
            Log.e("ViPER4Android", "Cannot load preset", e);
        }

        // Reload preferences
        startActivity(new Intent(this, ViPER4Android.class));
        finish();
    }

    public static void copy(File src, File dst) throws IOException {
        InputStream in = new FileInputStream(src);
        OutputStream out = new FileOutputStream(dst);

        Log.e("ViPER4Android", "Copying " + src.getAbsolutePath() + " to " + dst.getAbsolutePath());

        // Transfer bytes from in to out
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
            out.write(buf, 0, len);
        }
        in.close();
        out.close();
    }

    /**
     * Users of this fragment must call this method to set up the
     * navigation menu_drawer interactions.
     *
     * @param fragmentContainerView The view of this fragment in its activity's layout.
     * @param drawerLayout          The DrawerLayout containing this fragment's UI.
     */
    public void setUpNavigationDrawer(View fragmentContainerView, View drawerLayout) {
        mFragmentContainerView = fragmentContainerView;
        mDrawerLayout = (CustomDrawerLayout) drawerLayout;

        mDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);

        mDrawerToggle = new ActionBarDrawerToggle(
                this,
                mDrawerLayout,
                R.drawable.ic_drawer,
                R.string.navigation_drawer_open,
                R.string.navigation_drawer_close
        ) {
            @Override
            public void onDrawerClosed(View drawerView) {
                super.onDrawerClosed(drawerView);

                invalidateOptionsMenu(); // calls onPrepareOptionsMenu()
            }

            @Override
            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);

                if (!mUserLearnedDrawer) {
                    mUserLearnedDrawer = true;
                    mPreferences.edit().putBoolean(PREF_USER_LEARNED_DRAWER, true).commit();
                }
                invalidateOptionsMenu(); // calls onPrepareOptionsMenu()
            }
        };

        if (!mUserLearnedDrawer && !mFromSavedInstanceState) {
            mDrawerLayout.openDrawer(mFragmentContainerView);
        }

        mDrawerLayout.post(new Runnable() {
            @Override
            public void run() {
                mDrawerToggle.syncState();
            }
        });

        mDrawerLayout.setDrawerListener(mDrawerToggle);
        selectItem(mCurrentSelectedPosition);
    }

    public boolean isDrawerOpen() {
        return mDrawerLayout != null && mDrawerLayout.isDrawerOpen(mFragmentContainerView);
    }

    private void selectItem(int position) {
        mCurrentSelectedPosition = position;
        if (mDrawerListView != null) {
            mDrawerListView.setItemChecked(position, true);
        }
        if (mDrawerLayout != null) {
            mDrawerLayout.closeDrawer(mFragmentContainerView);
        }

        FragmentManager fragmentManager = getFragmentManager();
        fragmentManager.beginTransaction()
                .replace(R.id.v4a_container, PlaceholderFragment.newInstance(position))
                .commit();
        mTitle = mTitles.get(position).get("TITLE");
        getActionBar().setTitle(mTitle);
    }

    /**
     * @return String[] containing titles
     */
    private List<HashMap<String, String>> getTitles() {
        // TODO: use real drawables
        ArrayList<HashMap<String, String>> tmpList = new ArrayList<HashMap<String, String>>();
        // Headset
        HashMap<String, String> mTitleMap = new HashMap<String, String>();
        mTitleMap.put("ICON", R.drawable.empty_icon + "");
        mTitleMap.put("TITLE", getString(R.string.headset_title));
        tmpList.add(mTitleMap);
        // Speaker
        mTitleMap = new HashMap<String, String>();
        mTitleMap.put("ICON", R.drawable.empty_icon + "");
        mTitleMap.put("TITLE", getString(R.string.speaker_title));
        tmpList.add(mTitleMap);
        // Bluetooth
        mTitleMap = new HashMap<String, String>();
        mTitleMap.put("ICON", R.drawable.empty_icon + "");
        mTitleMap.put("TITLE", getString(R.string.bluetooth_title));
        tmpList.add(mTitleMap);
        // Usb
        mTitleMap = new HashMap<String, String>();
        mTitleMap.put("ICON", R.drawable.empty_icon + "");
        mTitleMap.put("TITLE", getString(R.string.usb_title));
        tmpList.add(mTitleMap);

        return tmpList;
    }

    /**
     * @return String[] containing titles
     */
    private String[] getEntries() {
        ArrayList<String> entryString = new ArrayList<String>();
        entryString.add("headset");
        entryString.add("speaker");
        entryString.add("bluetooth");
        entryString.add("usb");

        return entryString.toArray(new String[entryString.size()]);
    }

    //==================================
    // Internal Classes
    //==================================

    /**
     * Loads our Fragments.
     */
    public static class PlaceholderFragment extends Fragment {

        /**
         * Returns a new instance of this fragment for the given section
         * number.
         */
        public static Fragment newInstance(int fragmentId) {
            final MainDSPScreen dspFragment = new MainDSPScreen();
            Bundle bundle = new Bundle();
            bundle.putString("config", mEntries[fragmentId]);
            dspFragment.setArguments(bundle);
            return dspFragment;
        }

        public PlaceholderFragment() {
            // intentionally left blank
        }
    }

    public class MyAdapter extends FragmentPagerAdapter {
        private final String[] entries;
        private final List<HashMap<String, String>> titles;

        public MyAdapter(FragmentManager fm) {
            super(fm);

            entries = mEntries;
            titles = mTitles;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return titles.get(position).get("TITLE");
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
            final MainDSPScreen dspFragment = new MainDSPScreen();
            Bundle bundle = new Bundle();
            bundle.putString("config", entries[position]);
            dspFragment.setArguments(bundle);
            return dspFragment;
        }
    }
}