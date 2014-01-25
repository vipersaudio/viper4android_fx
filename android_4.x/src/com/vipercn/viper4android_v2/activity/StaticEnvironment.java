package com.vipercn.viper4android_v2.activity;

import android.os.Build;
import android.os.Environment;
import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class StaticEnvironment {

    private static boolean m_bEnvironmentInited = false;

    private static String m_szExternalStoragePath = "";

    private static String m_szV4AESRoot = "";

    private static String m_szV4AESKernel = "";

    private static String m_szV4AESProfile = "";

    private static boolean CheckWritable(String szFileName) {
        try {
            byte[] baBlank = new byte[16];
            FileOutputStream fosOutput = new FileOutputStream(szFileName);
            fosOutput.write(baBlank);
            fosOutput.flush();
            fosOutput.close();
            return new File(szFileName).delete();
        } catch (FileNotFoundException e) {
            Log.i("ViPER4Android", "FileNotFoundException, msg = " + e.getMessage());
            return false;
        } catch (IOException e) {
            Log.i("ViPER4Android", "IOException, msg = " + e.getMessage());
            return false;
        }
    }

    private static void ProceedExternalStoragePath() {
        // Get path
        String szExternalStoragePathName = Environment.getExternalStorageDirectory()
                .getAbsolutePath();

        // Check writable
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            if (Build.VERSION.SDK_INT >= 18) {
                if (szExternalStoragePathName.endsWith("/emulated/0")
                        || szExternalStoragePathName.endsWith("/emulated/0/")) {
                    szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0",
                            "/emulated/legacy");
                }
            }
            if (szExternalStoragePathName.endsWith("/")) {
                m_szExternalStoragePath = szExternalStoragePathName;
            } else {
                m_szExternalStoragePath = szExternalStoragePathName + "/";
            }
            m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
            m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
            m_szV4AESProfile = m_szV4AESRoot + "Profile/";
        } else {
            boolean bPathFromSDKIsWorking = false;
            boolean bPathFromLegacyIsWorking = false;
            String szExtPath;
            {
                if (szExternalStoragePathName.endsWith("/")) {
                    szExtPath = szExternalStoragePathName;
                } else {
                    szExtPath = szExternalStoragePathName + "/";
                }
                szExtPath = szExtPath + "v4a_test_file";
                Log.i("ViPER4Android", "Now checking for external storage writable, file = "
                        + szExtPath);
                if (CheckWritable(szExtPath)) {
                    bPathFromSDKIsWorking = true;
                }
            }
            {
                if (szExternalStoragePathName.endsWith("/")) {
                    szExtPath = szExternalStoragePathName;
                } else {
                    szExtPath = szExternalStoragePathName + "/";
                }
                if (szExtPath.endsWith("/emulated/0/")) {
                    szExtPath = szExtPath.replace("/emulated/0/", "/emulated/legacy/");
                    szExtPath = szExtPath + "v4a_test_file";
                    Log.i("ViPER4Android", "Now checking for external storage writable, file = " + szExtPath);
                    if (CheckWritable(szExtPath)) {
                        bPathFromLegacyIsWorking = true;
                    }
                }
            }

            if (bPathFromLegacyIsWorking) {
                szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0",
                        "/emulated/legacy");
                if (szExternalStoragePathName.endsWith("/")) {
                    m_szExternalStoragePath = szExternalStoragePathName;
                } else {
                    m_szExternalStoragePath = szExternalStoragePathName + "/";
                }
                m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
                m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
                m_szV4AESProfile = m_szV4AESRoot + "Profile/";
                Log.i("ViPER4Android", "External storage path = " + m_szExternalStoragePath);
                Log.i("ViPER4Android", "ViPER4Android root path = " + m_szV4AESRoot);
                Log.i("ViPER4Android", "ViPER4Android kernel path = " + m_szV4AESKernel);
                Log.i("ViPER4Android", "ViPER4Android profile path = " + m_szV4AESProfile);
                return;
            }
            if (bPathFromSDKIsWorking) {
                if (szExternalStoragePathName.endsWith("/")) {
                    m_szExternalStoragePath = szExternalStoragePathName;
                } else {
                    m_szExternalStoragePath = szExternalStoragePathName + "/";
                }
                m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
                m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
                m_szV4AESProfile = m_szV4AESRoot + "Profile/";
                Log.i("ViPER4Android", "External storage path = " + m_szExternalStoragePath);
                Log.i("ViPER4Android", "ViPER4Android root path = " + m_szV4AESRoot);
                Log.i("ViPER4Android", "ViPER4Android kernel path = " + m_szV4AESKernel);
                Log.i("ViPER4Android", "ViPER4Android profile path = " + m_szV4AESProfile);
                return;
            }

            Log.i("ViPER4Android", "Really terrible thing, external storage detection failed. V4A may malfunction");
            if (szExternalStoragePathName.endsWith("/")) {
                m_szExternalStoragePath = szExternalStoragePathName;
            } else {
                m_szExternalStoragePath = szExternalStoragePathName + "/";
            }
            m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
            m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
            m_szV4AESProfile = m_szV4AESRoot + "Profile/";
        }
    }

    public static boolean IsEnvironmentInited() {
        return m_bEnvironmentInited;
    }

    public static void InitEnvironment() {
        try {
            ProceedExternalStoragePath();
        } catch (Exception e) {
            String szExternalStoragePathName = Environment.getExternalStorageDirectory().getAbsolutePath();
            if (Build.VERSION.SDK_INT >= 18) {
                if (szExternalStoragePathName.endsWith("/emulated/0")
                        || szExternalStoragePathName.endsWith("/emulated/0/")) {
                    szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0",
                            "/emulated/legacy");
                }
            }
            if (szExternalStoragePathName.endsWith("/")) {
                m_szExternalStoragePath = szExternalStoragePathName;
            } else {
                m_szExternalStoragePath = szExternalStoragePathName + "/";
            }
            m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
            m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
            m_szV4AESProfile = m_szV4AESRoot + "Profile/";
        }
        m_bEnvironmentInited = true;
    }

    public static String GetESPath() {
        return m_szExternalStoragePath;
    }

    public static String GetV4ARootPath() {
        return m_szV4AESRoot;
    }

    public static String GetV4AKernelPath() {
        return m_szV4AESKernel;
    }

    public static String GetV4AProfilePath() {
        return m_szV4AESProfile;
    }
}
