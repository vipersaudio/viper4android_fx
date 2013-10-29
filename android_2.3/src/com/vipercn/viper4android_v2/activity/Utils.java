package com.vipercn.viper4android_v2.activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;
import java.util.StringTokenizer;

import com.stericson.RootTools.*;
import com.stericson.RootTools.execution.CommandCapture;

public class Utils
{
    public static class CPUInfo
    {
    	private boolean m_bCPUHasNEON = false;
    	private boolean m_bCPUHasVFP = false;

    	// Lets read /proc/cpuinfo in java
    	private boolean ReadCPUInfo()
    	{
    		String szCPUInfoFile = "/proc/cpuinfo";
    		FileReader frCPUInfoReader = null;
    		BufferedReader brReader = null;

    		m_bCPUHasNEON = false;
    		m_bCPUHasVFP = false;

    		// Find "Features" line, extract neon and vfp
    		try
    		{
    			frCPUInfoReader = new FileReader(szCPUInfoFile);
    			brReader = new BufferedReader(frCPUInfoReader);
    			while (true)
    			{
    				String szLine = brReader.readLine();
    				if (szLine == null) break;
    				szLine = szLine.trim();
    				if (szLine.startsWith("Features"))
    				{
    					Log.i("ViPER4Android_Utils", "CPUInfo[java] = <" + szLine + ">");
    					StringTokenizer stBlock = new StringTokenizer(szLine);
    					while (stBlock.hasMoreElements())
    					{
    						String szFeature = stBlock.nextToken();
    						if (szFeature != null)
    						{
    							if (szFeature.equalsIgnoreCase("neon")) m_bCPUHasNEON = true;
    							else if (szFeature.equalsIgnoreCase("vfp")) m_bCPUHasVFP = true;
    						}
    						continue;
    					}
    				}
    			}
	    		brReader.close();
	    		frCPUInfoReader.close();

	    		Log.i("ViPER4Android_Utils", "CPUInfo[java] = NEON:" + m_bCPUHasNEON + ", VFP:" + m_bCPUHasVFP);
	    		if (!m_bCPUHasNEON && !m_bCPUHasVFP)
	    			return false;
	    		return true;
    		}
    		catch (IOException e)
    		{
    			try
    			{
    				if (brReader != null) brReader.close();
    				if (frCPUInfoReader != null) frCPUInfoReader.close();
    				return false;
    			}
    			catch (Exception ex)
    			{
    				return false;
    			}
    		}
    	}

    	// Lets read /proc/cpuinfo in jni
    	private void ReadCPUInfoJni()
    	{
    		m_bCPUHasNEON = V4AJniInterface.IsCPUSupportNEON();
    		m_bCPUHasVFP = V4AJniInterface.IsCPUSupportVFP();
    	}

    	// Buffered result
    	public CPUInfo()
    	{
    		m_bCPUHasNEON = false;
    		m_bCPUHasVFP = false;
    		if (!ReadCPUInfo())
    			ReadCPUInfoJni();
    	}

    	public boolean HasNEON() { return m_bCPUHasNEON; }
    	public boolean HasVFP() { return m_bCPUHasVFP; }
    }

    // Check if the specified file exists.
    public static boolean FileExists(String filename)
    {
    	boolean bExist = new File(filename).exists();
    	if (!bExist)
    	{
    		RootTools.useRoot = true;
    		bExist = RootTools.exists(filename);
    	}
        return bExist;
    }

    // Get a file length
    public static long GetFileLength(String szFileName)
    {
    	try
    	{
    		return new File(szFileName).length();
    	}
    	catch (Exception e)
    	{
    		return 0;
    	}
    }

    // Download a file from internet
    public static boolean DownloadFile(String szURL, String szFileName, String szStorePath)
    {
    	try
    	{
	    	URL myURL = new URL(szURL);
	    	URLConnection conn = myURL.openConnection();
	    	conn.connect();
	    	InputStream is = conn.getInputStream();
		    if (conn.getContentLength() <= 0) return false;
		    if (is == null) return false;
		    FileOutputStream fos = new FileOutputStream(szStorePath + szFileName);

		    byte buf[] = new byte[1024];
		    do
		    {
		        int numread = is.read(buf);
		        if (numread == -1) break;
		        fos.write(buf, 0, numread);
		    } while (true);
	        is.close();

	        return true;
    	}
    	catch (Exception e)
    	{
    		return false;
    	}
    }

