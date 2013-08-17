package com.vipercn.viper4android.activity;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Environment;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import com.stericson.RootTools.*;


public class Utils
{
    protected static final String TAG = "ViPER4Android";

    // Check if the specified file exists.
    public static boolean fileExists(String filename)
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
    public static void getFileNameList(File path, String fileExt, ArrayList<String> fileList)
    {
        if (path.isDirectory())
        {
            File[] files = path.listFiles();
            if (null == files) return;      
            for(int i = 0; i < files.length; i++)
            	getFileNameList(files[i], fileExt, fileList);
        }
        else
        {
            String filePath = path.getAbsolutePath();
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            if (fileName.toLowerCase().endsWith(fileExt))
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
    			if (szChunks[0].trim().toLowerCase().equals("profile_name"))
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
	    	getFileNameList(fProfileDirHandle, ".prf", szProfileList);

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
	    	getFileNameList(fProfileDirHandle, ".prf", szProfileList);

	    	boolean bFoundProfile = false;
	    	for (int idx = 0; idx < szProfileList.size(); idx++)
	    	{
	    		String szFileName = szProfileDir + szProfileList.get(idx);
	    		String szName = GetProfileName(szFileName);
	    		if (szProfileName.trim().toUpperCase().equals(szName.trim().toUpperCase()))
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
	    	getFileNameList(fProfileDirHandle, ".prf", szProfileFileList);
	    	String szProfileFileName = "";
	    	for (int idx = 0; idx < szProfileFileList.size(); idx++)
	    	{
	    		String szFileName = szProfileDir + szProfileFileList.get(idx);
	    		String szName = GetProfileName(szFileName);
	    		if (szProfileName.trim().toUpperCase().equals(szName.trim().toUpperCase()))
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
        			if (szChunks[1].trim().toLowerCase().equals("boolean"))
        			{
        				String szParameter = szChunks[0];
        				boolean bValue = Boolean.valueOf(szChunks[2]);
        				e.putBoolean(szParameter, bValue);
        			}
        			else if (szChunks[1].trim().toLowerCase().equals("string"))
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
    			if (fileExists(szOutFileName)) new File(szOutFileName).delete();

    			FileOutputStream fosOutput = new FileOutputStream(szOutFileName);
        		OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "UTF-8");
        		BufferedWriter bwOutput = new BufferedWriter(oswOutput);

        		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd   hh:mm:ss");
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

    // Run root command
    public static boolean runRootCommand(String szCommand)
    {
        Process mProcess = null;
        DataOutputStream mOutStream = null;
        try
        {
        	mProcess = Runtime.getRuntime().exec("su"); 
        	mOutStream = new DataOutputStream(mProcess.getOutputStream());
        	mOutStream.writeBytes(szCommand + "\n");
        	mOutStream.flush();
        	Thread.sleep(100);
        	mOutStream.writeBytes("exit\n");
        	mOutStream.flush();
            mProcess.waitFor();
        }
        catch (Exception e)
        {
            return false;
        }
        finally
        {
            try
            {
                if (mOutStream != null) mOutStream.close();
                if(mProcess != null) mProcess.destroy();
            }
            catch (Exception e)
            {
                return false;
            }
        }
        return true;
    }

    // Run root commands
    public static boolean runRootCommand(String[] szCommand, int nSleepTime)
    {
        Process mProcess = null;
        DataOutputStream mOutStream = null;
        try
        {
        	mProcess = Runtime.getRuntime().exec("su"); 
        	mOutStream = new DataOutputStream(mProcess.getOutputStream());
        	for (int i = 0; i < szCommand.length; i++)
        	{
        		mOutStream.writeBytes(szCommand[i] + "\n");
        		mOutStream.flush();
        		Thread.sleep(nSleepTime);
        	}
        	mOutStream.writeBytes("exit\n");
        	mOutStream.flush();
            mProcess.waitFor();
        }
        catch (Exception e)
        {
            return false;
        }
        finally
        {
            try
            {
                if (mOutStream != null) mOutStream.close();
                if(mProcess != null) mProcess.destroy();
            }
            catch (Exception e)
            {
                return false;
            }
        }
        return true;
    }

    // Acquire root permission
    public static boolean AcquireRoot()
    {
    	RootTools.useRoot = true;
    	if (!RootTools.isRootAvailable()) return false;
    	if (!RootTools.isAccessGiven()) return false;
    	return true;
    }

    // Find toolbox
    public static String GetToolbox(String szName)
    {
    	try
    	{
    		Log.i("ViPER4Android_Utils", "Searching toolbox " + szName + " ...");
    		if (fileExists("/system/bin/" + szName))
    		{
    			Log.i("ViPER4Android_Utils", "Found /system/bin/" + szName);
    			return "/system/bin/" + szName;
    		}
    		else if (fileExists("/system/xbin/" + szName))
    		{
    			Log.i("ViPER4Android_Utils", "Found /system/xbin/" + szName);
    			return "/system/xbin/" + szName;
    		}
    		else if (fileExists("/bin/" + szName))
    		{
    			Log.i("ViPER4Android_Utils", "Found /bin/" + szName);
    			return "/bin/" + szName;
    		}
    		else if (fileExists("/xbin/" + szName))
    		{
    			Log.i("ViPER4Android_Utils", "Found /xbin/" + szName);
    			return "/xbin/" + szName;
    		}
    		else if (fileExists("/sbin/" + szName))
    		{
    			Log.i("ViPER4Android_Utils", "Found /sbin/" + szName);
    			return "/sbin/" + szName;
    		}
    		else
    		{
    			Log.i("ViPER4Android_Utils", "Toolbox " + szName + " not found!");
    			return "";
    		}
    	}
    	catch (Exception e)
    	{
    		Log.i("ViPER4Android_Utils", "Error: " + e.getMessage());
    		return "";
    	}
    }

    // Perform toolbox test
    public static boolean PerformToolboxTest(String szToolbox, boolean bUseCopyCmd)
    {
    	String szToolboxPath = GetToolbox(szToolbox);
    	if (szToolboxPath == null) return false;
    	if (szToolboxPath.equals("")) return false;

    	Log.i("ViPER4Android_Utils", "Performing toolbox test, toolbox = " + szToolboxPath);

    	Random rndMachine = new Random();
    	String szTestFilename = "test_" + rndMachine.nextInt(65536) + ".rnd";
    	String szSysTestFilename = "/system/" + szTestFilename;
    	String szDataTestFilename = "/data/" + szTestFilename;

    	String szCommandList[] = new String[7];
    	szCommandList[0] = szToolboxPath + " mount -o remount,rw /system /system";
    	szCommandList[1] = szToolboxPath + " echo test > " + szSysTestFilename;
    	szCommandList[2] = szToolboxPath + " sync";

    	if (bUseCopyCmd) szCommandList[3] = szToolboxPath + " cp " + szSysTestFilename + " " + szDataTestFilename;
    	else szCommandList[3] = szToolboxPath + " dd if=" + szSysTestFilename + " of=" + szDataTestFilename;

    	szCommandList[4] = szToolboxPath + " rm " + szSysTestFilename;
    	szCommandList[5] = szToolboxPath + " sync";
    	szCommandList[6] = szToolboxPath + " mount -o remount,ro /system /system";
    	runRootCommand(szCommandList, 200);

    	if (fileExists(szSysTestFilename))
    	{
    		Log.i("ViPER4Android_Utils", "Toolbox \"" + szToolboxPath + "\" test failed, remove function failure.");
    		return false;
    	}
    	if (!fileExists(szDataTestFilename))
    	{
    		Log.i("ViPER4Android_Utils", "Toolbox \"" + szToolboxPath + "\" test failed, mount or echo or cp function failure.");
    		return false;
    	}

    	runRootCommand(szToolboxPath + " rm " + szDataTestFilename);
    	Log.i("ViPER4Android_Utils", "Toolbox \"" + szToolboxPath + "\" test succeed.");

    	return true;
    }

    // Get toolbox pathname in preference
    public static String GetSavedToolbox(String szPreferenceName, Context ctx)
    {
    	SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName, Context.MODE_PRIVATE);
    	if (preferences == null) return "";
    	String szToolbox = preferences.getString("viper4android.settings.toolbox", "none");
    	if (szToolbox == null) return "";
    	if (szToolbox.equals("")) return "";
    	if (szToolbox.equals("none")) return "";
    	return szToolbox;
    }

    // Make a copy command line
    public static String MakeCopyCmdLine(String szPreferenceName, Context ctx, String szSrcFile, String szDstFile)
    {
    	String szToolbox = GetSavedToolbox(szPreferenceName, ctx);
    	if (szToolbox.equals("")) return "";

    	SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName, Context.MODE_PRIVATE);
    	if (preferences == null) return "";
    	String szCopy = preferences.getString("viper4android.settings.copycmd", "dd");
    	if (szCopy == null) return "";
    	if (szCopy.equals("")) return "";

    	if (szCopy.equalsIgnoreCase("dd"))
    	{
    		return szToolbox + " dd if=" + szSrcFile + " of=" + szDstFile;
    	}
    	else if (szCopy.equalsIgnoreCase("cp"))
    	{
    		return szToolbox + " cp " + szSrcFile + " " + szDstFile;
    	}
    	else return "";
    }

    // Uninstall ViPER4Android FX driver
    public static void UninstallDrv_FX(String szPreferenceName, Context ctx)
    {
    	String szToolbox = GetSavedToolbox(szPreferenceName, ctx);
    	if (szToolbox.equals("")) return;

    	String szMount  = szToolbox + " mount";
    	String szRemove = szToolbox + " rm";
    	String szSync   = szToolbox + " sync";

    	String szCmdLine[] = new String[4];
    	szCmdLine[0] = szMount + " -o remount,rw /system /system";
    	szCmdLine[1] = szRemove + " /system/lib/soundfx/libv4a_fx_gb.so";
    	szCmdLine[2] = szSync;
    	szCmdLine[3] = szMount + " -o remount,ro /system /system";
    	runRootCommand(szCmdLine, 200);
    }

    // Uninstall ViPER4Android XHiFi driver
    public static void UninstallDrv_XHiFi(String szPreferenceName, Context ctx)
    {
    	String szToolbox = GetSavedToolbox(szPreferenceName, ctx);
    	if (szToolbox.equals("")) return;

    	String szMount  = szToolbox + " mount";
    	String szRemove = szToolbox + " rm";
    	String szSync   = szToolbox + " sync";

    	String szCmdLine[] = new String[4];
    	szCmdLine[0] = szMount + " -o remount,rw /system /system";
    	szCmdLine[1] = szRemove + " /system/lib/soundfx/libv4a_xhifi_gb.so";
    	szCmdLine[2] = szSync;
    	szCmdLine[3] = szMount + " -o remount,ro /system /system";
    	runRootCommand(szCmdLine, 200);
    }

    // Get application data path
    private static String GetBasePath(Context ctx)
    {   	
    	Context cont = ctx.getApplicationContext();
    	String szBasePath = cont.getFilesDir().toString();
    	if (!cont.getFilesDir().exists())
    		if (!cont.getFilesDir().mkdir()) return "";
    	return szBasePath;
	}

    // Copy assets to local
    private static boolean CopyAssetsToLocal(Context ctx, String szSourceName, String szDstName)
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
	        byte[] tBuffer = new byte[1024];  
	        int nLength = 0;  
	        while ((nLength = myInput.read(tBuffer)) > 0) 
	        	myOutput.write(tBuffer, 0, nLength);   
	        myOutput.flush();
	        myInput.close();   
	        myInput = null;
	        myOutput.close();
	        myOutput = null;
        }
        catch (Exception e)
        {
        	return false;
        }

