package com.vipercn.viper4android_v2.activity;

import java.nio.charset.Charset;

import android.util.Log;

public class V4AJniInterface
{
	private static boolean m_JniLoadOK = false;
	static
	{
		try
		{
			System.loadLibrary("V4AJniUtils");
			m_JniLoadOK = true;
			Log.i("ViPER4Android_Utils", "libV4AJniUtils.so loaded");
		}
		catch (UnsatisfiedLinkError e)
		{
			m_JniLoadOK = false;
			Log.e("ViPER4Android_Utils", "[Fatal] Can't load libV4AJniUtils.so");
		}
	}

	/* CPU Check Utils */
	private native static int CheckCPUHasNEON();
	private native static int CheckCPUHasVFP();

	/* Impulse Response Utils */
	private native static int[] GetImpulseResponseInfo(byte[] szIRFileName);
	private native static byte[] ReadImpulseResponse(byte[] szIRFileName);
	private native static int[] HashImpulseResponse(byte[] baBuffer, int nBufferSize); 

	public static boolean IsCPUSupportNEON()
	{
		if (!m_JniLoadOK) return false;
		int nResult = CheckCPUHasNEON();
		Log.i("ViPER4Android_Utils", "CPUInfo[jni] = NEON:" + nResult);
		if (nResult == 0) return false;
		return true;
	}

	public static boolean IsCPUSupportVFP()
	{
		if (!m_JniLoadOK) return false;
		int nResult = CheckCPUHasVFP();
		Log.i("ViPER4Android_Utils", "CPUInfo[jni] = VFP:" + nResult);
		if (nResult == 0) return false;
		return true;
	}

	public static int[] GetImpulseResponseInfoArray(String szIRFileName)
	{
		// Convert unicode string to multi-byte string
		byte[] stringBytes = szIRFileName.getBytes(Charset.forName("US-ASCII"));
		if (stringBytes == null) return null;
		// Call native
		return GetImpulseResponseInfo(stringBytes);
	}

	public static byte[] ReadImpulseResponseToArray(String szIRFileName)
	{
		// Convert unicode string to multi-byte string
		byte[] stringBytes = szIRFileName.getBytes(Charset.forName("US-ASCII"));
		if (stringBytes == null) return null;
		// Call native
		return ReadImpulseResponse(stringBytes);
	}

	public static int[] GetHashImpulseResponseArray(byte[] baBuffer)
	{
		if (baBuffer == null) return null;
		// Call native
		return HashImpulseResponse(baBuffer, baBuffer.length);
	}
}