    // Check a file with checksum
    public static boolean FileChecksum(String szFilePathName, String szChecksum)
    {
    	long lChecksum = 0;

    	try
    	{
    		FileInputStream fis = new FileInputStream(szFilePathName);
    		byte buf[] = new byte[1024];
    		do
    		{
    			int numread = fis.read(buf);
    			if (numread == -1) break;
    			for (int idx = 0; idx < numread; idx++)
    				lChecksum = lChecksum + (long)(buf[idx]);
    		} while (true);
    		fis.close();
    		String szNewChecksum = Long.toString(lChecksum);
    		if (szChecksum.equals(szNewChecksum)) return true;
    		else return false;
    	}
    	catch (Exception e)
    	{
    		return false;
    	}
    }

    // Read file list from path
    public static void GetFileNameList(File path, String fileExt, ArrayList<String> fileList)
    {
        if (path.isDirectory())
        {
            File[] files = path.listFiles();
            if (null == files) return;      
            for(int i = 0; i < files.length; i++)
            	GetFileNameList(files[i], fileExt, fileList);
        }
        else
        {
            String filePath = path.getAbsolutePath();
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            if (fileName.toLowerCase(Locale.US).endsWith(fileExt))
            	fileList.add(fileName);
        }
    }

    // Get profile name from a file
    public static String GetProfileName(String szProfileFileName)
    {
    	try
    	{
			FileInputStream fisInput = new FileInputStream(szProfileFileName);
			InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
			BufferedReader brInput = new BufferedReader(isrInput);
			String szProfileName = "";
			while (true)
			{
				String szLine = brInput.readLine();
    			if (szLine == null) break;
    			if (szLine.startsWith("#")) continue;

    			String szChunks[] = szLine.split("=");
    			if (szChunks.length != 2) continue;
    			if (szChunks[0].trim().equalsIgnoreCase("profile_name"))
    			{
    				szProfileName = szChunks[1];
    				break;
    			}
			}
			brInput.close();
			isrInput.close();
			fisInput.close();

			return szProfileName;
    	}
    	catch (Exception e)
    	{
    		return "";
    	}
    }

    // Get profile name list
    public static ArrayList<String> GetProfileList(String szProfileDir)
    {
    	try
    	{
	    	File fProfileDirHandle = new File(szProfileDir);
	    	ArrayList<String> szProfileList = new ArrayList<String>();
	    	GetFileNameList(fProfileDirHandle, ".prf", szProfileList);

	    	ArrayList<String> szProfileNameList = new ArrayList<String>();
	    	for (int idx = 0; idx < szProfileList.size(); idx++)
	    	{
	    		String szFileName = szProfileDir + szProfileList.get(idx);
	    		String szName = GetProfileName(szFileName);
	    		szProfileNameList.add(szName.trim());
	    	}

	    	return szProfileNameList;
    	}
    	catch (Exception e)
    	{
    		return new ArrayList<String>();
    	}
    }

    // Check whether profile has been exists
    public static boolean CheckProfileExists(String szProfileName, String szProfileDir)
    {
    	try
    	{
	    	File fProfileDirHandle = new File(szProfileDir);
	    	ArrayList<String> szProfileList = new ArrayList<String>();
	    	GetFileNameList(fProfileDirHandle, ".prf", szProfileList);

	    	boolean bFoundProfile = false;
	    	for (int idx = 0; idx < szProfileList.size(); idx++)
	    	{
	    		String szFileName = szProfileDir + szProfileList.get(idx);
	    		String szName = GetProfileName(szFileName);
	    		if (szProfileName.trim().equalsIgnoreCase(szName.trim()))
	    		{
	    			bFoundProfile = true;
	    			break;
	    		}
	    	}

	    	return bFoundProfile;
    	}
    	catch (Exception e)
    	{
    		return false;
    	}
    }

