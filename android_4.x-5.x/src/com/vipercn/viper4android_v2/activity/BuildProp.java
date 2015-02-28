package com.vipercn.viper4android_v2.activity;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.concurrent.TimeoutException;

import android.util.Log;

import com.stericson.RootTools.RootTools;
import com.stericson.RootTools.containers.Permissions;
import com.stericson.RootShell.exceptions.RootDeniedException;
import com.stericson.RootShell.execution.Command;

/*
 * I wrote this BuildProp for replacing the "BuildProp Tools".
 * Because of "BuildProp Tools" destroy the original file format, this will cause system failed to OTA.
 */

public class BuildProp {

	private final boolean ENABLE_DEBUG = false;
	private ArrayList<String> mBuildPropContent = new ArrayList<String>();

	public BuildProp() {
	}

	/*
	 * Read build.prop to memory
	 * Should call this method first
	 */
	public void initializeBuildprop()
	{
		mBuildPropContent.clear();

		FileInputStream fisInput = null;
		InputStreamReader isrInput = null;
		BufferedReader bufferInput = null;
		try {
			fisInput = new FileInputStream("/system/build.prop");
			isrInput = new InputStreamReader(fisInput, "ASCII");
			bufferInput = new BufferedReader(isrInput);
			while (true) {
				String currLine = bufferInput.readLine();
				if (currLine == null) break;
				mBuildPropContent.add(currLine);
			}
			bufferInput.close();
			isrInput.close();
			fisInput.close();
		} catch (FileNotFoundException e) {
			Log.i("ViPER4Android", "/system/build.prop not found");
		} catch (UnsupportedEncodingException e) {
		} catch (IOException e) {
		}

		if (ENABLE_DEBUG) {
			Log.i("ViPER4Android", "Dumping the content of build.prop, size = " + mBuildPropContent.size());
			for (int i = 0; i < mBuildPropContent.size(); i++) {
				Log.i("ViPER4Android", "[build.prop] " + mBuildPropContent.get(i));
			}
		}
	}

	/*
	 * Check whether build.prop contains a property
	 */
	public boolean propExists(String key) {
		for (int i = 0; i < mBuildPropContent.size(); i++) {
			String currLine = mBuildPropContent.get(i).trim();
			if ((currLine == null) || currLine.equals("")) continue;
			if (currLine.startsWith("#")) continue;
			String[] keyANDvalue = currLine.split("=");
			if (keyANDvalue == null) continue;
			if (keyANDvalue.length != 2) continue;
			if (keyANDvalue[0] == null) continue;
			if (key.equalsIgnoreCase(keyANDvalue[0])) {
				return true;
			}
		}
		return false;
	}

	/*
	 * Get a property value
	 */
	public String getProp(String key) {
		for (int i = 0; i < mBuildPropContent.size(); i++) {
			String currLine = mBuildPropContent.get(i).trim();
			if ((currLine == null) || currLine.equals("")) continue;
			if (currLine.startsWith("#")) continue;
			String[] keyANDvalue = currLine.split("=");
			if (keyANDvalue == null) continue;
			if (keyANDvalue.length != 2) continue;
			if (keyANDvalue[0] == null) continue;
			if (key.equalsIgnoreCase(keyANDvalue[0])) {
				if (keyANDvalue[1] == null) return "";
				else return keyANDvalue[1];
			}
		}
		return "";
	}

	/*
	 * Set a property value
	 */
	public void setProp(String key, String value) {
		boolean foundKey = false;
		for (int i = 0; i < mBuildPropContent.size(); i++) {
			String currLine = mBuildPropContent.get(i).trim();
			if ((currLine == null) || currLine.equals("")) continue;
			if (currLine.startsWith("#")) continue;
			String[] keyANDvalue = currLine.split("=");
			if (keyANDvalue == null) continue;
			if (keyANDvalue.length != 2) continue;
			if (keyANDvalue[0] == null) continue;
			if (key.equalsIgnoreCase(keyANDvalue[0])) {
				keyANDvalue[1] = value;
				mBuildPropContent.set(i, keyANDvalue[0] + "=" + keyANDvalue[1]);
				foundKey = true;
				/* 
				 * We continue the loop here because of some buggy build.prop
				 * contains multiple property with same key but different value
				 */
			}
		}

		/* If the requested key not found, we add an new entry */
		if (!foundKey) {
			mBuildPropContent.add(key + "=" + value);
		}
	}

