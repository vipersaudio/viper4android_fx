package com.vipercn.viper4android_v2.activity;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.media.audiofx.AudioEffect;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.service.ViPER4AndroidService;

import com.stericson.RootTools.*;
import com.stericson.RootTools.execution.CommandCapture;
import com.tezlastorme.buildprop.*;

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
import java.util.*;

public class Utils {

    public class AudioEffectUtils {

        private AudioEffect.Descriptor[] mAudioEffectList = null;

        private boolean mHasViPER4AndroidEngine = false;

        private final int[] mV4AEngineVersion = new int[4];

        public AudioEffectUtils() {
            try {
                mAudioEffectList = AudioEffect.queryEffects();
            } catch (Exception e) {
                mAudioEffectList = null;
                mHasViPER4AndroidEngine = false;
                mV4AEngineVersion[0] = 0;
                mV4AEngineVersion[1] = 0;
                mV4AEngineVersion[2] = 0;
                mV4AEngineVersion[3] = 0;
                Log.e("ViPER4Android_Utils", "Failed to query audio effects");
                return;
            }
            if (mAudioEffectList == null) {
                mHasViPER4AndroidEngine = false;
                mV4AEngineVersion[0] = 0;
                mV4AEngineVersion[1] = 0;
                mV4AEngineVersion[2] = 0;
                mV4AEngineVersion[3] = 0;
                Log.e("ViPER4Android_Utils", "Failed to query audio effects");
                return;
            }

            AudioEffect.Descriptor mViper4AndroidEngine = null;
            Log.i("ViPER4Android_Utils", "Found " + mAudioEffectList.length + " effects");
            for (int i = 0; i < mAudioEffectList.length; i++) {
                if (mAudioEffectList[i] == null) {
                    continue;
                }
                try {
                    AudioEffect.Descriptor aeEffect = mAudioEffectList[i];
                    Log.i("ViPER4Android_Utils", "[" + (i + 1) + "], " + aeEffect.name + ", "
                            + aeEffect.implementor);
                    if (aeEffect.uuid.equals(ViPER4AndroidService.ID_V4A_GENERAL_FX)) {
                        Log.i("ViPER4Android_Utils", "Perfect, found ViPER4Android engine at "
                                + (i + 1));
                        mViper4AndroidEngine = aeEffect;
                    }
                } catch (Exception e) {
                    Log.e("ViPER4Android_Utils",
                            "AudioEffect Descriptor error , msg = " + e.getMessage());
                }
            }

            if (mViper4AndroidEngine == null) {
                Log.i("ViPER4Android_Utils", "ViPER4Android engine not found");
                mHasViPER4AndroidEngine = false;
                mV4AEngineVersion[0] = 0;
                mV4AEngineVersion[1] = 0;
                mV4AEngineVersion[2] = 0;
                mV4AEngineVersion[3] = 0;
                return;
            }

            // Extract engine version
            try {
                String v4aVersionLine = mViper4AndroidEngine.name;
                if (v4aVersionLine.contains("[") && v4aVersionLine.contains("]")) {
                    if (v4aVersionLine.length() >= 23) {
                        // v4aVersionLine should be "ViPER4Android [A.B.C.D]"
                        v4aVersionLine = v4aVersionLine.substring(15);
                        while (v4aVersionLine.endsWith("]")) {
                            v4aVersionLine = v4aVersionLine.substring(0,
                                    v4aVersionLine.length() - 1);
                        }
                        // v4aVersionLine should be "A.B.C.D"
                        String[] mVerBlocks = v4aVersionLine.split("\\.");
                        if (mVerBlocks.length == 4) {
                            mV4AEngineVersion[0] = Integer.parseInt(mVerBlocks[0]);
                            mV4AEngineVersion[1] = Integer.parseInt(mVerBlocks[1]);
                            mV4AEngineVersion[2] = Integer.parseInt(mVerBlocks[2]);
                            mV4AEngineVersion[3] = Integer.parseInt(mVerBlocks[3]);
                        }
                        Log.i("ViPER4Android_Utils", "The version of ViPER4Android engine is " +
                                mV4AEngineVersion[0] + "." +
                                mV4AEngineVersion[1] + "." +
                                mV4AEngineVersion[2] + "." +
                                mV4AEngineVersion[3]);
                        mHasViPER4AndroidEngine = true;
                        return;
                    }
                }
            } catch (Exception e) {
                Log.e("ViPER4Android_Utils",
                        "ViPER4Android engine version exception: " + e.getMessage());
            }

            Log.e("ViPER4Android_Utils", "Cannot extract ViPER4Android engine version");
            mHasViPER4AndroidEngine = false;
            mV4AEngineVersion[0] = 0;
            mV4AEngineVersion[1] = 0;
            mV4AEngineVersion[2] = 0;
            mV4AEngineVersion[3] = 0;
        }

        public AudioEffect.Descriptor[] GetAudioEffectList() {
            return mAudioEffectList;
        }

        public boolean isViPER4AndroidEngineFound() {
            return mHasViPER4AndroidEngine;
        }

        public int[] getViper4AndroidEngineVersion() {
            return mV4AEngineVersion;
        }
    }

    public static class cpuInfo {

        private boolean mCpuHasNEON;

        private boolean mCpuHasVFP;