    // Load profile from file
    public static boolean LoadProfile(String szProfileName, String szProfileDir, String szPreferenceName, Context ctx)
    {
    	try
    	{
	    	File fProfileDirHandle = new File(szProfileDir);
	    	ArrayList<String> szProfileFileList = new ArrayList<String>();
	    	GetFileNameList(fProfileDirHandle, ".prf", szProfileFileList);
	    	String szProfileFileName = "";
	    	for (int idx = 0; idx < szProfileFileList.size(); idx++)
	    	{
	    		String szFileName = szProfileDir + szProfileFileList.get(idx);
	    		String szName = GetProfileName(szFileName);
	    		if (szProfileName.trim().equalsIgnoreCase(szName.trim()))
	    		{
	    			szProfileFileName = szFileName;
	    			break;
	    		}
	    	}
	    	if (szProfileFileName.equals("")) return false;

    		SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName, Context.MODE_PRIVATE);
    		if (preferences != null)
    		{
    			FileInputStream fisInput = new FileInputStream(szProfileFileName);
    			InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
    			BufferedReader brInput = new BufferedReader(isrInput);
    			Editor e = preferences.edit();
    			while (true)
    			{
    				String szLine = brInput.readLine();
        			if (szLine == null) break;
        			if (szLine.startsWith("#")) continue;

        			String szChunks[] = szLine.split("=");
        			if (szChunks.length != 3) continue;
        			if (szChunks[1].trim().equalsIgnoreCase("boolean"))
        			{
        				String szParameter = szChunks[0];
        				boolean bValue = Boolean.valueOf(szChunks[2]);
        				e.putBoolean(szParameter, bValue);
        			}
        			else if (szChunks[1].trim().equalsIgnoreCase("string"))
        			{
        				String szParameter = szChunks[0];
        				String szValue = szChunks[2];
        				e.putString(szParameter, szValue);
        			}
        			else continue;
    			}
    			e.commit();
    			brInput.close();
    			isrInput.close();
    			fisInput.close();

    			return true;
    		}
    		else return false;
    	}
    	catch (Exception e)
    	{
    		return false;
    	}
    }

    // Save profile to file
    public static void SaveProfile(String szProfileName, String szProfileDir, String szPreferenceName, Context ctx)
    {
    	try
    	{
    		SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName, Context.MODE_PRIVATE);
    		if (preferences != null)
    		{
    			String szOutFileName = szProfileDir + szProfileName + ".prf";
    			if (FileExists(szOutFileName)) new File(szOutFileName).delete();

    			FileOutputStream fosOutput = new FileOutputStream(szOutFileName);
        		OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "UTF-8");
        		BufferedWriter bwOutput = new BufferedWriter(oswOutput);

        		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd   hh:mm:ss", Locale.US);
        		String szDate = sDateFormat.format(new java.util.Date());

        		bwOutput.write("# ViPER4Android audio effect profile !\n");
        		bwOutput.write("# Created " + szDate + "\n\n");
        		bwOutput.write("profile_name=" + szProfileName + "\n\n");

        		String szValue = "";

        		// boolean values
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.enable", false));
        		bwOutput.write("viper4android.headphonefx.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.speakerfx.enable", false));
        		bwOutput.write("viper4android.speakerfx.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.speakerfx.spkopt.enable", false));
        		bwOutput.write("viper4android.speakerfx.spkopt.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false));
        		bwOutput.write("viper4android.headphonefx.playbackgain.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.fireq.enable", false));
        		bwOutput.write("viper4android.headphonefx.fireq.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.convolver.enable", false));
        		bwOutput.write("viper4android.headphonefx.convolver.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.colorfulmusic.enable", false));
        		bwOutput.write("viper4android.headphonefx.colorfulmusic.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.diffsurr.enable", false));
        		bwOutput.write("viper4android.headphonefx.diffsurr.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.vhs.enable", false));
        		bwOutput.write("viper4android.headphonefx.vhs.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.reverb.enable", false));
        		bwOutput.write("viper4android.headphonefx.reverb.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.dynamicsystem.enable", false));
        		bwOutput.write("viper4android.headphonefx.dynamicsystem.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.dynamicsystem.tube", false));
        		bwOutput.write("viper4android.headphonefx.dynamicsystem.tube=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.fidelity.bass.enable", false));
        		bwOutput.write("viper4android.headphonefx.fidelity.bass.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.fidelity.clarity.enable", false));
        		bwOutput.write("viper4android.headphonefx.fidelity.clarity.enable=boolean=" + szValue + "\n");
        		szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.cure.enable", false));
        		bwOutput.write("viper4android.headphonefx.cure.enable=boolean=" + szValue + "\n");

        		// string values
        		szValue = preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50");
        		bwOutput.write("viper4android.headphonefx.playbackgain.ratio=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400");
        		bwOutput.write("viper4android.headphonefx.playbackgain.maxscaler=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.playbackgain.volume", "80");
        		bwOutput.write("viper4android.headphonefx.playbackgain.volume=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fireq", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;");
        		bwOutput.write("viper4android.headphonefx.fireq=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;");
        		bwOutput.write("viper4android.headphonefx.fireq.custom=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.convolver.kernel", "");
        		bwOutput.write("viper4android.headphonefx.convolver.kernel=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.convolver.crosschannel", "0");
        		bwOutput.write("viper4android.headphonefx.convolver.crosschannel=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.colorfulmusic.coeffs", "120;200");
        		bwOutput.write("viper4android.headphonefx.colorfulmusic.coeffs=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.colorfulmusic.midimage", "150");
        		bwOutput.write("viper4android.headphonefx.colorfulmusic.midimage=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.diffsurr.delay", "500");
        		bwOutput.write("viper4android.headphonefx.diffsurr.delay=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.vhs.qual", "0");
        		bwOutput.write("viper4android.headphonefx.vhs.qual=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.reverb.roomsize", "0");
        		bwOutput.write("viper4android.headphonefx.reverb.roomsize=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0");
        		bwOutput.write("viper4android.headphonefx.reverb.roomwidth=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.reverb.damp", "0");
        		bwOutput.write("viper4android.headphonefx.reverb.damp=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.reverb.wet", "0");
        		bwOutput.write("viper4android.headphonefx.reverb.wet=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.reverb.dry", "50");
        		bwOutput.write("viper4android.headphonefx.reverb.dry=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.dynamicsystem.coeffs", "100;5600;40;80;50;50");
        		bwOutput.write("viper4android.headphonefx.dynamicsystem.coeffs=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.dynamicsystem.bass", "0");
        		bwOutput.write("viper4android.headphonefx.dynamicsystem.bass=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fidelity.bass.mode", "0");
        		bwOutput.write("viper4android.headphonefx.fidelity.bass.mode=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fidelity.bass.freq", "40");
        		bwOutput.write("viper4android.headphonefx.fidelity.bass.freq=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fidelity.bass.gain", "50");
        		bwOutput.write("viper4android.headphonefx.fidelity.bass.gain=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fidelity.clarity.mode", "0");
        		bwOutput.write("viper4android.headphonefx.fidelity.clarity.mode=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.fidelity.clarity.gain", "50");
        		bwOutput.write("viper4android.headphonefx.fidelity.clarity.gain=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.cure.crossfeed", "0");
        		bwOutput.write("viper4android.headphonefx.cure.crossfeed=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.outvol", "100");
        		bwOutput.write("viper4android.headphonefx.outvol=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.channelpan", "0");
        		bwOutput.write("viper4android.headphonefx.channelpan=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.headphonefx.limiter", "100");
        		bwOutput.write("viper4android.headphonefx.limiter=string=" + szValue + "\n");
        		szValue = preferences.getString("viper4android.speakerfx.limiter", "100");
        		bwOutput.write("viper4android.speakerfx.limiter=string=" + szValue + "\n");

        		bwOutput.flush();
        		bwOutput.close();
        		oswOutput.close();
        		fosOutput.close();
    		}
    	}
    	catch (Exception e)
    	{
    		return;
    	}
    }

    // Get application data path
    public static String GetBasePath(Context ctx)
    {
    	Context cont = ctx.getApplicationContext();
    	String szBasePath = cont.getFilesDir().toString();
    	if (!cont.getFilesDir().exists())
    		if (!cont.getFilesDir().mkdir()) return "";
    	return szBasePath;
	}

    // Copy assets to local
    public static boolean CopyAssetsToLocal(Context ctx, String szSourceName, String szDstName)
    {
    	String szBasePath = GetBasePath(ctx);
    	if (szBasePath == "") return false;
    	szDstName = szBasePath + "/" + szDstName;	

        InputStream myInput = null;
        OutputStream myOutput = null;
        String outFileName = szDstName;
        try
        {
        	File hfOutput = new File(szDstName);
        	if (hfOutput.exists()) hfOutput.delete();

	        myOutput = new FileOutputStream(outFileName);
	        myInput = ctx.getAssets().open(szSourceName);
	        byte[] tBuffer = new byte[4096];  /* 4K page size */
	        int nLength = 0;
	        while ((nLength = myInput.read(tBuffer)) > 0)
	        	myOutput.write(tBuffer, 0, nLength);
	        myOutput.flush();
	        myInput.close();
	        myOutput.close();
        }
        catch (Exception e)
        {
        	return false;
        }

        return true;
    }

    // Uninstall ViPER4Android FX driver
    public static void UninstallDrv_FX()
    {
    	// Lets acquire root first :)
    	RootTools.useRoot = true;
    	if (!RootTools.isRootAvailable()) return;
    	if (!RootTools.isAccessGiven()) return;
    	// When done, a root shell was opened

    	// Then delete the driver
    	String szDriverPathName = "/system/lib/soundfx/libv4a_fx_gb.so";
    	try
    	{
    		RootTools.useRoot = true;
    		if (RootTools.exists(szDriverPathName))
    		{
    			RootTools.remount("/system", "RW");
    			RootTools rtTools = new RootTools();
    			rtTools.deleteFileOrDirectory(szDriverPathName, false);
    		    CommandCapture ccRemove = new CommandCapture(0,
    		    		"rm " + szDriverPathName,
    		    		"toolbox rm " + szDriverPathName,
    		    		"busybox rm " + szDriverPathName);
    		    RootTools.getShell(true).add(ccRemove).waitForFinish();
    		    RootTools.remount("/system", "RO");
    			// Close all shells
    			RootTools.closeAllShells();
    		}
    	}
    	catch (Exception e)
    	{
    		return;
    	}
    }

    // Install ViPER4Android FX driver
    public static boolean InstallDrv_FX(Context ctx, String szDriverName)
    {
    	// Copy driver assets to local
    	if (!CopyAssetsToLocal(ctx, szDriverName, "libv4a_fx_gb.so"))
    		return false;

    	// Lets acquire root first :)
    	RootTools.useRoot = true;
    	if (!RootTools.isRootAvailable()) return false;
    	if (!RootTools.isAccessGiven()) return false;
    	// When done, a root shell was opened

    	// Check chmod utils
    	String szChmod = "";
    	if (RootTools.checkUtil("chmod"))
    		szChmod = "chmod";
    	else
    	{
    		if (RootTools.checkUtil("busybox") && RootTools.hasUtil("chmod", "busybox"))
    			szChmod = "busybox chmod";
    		else
    		{
    			if (RootTools.checkUtil("toolbox") && RootTools.hasUtil("chmod", "toolbox"))
    				szChmod = "toolbox chmod";
    		}
    	}
    	if ((szChmod == null) || szChmod.equals(""))
    		return false;

    	// Copy driver to system
    	boolean bOperationSucceed = true;
    	try
    	{
	    	String szBaseDrvPathName = GetBasePath(ctx) + "/" + "libv4a_fx_gb.so";
	    	// Copy files
	    	bOperationSucceed &= RootTools.remount("/system", "RW");
	    	if (bOperationSucceed) bOperationSucceed &= RootTools.copyFile(szBaseDrvPathName, "/system/lib/soundfx/libv4a_fx_gb.so", false, false);
	    	// Modify permission
		    CommandCapture ccSetPermission = new CommandCapture(0, szChmod + " 644 /system/lib/soundfx/libv4a_fx_gb.so");
		    RootTools.getShell(true).add(ccSetPermission).waitForFinish();
	    	RootTools.remount("/system", "RO");
    	}
    	catch (Exception e)
    	{
    		bOperationSucceed = false;
    	}

		/* Close root shell */
		try
		{
    		// Close all shells
    		RootTools.closeAllShells();
		}
		catch (Exception e)
		{
			return false;
		}

    	return bOperationSucceed;
    }
}