	/*
	 * Commit all key-values to file system
	 */
	public void commitBuildprop(String tmpDirPath) {
		if (mBuildPropContent.size() < 28) {
			/* 
			 * build.prop should contains at least 28 entries
			 * includes build type&version&date and sdk version etc
			 */
			Log.i("ViPER4Android", "[Commit build.prop] mBuildPropContent.size() < 28");
			return;
		}

		String tempBuildpropFile = tmpDirPath + "tmp_buildprop";
		String destBuildpropFile = "/system/build.prop";

		/* Save key-values to temp file */
		FileOutputStream fosOutput = null;
		OutputStreamWriter oswOutput = null;
		BufferedWriter bufferOutput = null;
		try {
			fosOutput = new FileOutputStream(tempBuildpropFile);
			oswOutput = new OutputStreamWriter(fosOutput, "ASCII");
			bufferOutput = new BufferedWriter(oswOutput);
			for (int i = 0; i < mBuildPropContent.size(); i++) {
				String currLine = mBuildPropContent.get(i);
				if ((currLine == null) || currLine.equals("")) {
					bufferOutput.write("\n");
					continue;
				}
				bufferOutput.write(currLine + "\n");
			}
			bufferOutput.flush();
			bufferOutput.close();
			oswOutput.close();
			fosOutput.close();
		} catch (FileNotFoundException e) {
			Log.i("ViPER4Android", tempBuildpropFile + " not found");
			return;
		} catch (UnsupportedEncodingException e) {
			Log.i("ViPER4Android", "ASCII encoding unsupported");
			new File(tempBuildpropFile).delete();
			return;
		} catch (IOException e) {
			Log.i("ViPER4Android", "[Commit build.prop] I/O exception");
			new File(tempBuildpropFile).delete();
			return;
		}

		/* Copy to file system */
		if (!RootTools.isAccessGiven()) {
			Log.i("ViPER4Android", "[Commit build.prop] no root permission");
			new File(tempBuildpropFile).delete();
			return;
		}
        String mChmod;
        if (RootTools.checkUtil("chmod")) {
            mChmod = "chmod";
        } else {
            if (RootTools.checkUtil("busybox") && RootTools.hasUtil("chmod", "busybox"))
                mChmod = "busybox chmod";
            else if (RootTools.checkUtil("toolbox") && RootTools.hasUtil("chmod", "toolbox"))
                mChmod = "toolbox chmod";
            else {
    			Log.i("ViPER4Android", "[Commit build.prop] chmod not found");
    			new File(tempBuildpropFile).delete();
    			return;
            }
        }
		if (!RootTools.remount("/system", "RW")) {
			Log.i("ViPER4Android", "[Commit build.prop] remount /system failed");
			new File(tempBuildpropFile).delete();
			return;
		}
		if (!RootTools.deleteFileOrDirectory(destBuildpropFile, false)) {
			Log.i("ViPER4Android", "[Commit build.prop] can not delete old file");
			new File(tempBuildpropFile).delete();
			return;
		}
		if (!RootTools.copyFile(tempBuildpropFile, destBuildpropFile, false, false)) {
			Log.i("ViPER4Android", "[Commit build.prop] can not copy file");
			new File(tempBuildpropFile).delete();
			return;
		}
		new File(tempBuildpropFile).delete();
		Command ccSetPermission = new Command(0,
                mChmod + " 644 " + destBuildpropFile);
        try {
			RootTools.getShell(true).add(ccSetPermission);
		} catch (IOException e) {
		} catch (TimeoutException e) {
		} catch (RootDeniedException e) {
		}

        /* Check the attr of build.prop */
        Permissions bpPermission = RootTools.getFilePermissionsSymlinks(destBuildpropFile);
        if (bpPermission.getPermissions() != 644) {
        	Log.e("ViPER4Android", "[Commit build.prop] chmod failed, permission of build.prop is " + bpPermission.getPermissions());
        } else {
        	Log.i("ViPER4Android", "[Commit build.prop] build.prop updated");
        }
	}
}
