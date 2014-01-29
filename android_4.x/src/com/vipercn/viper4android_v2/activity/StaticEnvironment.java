package com.vipercn.viper4android_v2.activity;

import android.os.Build;
import android.os.Environment;
import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class StaticEnvironment {

    private static boolean sEnvironmentInitialized = false;
    private static String sExternalStoragePath = "";
    private static String sV4aRoot = "";
    private static String sV4aKernelPath = "";
    private static String sV4aProfilePath = "";

    private static boolean checkWritable(String szFileName) {
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

    private static void proceedExternalStoragePath() {
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
                sExternalStoragePath = szExternalStoragePathName;
            } else {
                sExternalStoragePath = szExternalStoragePathName + "/";
            }
            sV4aRoot = sExternalStoragePath + "ViPER4Android/";
            sV4aKernelPath = sV4aRoot + "Kernel/";
            sV4aProfilePath = sV4aRoot + "Profile/";
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
                if (checkWritable(szExtPath)) {
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
                    if (checkWritable(szExtPath)) {
                        bPathFromLegacyIsWorking = true;
                    }
                }
            }

            if (bPathFromLegacyIsWorking) {
                szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0",
                        "/emulated/legacy");
                if (szExternalStoragePathName.endsWith("/")) {
                    sExternalStoragePath = szExternalStoragePathName;
                } else {
                    sExternalStoragePath = szExternalStoragePathName + "/";
                }
                sV4aRoot = sExternalStoragePath + "ViPER4Android/";
                sV4aKernelPath = sV4aRoot + "Kernel/";
                sV4aProfilePath = sEnvironmentInitialized + "Profile/";
                Log.i("ViPER4Android", "External storage path = " + sExternalStoragePath);
                Log.i("ViPER4Android", "ViPER4Android root path = " + sV4aRoot);
                Log.i("ViPER4Android", "ViPER4Android kernel path = " + sV4aKernelPath);
                Log.i("ViPER4Android", "ViPER4Android profile path = " + sV4aProfilePath);
                return;
            }
            if (bPathFromSDKIsWorking) {
                if (szExternalStoragePathName.endsWith("/")) {
                    sExternalStoragePath = szExternalStoragePathName;
                } else {
                    sExternalStoragePath = szExternalStoragePathName + "/";
                }
                sV4aRoot = sExternalStoragePath + "ViPER4Android/";
                sV4aKernelPath = sV4aRoot + "Kernel/";
                sV4aProfilePath = sV4aRoot + "Profile/";
                Log.i("ViPER4Android", "External storage path = " + sExternalStoragePath);
                Log.i("ViPER4Android", "ViPER4Android root path = " + sV4aRoot);
                Log.i("ViPER4Android", "ViPER4Android kernel path = " + sV4aKernelPath);
                Log.i("ViPER4Android", "ViPER4Android profile path = " + sV4aProfilePath);
                return;
            }

            Log.i("ViPER4Android", "Really terrible thing, external storage detection failed. V4A may malfunction");
            if (szExternalStoragePathName.endsWith("/")) {
                sExternalStoragePath = szExternalStoragePathName;
            } else {
                sExternalStoragePath = szExternalStoragePathName + "/";
            }
            sV4aRoot = sExternalStoragePath + "ViPER4Android/";
            sV4aKernelPath = sV4aRoot + "Kernel/";
            sV4aProfilePath = sV4aRoot + "Profile/";
        }
    }

    public static boolean isEnvironmentInitialized() {
        return sEnvironmentInitialized;
    }

    public static void initEnvironment() {
        try {
            proceedExternalStoragePath();
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
                sExternalStoragePath = szExternalStoragePathName;
            } else {
                sExternalStoragePath = szExternalStoragePathName + "/";
            }
            sV4aRoot = sExternalStoragePath + "ViPER4Android/";
            sV4aKernelPath = sV4aRoot + "Kernel/";
            sV4aProfilePath = sV4aRoot + "Profile/";
        }
        sEnvironmentInitialized = true;
    }

    public static String getExternalStoragePath() {
        return sExternalStoragePath;
    }

    public static String getV4aRootPath() {
        return sV4aRoot;
    }

    public static String getV4aKernelPath() {
        return sV4aKernelPath;
    }

    public static String getV4aProfilePath() {
        return sV4aProfilePath;
    }
}
