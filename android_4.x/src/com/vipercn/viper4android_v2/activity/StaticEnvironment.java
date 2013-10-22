package com.vipercn.viper4android_v2.activity;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeoutException;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.util.Log;

import com.stericson.RootTools.*;
import com.stericson.RootTools.exceptions.RootDeniedException;
import com.stericson.RootTools.execution.CommandCapture;

public class StaticEnvironment
{
	private static boolean m_bEnvironmentInited = false;

	private static boolean m_bVBoXPrepared = false;
	private static String m_szVBoXPath = "";

	private static String m_szExternalStoragePath = "";
	private static String m_szV4AESRoot = "";
	private static String m_szV4AESKernel = "";
	private static String m_szV4AESProfile = "";

	private static boolean m_bDriverInited = false;
	private static boolean m_bDriverIsOK = false;
	private static String m_szDriverVersion = "";

	private static boolean InstallVBox(Context ctx)
	{
		Log.i("ViPER4Android", "Installing vbox ...");

		// Copy vbox to local first
    	Log.i("ViPER4Android", "Extracting vbox to local");
    	if (!Utils.CopyAssetsToLocal(ctx, "vbox", "vbox"))
    	{
    		Log.i("ViPER4Android", "Can not copy vbox to local dir");
    		return false;
    	}

    	// Get vbox path
    	String szVBoxPath = Utils.GetBasePath(ctx);
    	if (szVBoxPath.equals(""))
    	{
    		Log.i("ViPER4Android", "GetBasePath() failed");
    		return false;
    	}
    	if (szVBoxPath.endsWith("/")) szVBoxPath = szVBoxPath + "vbox";
    	else szVBoxPath = szVBoxPath + "/vbox";
    	Log.i("ViPER4Android", "vbox path = " + szVBoxPath);

    	boolean bVBoXInstalled = false;

    	// Try toolbox first
    	Log.i("ViPER4Android", "Now install vbox with viper's method");
    	{
    		if (ShellCommand.OpenRootShell(true))
    		{
    			/* Toolbox is a basic util for android system */
    			/* Considering the fragmentation of android, cp and dd commands may not included in all roms */
    			/* But cat and chmod should included, otherwise android may malfunction */
    			/* NOTICE: toolbox has no command stdout echo, so I just wait 0.5 secs for executing the command */
    			boolean bResult = true;
    			bResult &= ShellCommand.SendShellCommand("toolbox cat " + szVBoxPath + " > /data/vbox", 0.5f);
    			Log.i("ViPER4Android", "Command return = " + ShellCommand.GetLastReturnValue());
    			bResult &= ShellCommand.SendShellCommand("toolbox chmod 777 /data/vbox", 0.5f);
    			Log.i("ViPER4Android", "Command return = " + ShellCommand.GetLastReturnValue());
    			/* I think the best way to check wether vbox was installed is execute it and check the exit value */
    			bResult &= ShellCommand.SendShellCommand("/data/vbox", 1.0f);  /* vbox has command stdout echo (except dd and cat), so we can wait infinite here */
    			int nVBoXExitValue = ShellCommand.GetLastReturnValue();  /* If the shell failed to execute vbox, the return value will never equal 0 */
				if (bResult && (nVBoXExitValue == 0))
				{
					Log.i("ViPER4Android", "Good, vbox installed");
					bVBoXInstalled = true;
				}
				else
				{
					Log.i("ViPER4Android", "Bad, vbox install failed");
					bVBoXInstalled = false;
				}
				ShellCommand.CloseShell();
    		}
    		else
    		{
    			Log.i("ViPER4Android", "Can't open root shell");
    		}
    	}
    	if (bVBoXInstalled)
    		return true;

    	// Try roottools
    	Log.i("ViPER4Android", "Now install vbox with roottools");
    	{
    		RootTools.useRoot = true;
    		RootTools.debugMode = true;

    		if (!RootTools.isRootAvailable()) return false;
    		if (!RootTools.isAccessGiven()) return false;

    		if (!RootTools.copyFile(szVBoxPath, "/data/vbox", false, false))
    		{
    			try { RootTools.closeAllShells(); }
    			catch (IOException e) {}
    			Log.i("ViPER4Android", "Bad, vbox install failed");
    			return false;
    		}

    		boolean bError = false;
    		CommandCapture ccSetPermission = new CommandCapture(0, "toolbox chmod 777 /data/vbox");
    		try { RootTools.getShell(true).add(ccSetPermission).waitForFinish(); }
    		catch (InterruptedException e) { bError = true; }
    		catch (IOException e) { bError = true; }
    		catch (TimeoutException e) { bError = true; }
    		catch (RootDeniedException e) { bError = true; }

			try { RootTools.closeAllShells(); }
			catch (IOException e) {}

    		if (bError)
    		{
    			Log.i("ViPER4Android", "Bad, vbox install failed");
    			return false;
    		}
    	}
    	Log.i("ViPER4Android", "Good, vbox installed");

    	return true;
	}

