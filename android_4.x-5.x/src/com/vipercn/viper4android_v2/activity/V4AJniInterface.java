package com.vipercn.viper4android_v2.activity;

import android.util.Log;

import java.nio.charset.Charset;

public class V4AJniInterface {

    private static boolean mJniLoadOK;

    static {
        try {
            System.loadLibrary("V4AJniUtils");
            mJniLoadOK = true;
            Log.i("ViPER4Android_Utils", "libV4AJniUtils.so loaded");
        } catch (UnsatisfiedLinkError e) {
            mJniLoadOK = false;
            Log.e("ViPER4Android_Utils", "[Fatal] Can't load libV4AJniUtils.so");
        }
    }

    /* Library Check Utils */
    private native static int CheckLibraryUsable();

    /* CPU Check Utils */
    private native static int CheckCPUHasNEON();

    private native static int CheckCPUHasVFP();

    /* Impulse Response Utils */
    private native static int[] GetImpulseResponseInfo(byte[] mIRFileName);

    private native static byte[] ReadImpulseResponse(byte[] mIRFileName);

    private native static int[] HashImpulseResponse(byte[] mBuffer, int mBufferSize);

    /* This method is just making sure jni has been loaded */
    public static boolean CheckLibrary() {
        if (!mJniLoadOK) {
            return false;
        }
        int mUsable = CheckLibraryUsable();
        return mUsable == 1;
    }

    public static boolean IsLibraryUsable() {
        return mJniLoadOK;
    }

    public static boolean IsCPUSupportNEON() {
        if (!mJniLoadOK) {
            return false;
        }
        int mResult = CheckCPUHasNEON();
        Log.i("ViPER4Android_Utils", "CpuInfo[jni] = NEON:" + mResult);
        return mResult != 0;
    }

    public static boolean IsCPUSupportVFP() {
        if (!mJniLoadOK) {
            return false;
        }
        int mResult = CheckCPUHasVFP();
        Log.i("ViPER4Android_Utils", "CpuInfo[jni] = VFP:" + mResult);
        return mResult != 0;
    }

    public static int[] GetImpulseResponseInfoArray(String mIRFileName) {
        if (!mJniLoadOK) {
            return null;
        }
        // Convert unicode string to multi-byte string
        byte[] stringBytes = mIRFileName.getBytes(Charset.forName("US-ASCII"));
        if (stringBytes == null) {
            return null;
        }
        // Call native
        return GetImpulseResponseInfo(stringBytes);
    }

    public static byte[] ReadImpulseResponseToArray(String mIRFileName) {
        if (!mJniLoadOK) {
            return null;
        }
        // Convert unicode string to multi-byte string
        byte[] stringBytes = mIRFileName.getBytes(Charset.forName("US-ASCII"));
        if (stringBytes == null) {
            return null;
        }
        // Call native
        return ReadImpulseResponse(stringBytes);
    }

    public static int[] GetHashImpulseResponseArray(byte[] mBuffer) {
        if (!mJniLoadOK) {
            return null;
        }
        if (mBuffer == null) {
            return null;
        }
        // Call native
        return HashImpulseResponse(mBuffer, mBuffer.length);
    }
}