        // Lets read /proc/cpuinfo in java
        private boolean readCpuInfo() {
            String mCPUInfoFile = "/proc/cpuinfo";
            FileReader cpuInfoReader = null;
            BufferedReader brReader = null;

            mCpuHasNEON = false;
            mCpuHasVFP = false;

            // Find "Features" line, extract neon and vfp
            try {
                cpuInfoReader = new FileReader(mCPUInfoFile);
                brReader = new BufferedReader(cpuInfoReader);
                while (true) {
                    String mLine = brReader.readLine();
                    if (mLine == null) {
                        break;
                    }
                    mLine = mLine.trim();
                    if (mLine.startsWith("Features")) {
                        Log.i("ViPER4Android_Utils", "cpuInfo[java] = <" + mLine + ">");
                        StringTokenizer stBlock = new StringTokenizer(mLine);
                        while (stBlock.hasMoreElements()) {
                            String mFeature = stBlock.nextToken();
                            if (mFeature != null) {
                                if (mFeature.equalsIgnoreCase("neon")) {
                                    mCpuHasNEON = true;
                                } else if (mFeature.equalsIgnoreCase("vfp")) {
                                    mCpuHasVFP = true;
                                }
                            }
                        }
                    }
                }
                brReader.close();
                cpuInfoReader.close();

                Log.i("ViPER4Android_Utils", "cpuInfo[java] = NEON:" + mCpuHasNEON + ", VFP:"
                        + mCpuHasVFP);
                return !(!mCpuHasNEON && !mCpuHasVFP);
            } catch (IOException e) {
                try {
                    if (brReader != null) {
                        brReader.close();
                    }
                    if (cpuInfoReader != null) {
                        cpuInfoReader.close();
                    }
                    return false;
                } catch (Exception ex) {
                    return false;
                }
            }
        }

        // Lets read /proc/cpuinfo in jni
        private void readCPUInfoJni() {
            mCpuHasNEON = V4AJniInterface.IsCPUSupportNEON();
            mCpuHasVFP = V4AJniInterface.IsCPUSupportVFP();
        }

        // Buffered result
        public cpuInfo() {
            mCpuHasNEON = false;
            mCpuHasVFP = false;
            if (!readCpuInfo()) {
                readCPUInfoJni();
            }
        }

        public boolean hasNEON() {
            return mCpuHasNEON;
        }

        public boolean hasVFP() {
            return mCpuHasVFP;
        }
    }