	private static void ProceedVBoX(Context ctx)
	{
		// Check vbox
		Log.i("ViPER4Android", "Checking vbox");
		if (ShellCommand.ExecuteWithoutShell("/data/vbox", null) == 0)
		{
			Log.i("ViPER4Android", "Good, vbox is ok");
			m_bVBoXPrepared = true;
			m_szVBoXPath = "/data/vbox";
			return;
		}

		// Install vbox
		if (InstallVBox(ctx))
		{
			ShellCommand.CloseShell();
			m_bVBoXPrepared = true;
			m_szVBoXPath = "/data/vbox";
			return;
		}
		ShellCommand.CloseShell();
		m_bVBoXPrepared = false;
		m_szVBoXPath = "";
	}

	private static boolean CheckWritable(String szFileName)
	{
		try
		{
			byte[] baBlank = new byte[16];
			FileOutputStream fosOutput = new FileOutputStream(szFileName);
			fosOutput.write(baBlank);
			fosOutput.flush();
			fosOutput.close();
			new File(szFileName).delete();
			return true;
		}
		catch (FileNotFoundException e)
		{
			Log.i("ViPER4Android", "FileNotFoundException, msg = " + e.getMessage());
			return false;
		}
		catch (IOException e)
		{
			Log.i("ViPER4Android", "IOException, msg = " + e.getMessage());
			return false;
		}
	}

	private static void ProceedExternalStoragePath()
	{
		// Get path
		String szExternalStoragePathName = Environment.getExternalStorageDirectory().getAbsolutePath();

    	// Check writable
    	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
    	{
        	if (Build.VERSION.SDK_INT >= 18)
        	{
        		if (szExternalStoragePathName.endsWith("/emulated/0") || szExternalStoragePathName.endsWith("/emulated/0/"))
        			szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0", "/emulated/legacy");
        	}
        	if (szExternalStoragePathName.endsWith("/")) m_szExternalStoragePath = szExternalStoragePathName;
        	else m_szExternalStoragePath = szExternalStoragePathName + "/";
        	m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
        	m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
        	m_szV4AESProfile = m_szV4AESRoot + "Profile/";
        	return;
    	}
    	else
    	{
    		boolean bPathFromSDKIsWorking = false;
    		boolean bPathFromLegacyIsWorking = false;
    		String szExtPath = "";
    		{
	        	if (szExternalStoragePathName.endsWith("/")) szExtPath = szExternalStoragePathName;
	        	else szExtPath = szExternalStoragePathName + "/";
	        	szExtPath = szExtPath + "v4a_test_file";
	    		Log.i("ViPER4Android", "Now checking for external storage writable, file = " + szExtPath);
	    		if (CheckWritable(szExtPath)) bPathFromSDKIsWorking = true;
    		}
    		{
	        	if (szExternalStoragePathName.endsWith("/")) szExtPath = szExternalStoragePathName;
	        	else szExtPath = szExternalStoragePathName + "/";
        		if (szExtPath.endsWith("/emulated/0/"))
        		{
        			szExtPath = szExtPath.replace("/emulated/0/", "/emulated/legacy/");
		        	szExtPath = szExtPath + "v4a_test_file";
		    		Log.i("ViPER4Android", "Now checking for external storage writable, file = " + szExtPath);
		    		if (CheckWritable(szExtPath)) bPathFromLegacyIsWorking = true;
        		}
    		}

    		if (bPathFromLegacyIsWorking)
    		{
            	szExternalStoragePathName = szExternalStoragePathName.replace("/emulated/0", "/emulated/legacy");
            	if (szExternalStoragePathName.endsWith("/")) m_szExternalStoragePath = szExternalStoragePathName;
            	else m_szExternalStoragePath = szExternalStoragePathName + "/";
            	m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
            	m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
            	m_szV4AESProfile = m_szV4AESRoot + "Profile/";
            	Log.i("ViPER4Android", "External storage path = " + m_szExternalStoragePath);
            	Log.i("ViPER4Android", "ViPER4Android root path = " + m_szV4AESRoot);
            	Log.i("ViPER4Android", "ViPER4Android kernel path = " + m_szV4AESKernel);
            	Log.i("ViPER4Android", "ViPER4Android profile path = " + m_szV4AESProfile);
            	return;
    		}
    		if (bPathFromSDKIsWorking)
    		{
            	if (szExternalStoragePathName.endsWith("/")) m_szExternalStoragePath = szExternalStoragePathName;
            	else m_szExternalStoragePath = szExternalStoragePathName + "/";
            	m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
            	m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
            	m_szV4AESProfile = m_szV4AESRoot + "Profile/";
            	Log.i("ViPER4Android", "External storage path = " + m_szExternalStoragePath);
            	Log.i("ViPER4Android", "ViPER4Android root path = " + m_szV4AESRoot);
            	Log.i("ViPER4Android", "ViPER4Android kernel path = " + m_szV4AESKernel);
            	Log.i("ViPER4Android", "ViPER4Android profile path = " + m_szV4AESProfile);
            	return;
    		}

    		Log.i("ViPER4Android", "Really terrible thing, external storage detection failed, v4a may malfunctioned");
        	if (szExternalStoragePathName.endsWith("/")) m_szExternalStoragePath = szExternalStoragePathName;
        	else m_szExternalStoragePath = szExternalStoragePathName + "/";
        	m_szV4AESRoot = m_szExternalStoragePath + "ViPER4Android/";
        	m_szV4AESKernel = m_szV4AESRoot + "Kernel/";
        	m_szV4AESProfile = m_szV4AESRoot + "Profile/";	
    	}
	}