        return true;
    }

    // Generate a command line to copy a file
    public static String MakeCopyCmdLine(String szDD, String szCopy, String szSource, String szDest)
    {
    	if (szCopy.equals(""))
    		return szDD + " if=" + szSource + " of=" + szDest;
    	else return szCopy + " " + szSource + " " + szDest;
    }

    // Install ViPER4Android FX driver
    public static boolean InstallDrv_FX(String szPreferenceName, Context ctx, String szDriverName)
    {
    	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
    		return false;

    	// Copy driver assets to local
    	if (!CopyAssetsToLocal(ctx, szDriverName, "libv4a_fx_gb.so"))
    		return false;

    	String szToolbox = GetSavedToolbox(szPreferenceName, ctx);
    	if (szToolbox.equals("")) return false;

    	// Prepare commands
    	String szMount  = szToolbox + " mount";
    	String szChmod  = szToolbox + " chmod";
    	String szSync   = szToolbox + " sync";

    	// Copy back to system
    	String szBaseDrvPathName = GetBasePath(ctx) + "/" + "libv4a_fx_gb.so";
    	String szCopyToSystem[] = new String[6];
    	szCopyToSystem[0] = szMount + " -o remount,rw /system /system";
    	szCopyToSystem[1] = MakeCopyCmdLine(szPreferenceName, ctx, szBaseDrvPathName, "/system/lib/soundfx/libv4a_fx_gb.so");
    	szCopyToSystem[2] = szSync;
    	szCopyToSystem[3] = szChmod + " 644 /system/lib/soundfx/libv4a_fx_gb.so";
    	szCopyToSystem[4] = szSync;
    	szCopyToSystem[5] = szMount + " -o remount,ro /system /system";
    	runRootCommand(szCopyToSystem, 200);

    	// Check installation
    	if (!fileExists("/system/lib/soundfx/libv4a_fx_gb.so"))
    		return false;
    	return true;
    }

    // Install ViPER4Android XHiFi driver
    public static boolean InstallDrv_XHiFi(String szPreferenceName, Context ctx, String szDriverName)
    {
    	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
    		return false;

    	// Copy driver assets to local
    	if (!CopyAssetsToLocal(ctx, szDriverName, "libv4a_xhifi_gb.so"))
    		return false;

    	String szToolbox = GetSavedToolbox(szPreferenceName, ctx);
    	if (szToolbox.equals("")) return false;

    	// Prepare commands
    	String szMount  = szToolbox + " mount";
    	String szChmod  = szToolbox + " chmod";
    	String szSync   = szToolbox + " sync";

    	// Copy back to system
    	String szBaseDrvPathName = GetBasePath(ctx) + "/" + "libv4a_xhifi_gb.so";
    	String szCopyToSystem[] = new String[6];
    	szCopyToSystem[0] = szMount + " -o remount,rw /system /system";
    	szCopyToSystem[1] = MakeCopyCmdLine(szPreferenceName, ctx, szBaseDrvPathName, "/system/lib/soundfx/libv4a_xhifi_gb.so");
    	szCopyToSystem[2] = szSync;
    	szCopyToSystem[3] = szChmod + " 644 /system/lib/soundfx/libv4a_xhifi_gb.so";
    	szCopyToSystem[4] = szSync;
    	szCopyToSystem[5] = szMount + " -o remount,ro /system /system";
    	runRootCommand(szCopyToSystem, 200);

    	// Check installation
    	if (!fileExists("/system/lib/soundfx/libv4a_xhifi_gb.so"))
    		return false;
    	return true;
    }
}