    // Check if Busybox is installed & offer installation if not found
    public static boolean isBusyBoxInstalled(Context ctx) {
        boolean bBusyBox = RootTools.isBusyboxAvailable();
        if (!bBusyBox) {
            final Context ctxInstance = ctx;
            AlertDialog.Builder mBusyBox = new AlertDialog.Builder(ctxInstance);
            mBusyBox.setTitle("ViPER4Android");
            mBusyBox.setMessage(ctxInstance.getResources().getString(R.string.text_no_busybox));
            mBusyBox.setPositiveButton(ctxInstance.getResources().getString(R.string.text_ok),
                    new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    try {
                        ctxInstance.startActivity(new Intent(Intent.ACTION_VIEW, Uri
                                .parse("market://details?id=stericson.busybox")));
                    } catch (android.content.ActivityNotFoundException anfe) {
                        ctxInstance.startActivity(new Intent(
                                Intent.ACTION_VIEW,
                                Uri.parse(
                                        "http://play.google.com/store/apps/details?id=stericson.busybox")));
                    }
                }
            });
            mBusyBox.setNegativeButton(ctxInstance.getResources().getString(R.string.text_cancel),
                    new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            });
            mBusyBox.show();
        }

        return RootTools.isBusyboxAvailable();
    }

    // Check for build.prop entries which can cause issues and offer update
    public static boolean buildPropOk(Context ctx) {
        final String LPA_DECODE = "lpa.decode";
        final String LPA_USE_STAGEFRIGHT = "lpa.use.stagefright";
        final String TUNNEL_DECODE = "tunnel.decode";

        final String mLPADecode, mTunnelDecode, mStagefright;
        ArrayList<String> mBuildProp = new ArrayList<String>();

        if (BuildProp.propExists(LPA_DECODE)) {
            mLPADecode = BuildProp.getProp(LPA_DECODE);
            mBuildProp.add(LPA_DECODE);
        } else {
            mLPADecode = "false";
        }

        if (BuildProp.propExists(TUNNEL_DECODE)) {
            mTunnelDecode = BuildProp.getProp(TUNNEL_DECODE);
            mBuildProp.add(TUNNEL_DECODE);
        } else {
            mTunnelDecode = "false";
        }

        if (BuildProp.propExists(LPA_USE_STAGEFRIGHT)) {
            mStagefright = BuildProp.getProp(LPA_USE_STAGEFRIGHT);
            mBuildProp.add(LPA_USE_STAGEFRIGHT);
        } else {
            mStagefright = "false";
        }

        if (!mBuildProp.isEmpty()) {
            final Context ctxInstance = ctx;
            AlertDialog.Builder mBusyBox = new AlertDialog.Builder(ctxInstance);
            mBusyBox.setTitle("ViPER4Android");
            String mBuildPropMessage;
            mBuildPropMessage
                    = "Build.prop entries detected. Do you wish to change the following properties: \n";
            for (String aSzBuildProps : mBuildProp) {
                mBuildPropMessage = mBuildPropMessage + aSzBuildProps + "=false \n";
            }

            mBuildPropMessage = mBuildPropMessage
                    + "\nWARNING: You should make a NANDROID BACKUP before proceeding!";
            mBusyBox.setMessage(mBuildPropMessage);
            mBusyBox.setPositiveButton(ctxInstance.getResources().getString(R.string.text_ok),
                    new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    if (mLPADecode.equalsIgnoreCase("true")) {
                        BuildProp.setProp(LPA_DECODE, "false");
                    }
                    if (mTunnelDecode.equalsIgnoreCase("true")) {
                        BuildProp.setProp(TUNNEL_DECODE, "false");
                    }
                    if (mStagefright.equalsIgnoreCase("true")) {
                        BuildProp.setProp(LPA_USE_STAGEFRIGHT, "false");
                    }
                }
            });
            mBusyBox.setNegativeButton(ctxInstance.getResources().getString(R.string.text_cancel),
                    new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                }
            });
            mBusyBox.show();

            boolean buildPropModified = true;
            for (String aSzBuildProps : mBuildProp) {
                buildPropModified &= BuildProp.getProp(aSzBuildProps).equalsIgnoreCase(
                        "false");
            }

            return buildPropModified;
        } else {
            return true;
        }
    }

    // Check if the specified file exists.
    private static boolean fileExists(String mFileName) {
        boolean bExist = new File(mFileName).exists();
        if (!bExist) {
            if (ShellCommand.rootExecuteWithoutShell("exists " + mFileName) == 0) {
                bExist = true;
            }
        }
        return bExist;
    }

    // Get a file length
    private static long getFileLength(String mFileName) {
        try {
            return new File(mFileName).length();
        } catch (Exception e) {
            return 0;
        }
    }

    // Download a file from internet
    public static boolean downloadFile(String mURL, String mFileName, String mStorePath) {
        try {
            URL url = new URL(mURL);
            URLConnection connection = url.openConnection();
            connection.connect();
            InputStream stream = connection.getInputStream();
            if (connection.getContentLength() <= 0) {
                return false;
            }
            if (stream == null) {
                return false;
            }
            FileOutputStream fos = new FileOutputStream(mStorePath + mFileName);

            byte buf[] = new byte[1024];
            do {
                int numRead = stream.read(buf);
                if (numRead == -1) {
                    break;
                }
                fos.write(buf, 0, numRead);
            } while (true);
            stream.close();
            fos.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // Check a file with checksum
    public static boolean fileChecksum(String mFilePathName, String mChecksum) {
        long checkSum = 0;

        try {
            FileInputStream fis = new FileInputStream(mFilePathName);
            byte buf[] = new byte[1024];
            do {
                int numRead = fis.read(buf);
                if (numRead == -1) {
                    break;
                }
                for (int idx = 0; idx < numRead; idx++) {
                    checkSum = checkSum + (long) (buf[idx]);
                }
            } while (true);
            fis.close();
            String mNewChecksum = Long.toString(checkSum);
            return mChecksum.equals(mNewChecksum);
        } catch (Exception e) {
            return false;
        }
    }

    // Read file list from path
    public static void getFileNameList(File path, String fileExt, ArrayList<String> fileList) {
        if (path.isDirectory()) {
            File[] files = path.listFiles();
            if (null == files) {
                return;
            }
            for (File file : files) {
                getFileNameList(file, fileExt, fileList);
            }
        } else {
            String filePath = path.getAbsolutePath();
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            if (fileName.toLowerCase(Locale.US).endsWith(fileExt)) {
                fileList.add(fileName);
            }
        }
    }

    // Get profile name from a file
    private static String getProfileName(String mProfileFileName) {
        try {
            FileInputStream fisInput = new FileInputStream(mProfileFileName);
            InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
            BufferedReader bufferInput = new BufferedReader(isrInput);
            String mProfileName = "";
            while (true) {
                String mLine = bufferInput.readLine();
                if (mLine == null) {
                    break;
                }
                if (mLine.startsWith("#")) {
                    continue;
                }

                String mChunks[] = mLine.split("=");
                if (mChunks.length != 2) {
                    continue;
                }
                if (mChunks[0].trim().equalsIgnoreCase("profile_name")) {
                    mProfileName = mChunks[1];
                    break;
                }
            }
            bufferInput.close();
            isrInput.close();
            fisInput.close();

            return mProfileName;
        } catch (Exception e) {
            return "";
        }
    }

    // Get profile name list
    public static ArrayList<String> getProfileList(String mProfileDir) {
        try {
            File fProfileDirHandle = new File(mProfileDir);
            ArrayList<String> profileList = new ArrayList<String>();
            getFileNameList(fProfileDirHandle, ".prf", profileList);

            ArrayList<String> mProfileNameList = new ArrayList<String>();
            for (String aSzProfileList : profileList) {
                String mFileName = mProfileDir + aSzProfileList;
                String mName = getProfileName(mFileName);
                mProfileNameList.add(mName.trim());
            }

            return mProfileNameList;
        } catch (Exception e) {
            return new ArrayList<String>();
        }
    }

    // Check whether profile has been exists
    public static boolean checkProfileExists(String mProfileName, String mProfileDir) {
        try {
            File fProfileDirHandle = new File(mProfileDir);
            ArrayList<String> profileList = new ArrayList<String>();
            getFileNameList(fProfileDirHandle, ".prf", profileList);

            boolean foundProfile = false;
            for (String mProfileList : profileList) {
                String mFileName = mProfileDir + mProfileList;
                String mName = getProfileName(mFileName);
                if (mProfileName.trim().equalsIgnoreCase(mName.trim())) {
                    foundProfile = true;
                    break;
                }
            }

            return foundProfile;
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "CheckProfileExists Error: " + e.getMessage());
            return false;
        }
    }

    // Load profile from file
    public static boolean loadProfile(String mProfileName, String mProfileDir,
            String mPreferenceName, Context ctx) {
        try {
            File fProfileDirHandle = new File(mProfileDir);
            ArrayList<String> profileFileList = new ArrayList<String>();
            getFileNameList(fProfileDirHandle, ".prf", profileFileList);
            String mProfileFileName = "";
            for (String mProfileFileList : profileFileList) {
                String mFileName = mProfileDir + mProfileFileList;
                String mName = getProfileName(mFileName);
                if (mProfileName.trim().equalsIgnoreCase(mName.trim())) {
                    mProfileFileName = mFileName;
                    break;
                }
            }
            if (mProfileFileName.equals("")) {
                return false;
            }

            SharedPreferences preferences = ctx.getSharedPreferences(mPreferenceName,
                    Context.MODE_PRIVATE);
            if (preferences != null) {
                FileInputStream fisInput = new FileInputStream(mProfileFileName);
                InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
                BufferedReader brInput = new BufferedReader(isrInput);
                Editor e = preferences.edit();
                while (true) {
                    String mLine = brInput.readLine();
                    if (mLine == null) {
                        break;
                    }
                    if (mLine.startsWith("#")) {
                        continue;
                    }

                    String mChunks[] = mLine.split("=");
                    if (mChunks.length != 3) {
                        continue;
                    }
                    if (mChunks[1].trim().equalsIgnoreCase("boolean")) {
                        String szParameter = mChunks[0];
                        boolean bValue = Boolean.valueOf(mChunks[2]);
                        e.putBoolean(szParameter, bValue);
                    } else if (mChunks[1].trim().equalsIgnoreCase("string")) {
                        String mParameter = mChunks[0];
                        String mValue = mChunks[2];
                        e.putString(mParameter, mValue);
                    } else {
                    }
                }
                e.commit();
                brInput.close();
                isrInput.close();
                fisInput.close();

                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "LoadProfile Error: " + e.getMessage());
            return false;
        }
    }

    // Save profile to file
    public static void saveProfile(String mProfileName, String mProfileDir,
            String mPreferenceName, Context ctx) {
        try {
            SharedPreferences preferences = ctx.getSharedPreferences(mPreferenceName,
                    Context.MODE_PRIVATE);
            if (preferences != null) {
                String mOutFileName = mProfileDir + mProfileName + ".prf";
                if (fileExists(mOutFileName)) {
                    new File(mOutFileName).delete();
                }

                FileOutputStream fosOutput = new FileOutputStream(mOutFileName);
                OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "UTF-8");
                BufferedWriter bwOutput = new BufferedWriter(oswOutput);

                SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd   hh:mm:ss",
                        Locale.US);
                String szDate = sDateFormat.format(new java.util.Date());

                bwOutput.write("# ViPER4Android audio effect profile !\n");
                bwOutput.write("# Created " + szDate + "\n\n");
                bwOutput.write("profile_name=" + mProfileName + "\n\n");

                String szValue;

                // boolean values
                szValue = String.valueOf(preferences.getBoolean("viper4android.headphonefx.enable",
                        false));
                bwOutput.write("viper4android.headphonefx.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean("viper4android.speakerfx.enable",
                        false));
                bwOutput.write("viper4android.speakerfx.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.speakerfx.spkopt.enable", false));
                bwOutput.write("viper4android.speakerfx.spkopt.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.playbackgain.enable", false));
                bwOutput.write("viper4android.headphonefx.playbackgain.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.fireq.enable", false));
                bwOutput.write("viper4android.headphonefx.fireq.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.convolver.enable", false));
                bwOutput.write("viper4android.headphonefx.convolver.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.colorfulmusic.enable", false));
                bwOutput.write("viper4android.headphonefx.colorfulmusic.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.diffsurr.enable", false));
                bwOutput.write("viper4android.headphonefx.diffsurr.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.vhs.enable", false));
                bwOutput.write("viper4android.headphonefx.vhs.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.reverb.enable", false));
                bwOutput.write("viper4android.headphonefx.reverb.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.dynamicsystem.enable", false));
                bwOutput.write("viper4android.headphonefx.dynamicsystem.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.fidelity.bass.enable", false));
                bwOutput.write("viper4android.headphonefx.fidelity.bass.enable=boolean=" + szValue
                        + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.fidelity.clarity.enable", false));
                bwOutput.write("viper4android.headphonefx.fidelity.clarity.enable=boolean="
                        + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.cure.enable", false));
                bwOutput.write("viper4android.headphonefx.cure.enable=boolean=" + szValue + "\n");
                szValue = String.valueOf(preferences.getBoolean(
                        "viper4android.headphonefx.tube.enable", false));
                bwOutput.write("viper4android.headphonefx.tube.enable=boolean=" + szValue + "\n");

                // string values
                szValue = preferences.getString("viper4android.headphonefx.playbackgain.ratio",
                        "50");
                bwOutput.write("viper4android.headphonefx.playbackgain.ratio=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.playbackgain.maxscaler",
                        "400");
                bwOutput.write("viper4android.headphonefx.playbackgain.maxscaler=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.playbackgain.volume",
                        "80");
                bwOutput.write("viper4android.headphonefx.playbackgain.volume=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fireq",
                        "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;");
                bwOutput.write("viper4android.headphonefx.fireq=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fireq.custom",
                        "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;");
                bwOutput.write("viper4android.headphonefx.fireq.custom=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.convolver.kernel", "");
                bwOutput.write("viper4android.headphonefx.convolver.kernel=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.convolver.crosschannel",
                        "0");
                bwOutput.write("viper4android.headphonefx.convolver.crosschannel=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.colorfulmusic.coeffs",
                        "120;200");
                bwOutput.write("viper4android.headphonefx.colorfulmusic.coeffs=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.colorfulmusic.midimage",
                        "150");
                bwOutput.write("viper4android.headphonefx.colorfulmusic.midimage=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.diffsurr.delay", "500");
                bwOutput.write("viper4android.headphonefx.diffsurr.delay=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.vhs.qual", "0");
                bwOutput.write("viper4android.headphonefx.vhs.qual=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.reverb.roomsize", "0");
                bwOutput.write(
                        "viper4android.headphonefx.reverb.roomsize=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0");
                bwOutput.write("viper4android.headphonefx.reverb.roomwidth=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.reverb.damp", "0");
                bwOutput.write("viper4android.headphonefx.reverb.damp=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.reverb.wet", "0");
                bwOutput.write("viper4android.headphonefx.reverb.wet=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.reverb.dry", "50");
                bwOutput.write("viper4android.headphonefx.reverb.dry=string=" + szValue + "\n");
                szValue = preferences.getString("viper4android.headphonefx.dynamicsystem.coeffs",
                        "100;5600;40;80;50;50");
                bwOutput.write("viper4android.headphonefx.dynamicsystem.coeffs=string=" + szValue
                        + "\n");
                szValue = preferences
                        .getString("viper4android.headphonefx.dynamicsystem.bass", "0");
                bwOutput.write("viper4android.headphonefx.dynamicsystem.bass=string=" + szValue
                        + "\n");
                szValue = preferences
                        .getString("viper4android.headphonefx.fidelity.bass.mode", "0");
                bwOutput.write("viper4android.headphonefx.fidelity.bass.mode=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fidelity.bass.freq",
                        "40");
                bwOutput.write("viper4android.headphonefx.fidelity.bass.freq=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fidelity.bass.gain",
                        "50");
                bwOutput.write("viper4android.headphonefx.fidelity.bass.gain=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fidelity.clarity.mode",
                        "0");
                bwOutput.write("viper4android.headphonefx.fidelity.clarity.mode=string=" + szValue
                        + "\n");
                szValue = preferences.getString("viper4android.headphonefx.fidelity.clarity.gain",
                        "50");
                bwOutput.write("viper4android.headphonefx.fidelity.clarity.gain=string=" + szValue
                        + "\n");
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
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "SaveProfile Error: " + e.getMessage());
        }
    }

    // Modify audio_effects.conf
    private static boolean modifyFXConfig(String mInputFile, String mOutputFile) {
        Log.i("ViPER4Android_Utils", "Editing audio configuration, input = " + mInputFile
                + ", output = " + mOutputFile);
        try {
            long lInputFileLength = getFileLength(mInputFile);

            // Create reading and writing stuff
            FileInputStream fisInput = new FileInputStream(mInputFile);
            FileOutputStream fosOutput = new FileOutputStream(mOutputFile);
            InputStreamReader isrInput = new InputStreamReader(fisInput, "ASCII");
            OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "ASCII");
            BufferedReader brInput = new BufferedReader(isrInput);
            BufferedWriter bwOutput = new BufferedWriter(oswOutput);

            // Check whether the file has already modified
            boolean configModified = false;
            brInput.mark((int) lInputFileLength);
            do {
                String mLine = brInput.readLine();
                if (mLine == null) {
                    break;
                }
                if (mLine.trim().startsWith("#")) {
                    continue;
                }
                /* This is v4a effect uuid */
                if (mLine.toLowerCase(Locale.US)
                        .contains("41d3c987-e6cf-11e3-a88a-11aba5d5c51b")) {
                    Log.i("ViPER4Android_Utils", "Source file has been modified, line = " + mLine);
                    configModified = true;
                    break;
                }
            } while (true);

            boolean libraryAppend = false;
            boolean effectAppend = false;
            if (configModified) {
                // Already modified, just copy
                brInput.reset();
                do {
                    String mLine = brInput.readLine();
                    if (mLine == null) {
                        break;
                    }
                    bwOutput.write(mLine + "\n");
                } while (true);
                bwOutput.flush();

                brInput.close();
                isrInput.close();
                fisInput.close();
                bwOutput.close();
                oswOutput.close();
                fosOutput.close();

                return true;
            } else {
                // Lets append v4a library and effect to configuration
                brInput.reset();
                do {
                    String mLine = brInput.readLine();
                    if (mLine == null) {
                        break;
                    }
                    if (mLine.trim().equalsIgnoreCase("libraries {") && !libraryAppend) {
                        // Append library
                        bwOutput.write(mLine + "\n");
                        bwOutput.write("  v4a_fx {\n");
                        bwOutput.write("    path /system/lib/soundfx/libv4a_fx_ics.so\n");
                        bwOutput.write("  }\n");
                        libraryAppend = true;
                    } else if (mLine.trim().equalsIgnoreCase("effects {") && !effectAppend) {
                        // Append effect
                        bwOutput.write(mLine + "\n");
                        bwOutput.write("  v4a_standard_fx {\n");
                        bwOutput.write("    library v4a_fx\n");
                        bwOutput.write("    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n");
                        bwOutput.write("  }\n");
                        effectAppend = true;
                    } else {
                        bwOutput.write(mLine + "\n");
                    }
                } while (true);
                bwOutput.flush();

                brInput.close();
                isrInput.close();
                fisInput.close();
                bwOutput.close();
                oswOutput.close();
                fosOutput.close();

                // Just in case, different config file format in future
                return libraryAppend & effectAppend;
            }
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "Error: " + e.getMessage());
            return false;
        }
    }

    // Get application data path
    private static String getBasePath(Context ctx) {
        Context cont = ctx.getApplicationContext();
        String mBasePath = "";
        if (cont != null) {
            // No try catch the cont != null will prevent a possible NPE here
            if (cont.getFilesDir().exists()) {
                mBasePath = cont.getFilesDir().getAbsolutePath();
            } else if (!cont.getFilesDir().mkdirs()) {
                mBasePath = "";
            }
        } else {
            mBasePath = "";
        }

        return mBasePath;
    }

    // Check if addon.d folder exists for script installation (Device kernel
    // dependant)
    private static boolean addondExists() {
        File file = new File("/system/addon.d/");

        return (file.exists() && file.isDirectory());
    }

    // Copy assets to local
    private static boolean copyAssetsToLocal(Context ctx, String mSourceName, String mDstName) {
        String mBasePath = getBasePath(ctx);
        if (mBasePath.equals("")) {
            return false;
        }
        mDstName = mBasePath + "/" + mDstName;

        InputStream myInput;
        OutputStream myOutput;
        String outFileName = mDstName;
        try {
            File hfOutput = new File(mDstName);
            if (hfOutput.exists()) {
                hfOutput.delete();
            }

            myOutput = new FileOutputStream(outFileName);
            myInput = ctx.getAssets().open(mSourceName);
            byte[] tBuffer = new byte[4096]; /* 4K page size */
            int nLength;
            while ((nLength = myInput.read(tBuffer)) > 0) {
                myOutput.write(tBuffer, 0, nLength);
            }
            myOutput.flush();
            myInput.close();
            myOutput.close();
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "CopyAssetsToLocal() failed, msg = " + e.getMessage());
            return false;
        }

        return true;
    }

    // Uninstall ViPER4Android FX driver
    public static void uninstallDrv_FX() {
        /*
         * When uninstalling the v4a driver, we just delete the driver file (or
         * just uninstall the apk). Android will check all effect drivers before
         * load, so keep v4a in audio_effects.conf is safe.
         */

        // Lets acquire root first :)
        RootTools.debugMode = true;
        if (!RootTools.isAccessGiven()) {
            return;
        }

        // Then delete the driver
        String mDriverPathName = "/system/lib/soundfx/libv4a_fx_ics.so";
        try {
            RootTools.debugMode = true;
            if (RootTools.exists(mDriverPathName)) {
                RootTools.deleteFileOrDirectory(mDriverPathName, true);
                if (RootTools.exists("/system/addon.d/91-v4a.sh")) {
                    RootTools.deleteFileOrDirectory("/system/addon.d/91-v4a.sh", true);
                }
            }
            RootTools.closeAllShells();
        } catch (IOException e) {
            Log.i("ViPER4Android", "Driver uninstall failed, msg = " + e.getMessage());
        }
    }

    // Install ViPER4Android FX driver through roottools
    private static boolean installDrv_FX_RootTools(Context ctx, String mDriverName) {
        boolean isAddondSupported = false;

        // Make sure we can use external storage for temp directory
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            return false;
        }

        // Copy driver assets to local
        if (!copyAssetsToLocal(ctx, mDriverName, "libv4a_fx_ics.so")) {
            return false;
        }

        // Check if addon.d directory exists and copy script if supported
        if (addondExists()) {
            copyAssetsToLocal(ctx, "91-v4a.sh", "91-v4a.sh");
            isAddondSupported = true;
        }

        // Lets acquire root first :)
        if (!RootTools.isAccessGiven()) {
            return false;
        }

        // Check chmod utils
        String mChmod;
        if (RootTools.checkUtil("chmod")) {
            mChmod = "chmod";
        } else {
            if (RootTools.checkUtil("busybox") && RootTools.hasUtil("chmod", "busybox")) {
                mChmod = "busybox chmod";
            } else if (RootTools.checkUtil("toolbox") && RootTools.hasUtil("chmod", "toolbox")) {
                mChmod = "toolbox chmod";
            } else {
                return false;
            }
        }

        // Generate temp config file path, thanks to 'ste71m'
        String mSystemConf = StaticEnvironment.getExternalStoragePath() + "v4a_audio_system.conf";
        String mVendorConf = StaticEnvironment.getExternalStoragePath() + "v4a_audio_vendor.conf";

        // Check vendor directory
        boolean ifVendorExists = RootTools.exists("/system/vendor/etc/audio_effects.conf");

        // Copy configuration to temp directory
        if (ifVendorExists) {
            /* Copy to external storage, we dont need remount */
            RootTools.copyFile("/system/etc/audio_effects.conf", mSystemConf, false, false);
            RootTools.copyFile("/system/vendor/etc/audio_effects.conf", mVendorConf, false, false);
        } else {
            /* Copy to external storage, we dont need remount */
            RootTools.copyFile("/system/etc/audio_effects.conf", mSystemConf, false, false);
        }

        // Modifing configuration
        boolean modifyResult = modifyFXConfig(mSystemConf, mSystemConf + ".out");
        if (ifVendorExists) {
            modifyResult &= modifyFXConfig(mVendorConf, mVendorConf + ".out");
        }
        if (!modifyResult) {
            /* Modify the configuration failed, lets cleanup temp file(s) */
            try {
                if (ifVendorExists) {
                    if (!RootTools.deleteFileOrDirectory(mSystemConf, false)) {
                        new File(mSystemConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(mVendorConf, false)) {
                        new File(mVendorConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(mSystemConf + ".out", false)) {
                        new File(mSystemConf + ".out").delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(mVendorConf + ".out", false)) {
                        new File(mVendorConf + ".out").delete();
                    }
                } else {
                    if (!RootTools.deleteFileOrDirectory(mSystemConf, false)) {
                        new File(mSystemConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(mSystemConf + ".out", false)) {
                        new File(mSystemConf + ".out").delete();
                    }
                }
                // Close all shells
                RootTools.closeAllShells();
                return false;
            } catch (Exception e) {
                Log.i("ViPER4Android", "Modify config cleanup failed, msg = " + e.getMessage());
                return false;
            }
        }

        // Copy back to system
        boolean operationSuccess;
        String mBaseDrvPathName = getBasePath(ctx);
        String mAddondScriptPathName = mBaseDrvPathName;
        if (mBaseDrvPathName.endsWith("/")) {
            mBaseDrvPathName = mBaseDrvPathName + "libv4a_fx_ics.so";
            if (isAddondSupported) {
                mAddondScriptPathName = mAddondScriptPathName + "91-v4a.sh";
            }
        } else {
            mBaseDrvPathName = mBaseDrvPathName + "/libv4a_fx_ics.so";
            if (isAddondSupported) {
                mAddondScriptPathName = mAddondScriptPathName + "/91-v4a.sh";
            }
        }
        try {
            if (ifVendorExists) {
                // Copy files
                operationSuccess = RootTools.remount("/system", "RW");
                if (operationSuccess) {
                    operationSuccess = RootTools.copyFile(mBaseDrvPathName,
                            "/system/lib/soundfx/libv4a_fx_ics.so", false, false);
                }
                if (operationSuccess) {
                    operationSuccess = RootTools.copyFile(mSystemConf + ".out",
                            "/system/etc/audio_effects.conf", false, false);
                }
                if (operationSuccess) {
                    operationSuccess = RootTools.copyFile(mVendorConf + ".out",
                            "/system/vendor/etc/audio_effects.conf", false, false);
                }
                if (operationSuccess && isAddondSupported) {
                    operationSuccess = RootTools.copyFile(mAddondScriptPathName,
                            "/system/addon.d/91-v4a.sh", false, false);
                }
                // Modify permission
                CommandCapture ccSetPermission = new CommandCapture(0,
                        mChmod + " 644 /system/etc/audio_effects.conf",
                        mChmod + " 644 /system/vendor/etc/audio_effects.conf",
                        mChmod + " 644 /system/lib/soundfx/libv4a_fx_ics.so");
                RootTools.getShell(true).add(ccSetPermission);

                // Modify permission of addon.d script if applicable
                if (isAddondSupported) {
                    CommandCapture ccSetAddondPermission = new CommandCapture(0,
                            mChmod + " 644 /system/addon.d/91-v4a.sh");
                    RootTools.getShell(true).add(ccSetAddondPermission);
                }

                RootTools.remount("/system", "RO");
            } else {
                // Copy files
                operationSuccess = RootTools.remount("/system", "RW");
                if (operationSuccess) {
                    operationSuccess = RootTools.copyFile(mBaseDrvPathName,
                            "/system/lib/soundfx/libv4a_fx_ics.so", false, false);
                }
                if (operationSuccess) {
                    operationSuccess = RootTools.copyFile(mSystemConf + ".out",
                            "/system/etc/audio_effects.conf", false, false);
                }
                if (operationSuccess && isAddondSupported) {
                    operationSuccess = RootTools.copyFile(mAddondScriptPathName,
                            "/system/addon.d/91-v4a.sh", false, false);
                }

                // Modify permission
                CommandCapture ccSetPermission = new CommandCapture(0,
                        mChmod + " 644 /system/etc/audio_effects.conf",
                        mChmod + " 644 /system/lib/soundfx/libv4a_fx_ics.so");
                RootTools.getShell(true).add(ccSetPermission);

                // Modify permission of addon.d script if applicable
                if (isAddondSupported) {
                    CommandCapture ccSetAddondPermission = new CommandCapture(0,
                            mChmod + " 644 /system/addon.d/91-v4a.sh");
                    RootTools.getShell(true).add(ccSetAddondPermission);
                }

                RootTools.remount("/system", "RO");
            }
        } catch (Exception e) {
            operationSuccess = false;
            Log.i("ViPER4Android", "Copy back to /system failed, msg = " + e.getMessage());
        }

        /* Cleanup temp file(s) and close root shell */
        try {
            if (ifVendorExists) {
                if (!RootTools.deleteFileOrDirectory(mSystemConf, false)) {
                    new File(mSystemConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(mVendorConf, false)) {
                    new File(mVendorConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(mSystemConf + ".out", false)) {
                    new File(mSystemConf + ".out").delete();
                }
                if (!RootTools.deleteFileOrDirectory(mVendorConf + ".out", false)) {
                    new File(mVendorConf + ".out").delete();
                }
            } else {
                if (!RootTools.deleteFileOrDirectory(mSystemConf, false)) {
                    new File(mSystemConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(mSystemConf + ".out", false)) {
                    new File(mSystemConf + ".out").delete();
                }
            }
            // Close all shells
            RootTools.closeAllShells();
        } catch (Exception e) {
            Log.i("ViPER4Android", "Copy back to /system cleanup failed, msg = " + e.getMessage());
            return false;
        }

        return operationSuccess;
    }

    // Install ViPER4Android FX driver using without shell command method
    private static boolean installDrv_FX_WithoutShell(Context ctx, String szDriverName) {
        boolean isAddondSupported = false;
        int mShellCmdReturn;

        // Make sure we can use external storage for temp directory
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            return false;
        }

        // Copy driver assets to local
        if (!copyAssetsToLocal(ctx, szDriverName, "libv4a_fx_ics.so")) {
            return false;
        }

        // Check if addon.d directory exists and copy script if supported
        if (addondExists()) {
            copyAssetsToLocal(ctx, "91-v4a.sh", "91-v4a.sh");
            isAddondSupported = true;
        }

        // Generate temp config file path, thanks to 'ste71m'
        String mSystemConf = StaticEnvironment.getExternalStoragePath() + "v4a_audio_system.conf";
        String mVendorConf = StaticEnvironment.getExternalStoragePath() + "v4a_audio_vendor.conf";

        // Check vendor directory
        boolean ifVendorExists = RootTools.exists("/system/vendor/etc/audio_effects.conf");

        // Copy configuration to temp directory
        if (ifVendorExists) {
            /* Copy to external storage */
            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("cp /system/etc/audio_effects.conf " + mSystemConf);
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("cp /system/vendor/etc/audio_effects.conf " + mVendorConf);
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
        } else {
            /* Copy to external storage */
            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("cp /system/etc/audio_effects.conf " + mSystemConf);
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
        }

        // Modifing configuration
        boolean modifyResult = modifyFXConfig(mSystemConf, mSystemConf + ".out");
        if (ifVendorExists) {
            modifyResult &= modifyFXConfig(mVendorConf, mVendorConf + ".out");
        }
        if (!modifyResult) {
            /* Modify the configuration failed, lets cleanup temp file(s) */
            if (ifVendorExists) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
            } else {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
            }
            // Close shell
            ShellCommand.closeShell();
            return false;
        }

        // Copy back to system
        String mBaseDrvPathName = getBasePath(ctx);
        String mAddondScriptPathName = mBaseDrvPathName;
        if (mBaseDrvPathName.endsWith("/")) {
            mBaseDrvPathName = mBaseDrvPathName + "libv4a_fx_ics.so";
            if (isAddondSupported) {
                mAddondScriptPathName = mAddondScriptPathName + "91-v4a.sh";
            }
        } else {
            mBaseDrvPathName = mBaseDrvPathName + "/libv4a_fx_ics.so";
            if (isAddondSupported) {
                mAddondScriptPathName = mAddondScriptPathName + "/91-v4a.sh";
            }
        }

        if (ifVendorExists) {
            // Copy files

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("mount -o rw,remount /system");

            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot remount /system");
                ShellCommand.closeShell();
                return false;
            }

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("rm /system/lib/soundfx/libv4a_fx_ics.so");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp " + mBaseDrvPathName
                    + " /system/lib/soundfx/libv4a_fx_ics.so");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy V4A driver to /system");
                ShellCommand.closeShell();
                return false;
            }

            if (isAddondSupported) {
                mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp "
                        + mAddondScriptPathName + " /system/addon.d/91-v4a.sh");

                if (mShellCmdReturn != 0) {
                    Log.e("ViPER4Android", "Cannot copy addon.d script to /system/addon.d/");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp " + mSystemConf + ".out"
                    + " /system/etc/audio_effects.conf");

            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system");
                ShellCommand.closeShell();
                return false;
            }

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp " + mVendorConf + ".out"
                    + " /system/vendor/etc/audio_effects.conf");

            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system/vendor");
                ShellCommand.closeShell();
                return false;
            }
            // Modify permission

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("chmod 644 /system/etc/audio_effects.conf");

            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system]");
                ShellCommand.closeShell();
                return false;
            }

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("chmod 644 /system/vendor/etc/audio_effects.conf");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system/vendor]");
                ShellCommand.closeShell();
                return false;
            }
            if (isAddondSupported) {
                mShellCmdReturn = ShellCommand
                        .rootExecuteWithoutShell("chmod 644 /system/addon.d/91-v4a.sh");

                if (mShellCmdReturn != 0) {
                    Log.e("ViPER4Android",
                            "Cannot change addon.d script permission [/system/addon.d]");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("chmod 644 /system/lib/soundfx/libv4a_fx_ics.so");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mVendorConf).delete();
                new File(mSystemConf + ".out").delete();
                new File(mVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change driver's permission");
                ShellCommand.closeShell();
                return false;
            }

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("sync");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("mount -o ro,remount /system");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
        } else {
            // Copy files

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("mount -o rw,remount /system");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot remount /system");
                ShellCommand.closeShell();
                return false;
            }

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("rm /system/lib/soundfx/libv4a_fx_ics.so");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp " + mBaseDrvPathName
                    + " /system/lib/soundfx/libv4a_fx_ics.so");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy V4A driver to /system");
                ShellCommand.closeShell();
                return false;
            }
            if (isAddondSupported) {
                mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp "
                        + mAddondScriptPathName + " /system/addon.d/91-v4a.sh");
                if (mShellCmdReturn != 0) {
                    Log.e("ViPER4Android", "Cannot copy addon.d script to /system/addon.d/");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("cp " + mSystemConf + ".out"
                    + " /system/etc/audio_effects.conf");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system");
                ShellCommand.closeShell();
                return false;
            }
            // Modify permission

            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("chmod 644 /system/etc/audio_effects.conf");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system]");
                ShellCommand.closeShell();
                return false;
            }
            if (isAddondSupported) {
                mShellCmdReturn = ShellCommand
                        .rootExecuteWithoutShell("chmod 644 /system/addon.d/91-v4a.sh");
                if (mShellCmdReturn != 0) {
                    Log.e("ViPER4Android",
                            "Cannot change addon.d script permission [/system/addon.d]");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }
            mShellCmdReturn = ShellCommand
                    .rootExecuteWithoutShell("chmod 644 /system/lib/soundfx/libv4a_fx_ics.so");
            if (mShellCmdReturn != 0) {
                new File(mSystemConf).delete();
                new File(mSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change driver's permission");
                ShellCommand.closeShell();
                return false;
            }
            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("sync");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
            // Determine command structure based on SuperUser or SuperSU use
            mShellCmdReturn = ShellCommand.rootExecuteWithoutShell("mount -o ro,remount /system");
            Log.i("ViPER4Android", "Command return = " + mShellCmdReturn);
        }

        /* Cleanup temp file(s) and close root shell */
        if (ifVendorExists) {
            new File(mSystemConf).delete();
            new File(mVendorConf).delete();
            new File(mSystemConf + ".out").delete();
            new File(mVendorConf + ".out").delete();
        } else {
            new File(mSystemConf).delete();
            new File(mSystemConf + ".out").delete();
        }

        return RootTools.exists("/system/lib/soundfx/libv4a_fx_ics.so");
    }

    // Install ViPER4Android FX driver
    public static boolean InstallDrv_FX(Context ctx, String szDriverName) {
        return installDrv_FX_RootTools(ctx, szDriverName)
                || installDrv_FX_WithoutShell(ctx, szDriverName);
    }

}