	public static boolean IsEnvironmentInited()
	{
		return m_bEnvironmentInited;
	}

	public static void InitEnvironment(Context ctx)
	{
		if (m_bEnvironmentInited) return;
		ProceedVBoX(ctx);
		ProceedExternalStoragePath();
		m_bEnvironmentInited = true;
	}

	public static boolean GetVBoXUsable()
	{
		return m_bVBoXPrepared;
	}

	public static String GetVBoXExecutablePath()
	{
		return m_szVBoXPath;
	}

	public static String GetESPath()
	{
		return m_szExternalStoragePath;
	}

	public static String GetV4ARootPath()
	{
		return m_szV4AESRoot;
	}

	public static String GetV4AKernelPath()
	{
		return m_szV4AESKernel;
	}

	public static String GetV4AProfilePath()
	{
		return m_szV4AESProfile;
	}

	/********** Because android audio effect engine is native, so we use static method to record status **********/
	public static void SetDriverStatus(boolean bDriverIsOK, String szDriverVersion)
	{
		Log.i("ViPER4Android", "Got driver status");
		Log.i("ViPER4Android", "Static old = [" + m_bDriverIsOK + ", " + m_szDriverVersion + "]");
		Log.i("ViPER4Android", "Static new = [" + bDriverIsOK + ", " + szDriverVersion + "]");
		Log.i("ViPER4Android", "Current status = " + m_bDriverInited);
		if (m_bDriverInited)
		{
			if (!m_bDriverIsOK && bDriverIsOK) m_bDriverIsOK = bDriverIsOK;
			if (m_szDriverVersion.equals("") || m_szDriverVersion.equals("0.0.0.0"))
				m_szDriverVersion = szDriverVersion;
			return;
		}
		m_bDriverIsOK = bDriverIsOK;
		m_szDriverVersion = szDriverVersion;
		m_bDriverInited = true;
	}

	public static boolean DriverInited()
	{
		return m_bDriverInited;
	}

	public static boolean DriverIsUsable()
	{
		return m_bDriverIsOK;
	}

	public static String DriverVersion()
	{
		if (m_szDriverVersion.equals("")) return "0.0.0.0";
		return m_szDriverVersion;
	}
	/*************************************************************************************************************/
}
