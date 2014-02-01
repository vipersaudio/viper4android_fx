package com.vipercn.viper4android_v2.activity;

import android.os.Build;
import android.os.Environment;
import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class StaticEnvironment {

    private static boolean sEnvironmentInitialized;
    private static String sExternalStoragePath = "";
    private static String sV4aRoot = "";
    private static String sV4aKernelPath = "";
    private static String sV4aProfilePath = "";

    private static boolean checkWritable(String mFileName) {
        try {
            byte[] mBlank = new byte[16];
            FileOutputStream fosOutput = new FileOutputStream(mFileName);
            fosOutput.write(mBlank);
            fosOutput.flush();
            fosOutput.close();
            return new File(mFileName).delete();
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
        String mExternalStoragePathName = Environment.getExternalStorageDirectory()
                .getAbsolutePath();

        // Check writable
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            if (Build.VERSION.SDK_INT >= 18) {
                if (mExternalStoragePathName.endsWith("/emulated/0")
                        || mExternalStoragePathName.endsWith("/emulated/0/")) {
                    mExternalStoragePathName = mExternalStoragePathName.replace("/emulated/0",
                            "/emulated/legacy");
                }
            }
            sExternalStoragePath = mExternalStoragePathName.endsWith("/")
                    ? mExternalStoragePathName : mExternalStoragePathName + "/";
            sV4aRoot = sExternalStoragePath + "ViPER4Android/";
            sV4aKernelPath = sV4aRoot + "Kernel/";
            sV4aProfilePath = sV4aRoot + "Profile/";
        } else {
            boolean isPathFromSdkWorking = false;
            boolean isPathFromLegacyWorking = false;
            String externalPath;
            externalPath = mExternalStoragePathName.endsWith("/") ? mExternalStoragePathName
                    : mExternalStoragePathName + "/";
            externalPath = externalPath + "v4a_test_file";
            Log.i("ViPER4Android", "Now checking for external storage writable, file = "
                    + externalPath);
            if (checkWritable(externalPath)) {
                isPathFromSdkWorking = true;
            }
            externalPath = mExternalStoragePathName.endsWith("/") ? mExternalStoragePathName
                    : mExternalStoragePathName + "/";
            if (externalPath.endsWith("/emulated/0/")) {
                externalPath = externalPath.replace("/emulated/0/", "/emulated/legacy/");
                externalPath = externalPath + "v4a_test_file";
                Log.i("ViPER4Android", "Now checking for external storage writable, file = " + externalPath);
                if (checkWritable(externalPath)) {
                    isPathFromLegacyWorking = true;
                }
            }

            if (isPathFromLegacyWorking) {
                mExternalStoragePathName = mExternalStoragePathName.replace("/emulated/0",
                        "/emulated/legacy");
                sExternalStoragePath = mExternalStoragePathName.endsWith("/")
                        ? mExternalStoragePathName : mExternalStoragePathName + "/";
                sV4aRoot = sExternalStoragePath + "ViPER4Android/";
                sV4aKernelPath = sV4aRoot + "Kernel/";
                sV4aProfilePath = sEnvironmentInitialized + "Profile/";
                Log.i("ViPER4Android", "External storage path = " + sExternalStoragePath);
                Log.i("ViPER4Android", "ViPER4Android root path = " + sV4aRoot);
                Log.i("ViPER4Android", "ViPER4Android kernel path = " + sV4aKernelPath);
                Log.i("ViPER4Android", "ViPER4Android profile path = " + sV4aProfilePath);
                return;
            }
            if (isPathFromSdkWorking) {
                sExternalStoragePath = mExternalStoragePathName.endsWith("/")
                        ? mExternalStoragePathName : mExternalStoragePathName + "/";
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
            sExternalStoragePath = mExternalStoragePathName.endsWith("/")
                    ? mExternalStoragePathName : mExternalStoragePathName + "/";
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
            String mExternalStoragePathName = Environment.getExternalStorageDirectory().getAbsolutePath();
            if (Build.VERSION.SDK_INT >= 18) {
                if (mExternalStoragePathName.endsWith("/emulated/0")
                        || mExternalStoragePathName.endsWith("/emulated/0/")) {
                    mExternalStoragePathName = mExternalStoragePathName.replace("/emulated/0",
                            "/emulated/legacy");
                }
            }
            sExternalStoragePath = mExternalStoragePathName.endsWith("/")
                    ? mExternalStoragePathName : mExternalStoragePathName + "/";
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
