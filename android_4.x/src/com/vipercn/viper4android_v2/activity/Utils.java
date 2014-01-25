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

            AudioEffect.Descriptor aeViPER4AndroidEngine = null;
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
                        aeViPER4AndroidEngine = aeEffect;
                    }
                } catch (Exception e) {
                    Log.e("ViPER4Android_Utils",
                            "AudioEffect Descriptor error , msg = " + e.getMessage());
                }
            }

            if (aeViPER4AndroidEngine == null) {
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
                String szV4AVersionLine = aeViPER4AndroidEngine.name;
                if (szV4AVersionLine.contains("[") && szV4AVersionLine.contains("]")) {
                    if (szV4AVersionLine.length() >= 23) {
                        // szV4AVersionLine should be "ViPER4Android [A.B.C.D]"
                        szV4AVersionLine = szV4AVersionLine.substring(15);
                        while (szV4AVersionLine.endsWith("]")) {
                            szV4AVersionLine = szV4AVersionLine.substring(0,
                                    szV4AVersionLine.length() - 1);
                        }
                        // szV4AVersionLine should be "A.B.C.D"
                        String[] szVerBlocks = szV4AVersionLine.split("\\.");
                        if (szVerBlocks.length == 4) {
                            mV4AEngineVersion[0] = Integer.parseInt(szVerBlocks[0]);
                            mV4AEngineVersion[1] = Integer.parseInt(szVerBlocks[1]);
                            mV4AEngineVersion[2] = Integer.parseInt(szVerBlocks[2]);
                            mV4AEngineVersion[3] = Integer.parseInt(szVerBlocks[3]);
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

        public boolean IsViPER4AndroidEngineFound() {
            return mHasViPER4AndroidEngine;
        }

        public int[] GetViPER4AndroidEngineVersion() {
            return mV4AEngineVersion;
        }
    }

    public static class CPUInfo {

        private boolean m_bCPUHasNEON = false;

        private boolean m_bCPUHasVFP = false;

        // Lets read /proc/cpuinfo in java
        private boolean ReadCPUInfo() {
            String szCPUInfoFile = "/proc/cpuinfo";
            FileReader frCPUInfoReader = null;
            BufferedReader brReader = null;

            m_bCPUHasNEON = false;
            m_bCPUHasVFP = false;

            // Find "Features" line, extract neon and vfp
            try {
                frCPUInfoReader = new FileReader(szCPUInfoFile);
                brReader = new BufferedReader(frCPUInfoReader);
                while (true) {
                    String szLine = brReader.readLine();
                    if (szLine == null) {
                        break;
                    }
                    szLine = szLine.trim();
                    if (szLine.startsWith("Features")) {
                        Log.i("ViPER4Android_Utils", "CPUInfo[java] = <" + szLine + ">");
                        StringTokenizer stBlock = new StringTokenizer(szLine);
                        while (stBlock.hasMoreElements()) {
                            String szFeature = stBlock.nextToken();
                            if (szFeature != null) {
                                if (szFeature.equalsIgnoreCase("neon")) {
                                    m_bCPUHasNEON = true;
                                } else if (szFeature.equalsIgnoreCase("vfp")) {
                                    m_bCPUHasVFP = true;
                                }
                            }
                        }
                    }
                }
                brReader.close();
                frCPUInfoReader.close();

                Log.i("ViPER4Android_Utils", "CPUInfo[java] = NEON:" + m_bCPUHasNEON + ", VFP:"
                        + m_bCPUHasVFP);
                return !(!m_bCPUHasNEON && !m_bCPUHasVFP);
            } catch (IOException e) {
                try {
                    if (brReader != null) {
                        brReader.close();
                    }
                    if (frCPUInfoReader != null) {
                        frCPUInfoReader.close();
                    }
                    return false;
                } catch (Exception ex) {
                    return false;
                }
            }
        }

        // Lets read /proc/cpuinfo in jni
        private void ReadCPUInfoJni() {
            m_bCPUHasNEON = V4AJniInterface.IsCPUSupportNEON();
            m_bCPUHasVFP = V4AJniInterface.IsCPUSupportVFP();
        }

        // Buffered result
        public CPUInfo() {
            m_bCPUHasNEON = false;
            m_bCPUHasVFP = false;
            if (!ReadCPUInfo()) {
                ReadCPUInfoJni();
            }
        }

        public boolean HasNEON() {
            return m_bCPUHasNEON;
        }

        public boolean HasVFP() {
            return m_bCPUHasVFP;
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
    public static boolean BuildPropOk(Context ctx) {
        final String LPA_DECODE = "lpa.decode";
        final String LPA_USE_STAGEFRIGHT = "lpa.use.stagefright";
        final String TUNNEL_DECODE = "tunnel.decode";

        final String szLPADecode, szTunnelDecode, szStagefright;
        ArrayList<String> szBuildProps = new ArrayList<String>();

        if (BuildProp.propExists(LPA_DECODE)) {
            szLPADecode = BuildProp.getProp(LPA_DECODE);
            szBuildProps.add(LPA_DECODE);
        } else {
            szLPADecode = "false";
        }

        if (BuildProp.propExists(TUNNEL_DECODE)) {
            szTunnelDecode = BuildProp.getProp(TUNNEL_DECODE);
            szBuildProps.add(TUNNEL_DECODE);
        } else {
            szTunnelDecode = "false";
        }

        if (BuildProp.propExists(LPA_USE_STAGEFRIGHT)) {
            szStagefright = BuildProp.getProp(LPA_USE_STAGEFRIGHT);
            szBuildProps.add(LPA_USE_STAGEFRIGHT);
        } else {
            szStagefright = "false";
        }

        if (!szBuildProps.isEmpty()) {
            final Context ctxInstance = ctx;
            AlertDialog.Builder mBusyBox = new AlertDialog.Builder(ctxInstance);
            mBusyBox.setTitle("ViPER4Android");
            String szBuildPropMessage;
            szBuildPropMessage
                    = "Build.prop entries detected. Do you wish to change the following properties: \n";
            for (String aSzBuildProps : szBuildProps) {
                szBuildPropMessage = szBuildPropMessage + aSzBuildProps.toString() + "=false \n";
            }

            szBuildPropMessage = szBuildPropMessage
                    + "\nWARNING: You should make a NANDROID BACKUP before proceeding!";
            mBusyBox.setMessage(szBuildPropMessage);
            mBusyBox.setPositiveButton(ctxInstance.getResources().getString(R.string.text_ok),
                    new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    if (szLPADecode.equalsIgnoreCase("true")) {
                        BuildProp.setProp(LPA_DECODE, "false");
                    }
                    if (szTunnelDecode.equalsIgnoreCase("true")) {
                        BuildProp.setProp(TUNNEL_DECODE, "false");
                    }
                    if (szStagefright.equalsIgnoreCase("true")) {
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

            boolean bBuildPropModified = true;
            for (String aSzBuildProps : szBuildProps) {
                bBuildPropModified &= BuildProp.getProp(aSzBuildProps.toString()).equalsIgnoreCase(
                        "false");
            }

            return bBuildPropModified;
        } else {
            return true;
        }
    }

    // Check if the specified file exists.
    private static boolean FileExists(String szFileName) {
        boolean bExist = new File(szFileName).exists();
        if (!bExist) {
            if (ShellCommand.RootExecuteWithoutShell("exists " + szFileName) == 0) {
                bExist = true;
            }
        }
        return bExist;
    }

    // Get a file length
    private static long GetFileLength(String szFileName) {
        try {
            return new File(szFileName).length();
        } catch (Exception e) {
            return 0;
        }
    }

    // Download a file from internet
    public static boolean DownloadFile(String szURL, String szFileName, String szStorePath) {
        try {
            URL myURL = new URL(szURL);
            URLConnection conn = myURL.openConnection();
            conn.connect();
            InputStream is = conn.getInputStream();
            if (conn.getContentLength() <= 0) {
                return false;
            }
            if (is == null) {
                return false;
            }
            FileOutputStream fos = new FileOutputStream(szStorePath + szFileName);

            byte buf[] = new byte[1024];
            do {
                int numread = is.read(buf);
                if (numread == -1) {
                    break;
                }
                fos.write(buf, 0, numread);
            } while (true);
            is.close();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // Check a file with checksum
    public static boolean FileChecksum(String szFilePathName, String szChecksum) {
        long lChecksum = 0;

        try {
            FileInputStream fis = new FileInputStream(szFilePathName);
            byte buf[] = new byte[1024];
            do {
                int numread = fis.read(buf);
                if (numread == -1) {
                    break;
                }
                for (int idx = 0; idx < numread; idx++) {
                    lChecksum = lChecksum + (long) (buf[idx]);
                }
            } while (true);
            fis.close();
            String szNewChecksum = Long.toString(lChecksum);
            return szChecksum.equals(szNewChecksum);
        } catch (Exception e) {
            return false;
        }
    }

    // Read file list from path
    public static void GetFileNameList(File path, String fileExt, ArrayList<String> fileList) {
        if (path.isDirectory()) {
            File[] files = path.listFiles();
            if (null == files) {
                return;
            }
            for (File file : files) {
                GetFileNameList(file, fileExt, fileList);
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
    private static String GetProfileName(String szProfileFileName) {
        try {
            FileInputStream fisInput = new FileInputStream(szProfileFileName);
            InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
            BufferedReader brInput = new BufferedReader(isrInput);
            String szProfileName = "";
            while (true) {
                String szLine = brInput.readLine();
                if (szLine == null) {
                    break;
                }
                if (szLine.startsWith("#")) {
                    continue;
                }

                String szChunks[] = szLine.split("=");
                if (szChunks.length != 2) {
                    continue;
                }
                if (szChunks[0].trim().equalsIgnoreCase("profile_name")) {
                    szProfileName = szChunks[1];
                    break;
                }
            }
            brInput.close();
            isrInput.close();
            fisInput.close();

            return szProfileName;
        } catch (Exception e) {
            return "";
        }
    }

    // Get profile name list
    public static ArrayList<String> GetProfileList(String szProfileDir) {
        try {
            File fProfileDirHandle = new File(szProfileDir);
            ArrayList<String> szProfileList = new ArrayList<String>();
            GetFileNameList(fProfileDirHandle, ".prf", szProfileList);

            ArrayList<String> szProfileNameList = new ArrayList<String>();
            for (String aSzProfileList : szProfileList) {
                String szFileName = szProfileDir + aSzProfileList;
                String szName = GetProfileName(szFileName);
                szProfileNameList.add(szName.trim());
            }

            return szProfileNameList;
        } catch (Exception e) {
            return new ArrayList<String>();
        }
    }

    // Check whether profile has been exists
    public static boolean CheckProfileExists(String szProfileName, String szProfileDir) {
        try {
            File fProfileDirHandle = new File(szProfileDir);
            ArrayList<String> szProfileList = new ArrayList<String>();
            GetFileNameList(fProfileDirHandle, ".prf", szProfileList);

            boolean bFoundProfile = false;
            for (String aSzProfileList : szProfileList) {
                String szFileName = szProfileDir + aSzProfileList;
                String szName = GetProfileName(szFileName);
                if (szProfileName.trim().equalsIgnoreCase(szName.trim())) {
                    bFoundProfile = true;
                    break;
                }
            }

            return bFoundProfile;
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "CheckProfileExists Error: " + e.getMessage());
            return false;
        }
    }

    // Load profile from file
    public static boolean LoadProfile(String szProfileName, String szProfileDir,
            String szPreferenceName, Context ctx) {
        try {
            File fProfileDirHandle = new File(szProfileDir);
            ArrayList<String> szProfileFileList = new ArrayList<String>();
            GetFileNameList(fProfileDirHandle, ".prf", szProfileFileList);
            String szProfileFileName = "";
            for (int idx = 0; idx < szProfileFileList.size(); idx++) {
                String szFileName = szProfileDir + szProfileFileList.get(idx);
                String szName = GetProfileName(szFileName);
                if (szProfileName.trim().equalsIgnoreCase(szName.trim())) {
                    szProfileFileName = szFileName;
                    break;
                }
            }
            if (szProfileFileName.equals("")) {
                return false;
            }

            SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName,
                    Context.MODE_PRIVATE);
            if (preferences != null) {
                FileInputStream fisInput = new FileInputStream(szProfileFileName);
                InputStreamReader isrInput = new InputStreamReader(fisInput, "UTF-8");
                BufferedReader brInput = new BufferedReader(isrInput);
                Editor e = preferences.edit();
                while (true) {
                    String szLine = brInput.readLine();
                    if (szLine == null) {
                        break;
                    }
                    if (szLine.startsWith("#")) {
                        continue;
                    }

                    String szChunks[] = szLine.split("=");
                    if (szChunks.length != 3) {
                        continue;
                    }
                    if (szChunks[1].trim().equalsIgnoreCase("boolean")) {
                        String szParameter = szChunks[0];
                        boolean bValue = Boolean.valueOf(szChunks[2]);
                        e.putBoolean(szParameter, bValue);
                    } else if (szChunks[1].trim().equalsIgnoreCase("string")) {
                        String szParameter = szChunks[0];
                        String szValue = szChunks[2];
                        e.putString(szParameter, szValue);
                    } else {
                        continue;
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
    public static void SaveProfile(String szProfileName, String szProfileDir,
            String szPreferenceName, Context ctx) {
        try {
            SharedPreferences preferences = ctx.getSharedPreferences(szPreferenceName,
                    Context.MODE_PRIVATE);
            if (preferences != null) {
                String szOutFileName = szProfileDir + szProfileName + ".prf";
                if (FileExists(szOutFileName)) {
                    new File(szOutFileName).delete();
                }

                FileOutputStream fosOutput = new FileOutputStream(szOutFileName);
                OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "UTF-8");
                BufferedWriter bwOutput = new BufferedWriter(oswOutput);

                SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd   hh:mm:ss",
                        Locale.US);
                String szDate = sDateFormat.format(new java.util.Date());

                bwOutput.write("# ViPER4Android audio effect profile !\n");
                bwOutput.write("# Created " + szDate + "\n\n");
                bwOutput.write("profile_name=" + szProfileName + "\n\n");

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
    private static boolean ModifyFXConfig(String szInputFile, String szOutputFile) {
        Log.i("ViPER4Android_Utils", "Editing audio configuration, input = " + szInputFile
                + ", output = " + szOutputFile);
        try {
            long lInputFileLength = GetFileLength(szInputFile);

            // Create reading and writing stuff
            FileInputStream fisInput = new FileInputStream(szInputFile);
            FileOutputStream fosOutput = new FileOutputStream(szOutputFile);
            InputStreamReader isrInput = new InputStreamReader(fisInput, "ASCII");
            OutputStreamWriter oswOutput = new OutputStreamWriter(fosOutput, "ASCII");
            BufferedReader brInput = new BufferedReader(isrInput);
            BufferedWriter bwOutput = new BufferedWriter(oswOutput);

            // Check whether the file has already modified
            boolean bConfigModified = false;
            brInput.mark((int) lInputFileLength);
            do {
                String szLine = brInput.readLine();
                if (szLine == null) {
                    break;
                }
                if (szLine.trim().startsWith("#")) {
                    continue;
                }
                /* This is v4a effect uuid */
                if (szLine.toLowerCase(Locale.US)
                        .contains("41d3c987-e6cf-11e3-a88a-11aba5d5c51b")) {
                    Log.i("ViPER4Android_Utils", "Source file has been modified, line = " + szLine);
                    bConfigModified = true;
                    break;
                }
            } while (true);

            boolean bLibraryAppend = false;
            boolean bEffectAppend = false;
            if (bConfigModified) {
                // Already modified, just copy
                brInput.reset();
                do {
                    String szLine = brInput.readLine();
                    if (szLine == null) {
                        break;
                    }
                    bwOutput.write(szLine + "\n");
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
                    String szLine = brInput.readLine();
                    if (szLine == null) {
                        break;
                    }
                    if (szLine.trim().equalsIgnoreCase("libraries {") && !bLibraryAppend) {
                        // Append library
                        bwOutput.write(szLine + "\n");
                        bwOutput.write("  v4a_fx {\n");
                        bwOutput.write("    path /system/lib/soundfx/libv4a_fx_ics.so\n");
                        bwOutput.write("  }\n");
                        bLibraryAppend = true;
                    } else if (szLine.trim().equalsIgnoreCase("effects {") && !bEffectAppend) {
                        // Append effect
                        bwOutput.write(szLine + "\n");
                        bwOutput.write("  v4a_standard_fx {\n");
                        bwOutput.write("    library v4a_fx\n");
                        bwOutput.write("    uuid 41d3c987-e6cf-11e3-a88a-11aba5d5c51b\n");
                        bwOutput.write("  }\n");
                        bEffectAppend = true;
                    } else {
                        bwOutput.write(szLine + "\n");
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
                return bLibraryAppend & bEffectAppend;
            }
        } catch (Exception e) {
            Log.i("ViPER4Android_Utils", "Error: " + e.getMessage());
            return false;
        }
    }

    // Get application data path
    private static String GetBasePath(Context ctx) {
        Context cont = ctx.getApplicationContext();
        String szBasePath = "";
        if (cont != null) {
            // No try catch the cont != null will prevent a possible NPE here
            if (cont.getFilesDir().exists()) {
                szBasePath = cont.getFilesDir().getAbsolutePath();
            } else if (!cont.getFilesDir().mkdirs()) {
                szBasePath = "";
            }
        } else {
            szBasePath = "";
        }

        return szBasePath;
    }

    // Check if addon.d folder exists for script installation (Device kernel
    // dependant)
    private static boolean AddondExists() {
        File f = new File("/system/addon.d/");

        return (f.exists() && f.isDirectory());
    }

    // Copy assets to local
    private static boolean CopyAssetsToLocal(Context ctx, String szSourceName, String szDstName) {
        String szBasePath = GetBasePath(ctx);
        if (szBasePath.equals("")) {
            return false;
        }
        szDstName = szBasePath + "/" + szDstName;

        InputStream myInput;
        OutputStream myOutput;
        String outFileName = szDstName;
        try {
            File hfOutput = new File(szDstName);
            if (hfOutput.exists()) {
                hfOutput.delete();
            }

            myOutput = new FileOutputStream(outFileName);
            myInput = ctx.getAssets().open(szSourceName);
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
    public static void UninstallDrv_FX() {
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
        String szDriverPathName = "/system/lib/soundfx/libv4a_fx_ics.so";
        try {
            RootTools.debugMode = true;
            if (RootTools.exists(szDriverPathName)) {
                RootTools.deleteFileOrDirectory(szDriverPathName, true);
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
    private static boolean InstallDrv_FX_RootTools(Context ctx, String szDriverName) {
        boolean bAddondSupported = false;

        // Make sure we can use external storage for temp directory
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            return false;
        }

        // Copy driver assets to local
        if (!CopyAssetsToLocal(ctx, szDriverName, "libv4a_fx_ics.so")) {
            return false;
        }

        // Check if addon.d directory exists and copy script if supported
        if (AddondExists()) {
            CopyAssetsToLocal(ctx, "91-v4a.sh", "91-v4a.sh");
            bAddondSupported = true;
        }

        // Lets acquire root first :)
        if (!RootTools.isAccessGiven()) {
            return false;
        }

        // Check chmod utils
        String szChmod;
        if (RootTools.checkUtil("chmod")) {
            szChmod = "chmod";
        } else {
            if (RootTools.checkUtil("busybox") && RootTools.hasUtil("chmod", "busybox")) {
                szChmod = "busybox chmod";
            } else if (RootTools.checkUtil("toolbox") && RootTools.hasUtil("chmod", "toolbox")) {
                szChmod = "toolbox chmod";
            } else {
                return false;
            }
        }

        // Generate temp config file path, thanks to 'ste71m'
        String szSystemConf = StaticEnvironment.GetESPath() + "v4a_audio_system.conf";
        String szVendorConf = StaticEnvironment.GetESPath() + "v4a_audio_vendor.conf";

        // Check vendor directory
        boolean bExistsVendor = RootTools.exists("/system/vendor/etc/audio_effects.conf");

        // Copy configuration to temp directory
        if (bExistsVendor) {
            /* Copy to external storage, we dont need remount */
            RootTools.copyFile("/system/etc/audio_effects.conf", szSystemConf, false, false);
            RootTools.copyFile("/system/vendor/etc/audio_effects.conf", szVendorConf, false, false);
        } else {
            /* Copy to external storage, we dont need remount */
            RootTools.copyFile("/system/etc/audio_effects.conf", szSystemConf, false, false);
        }

        // Modifing configuration
        boolean bModifyResult = ModifyFXConfig(szSystemConf, szSystemConf + ".out");
        if (bExistsVendor) {
            bModifyResult &= ModifyFXConfig(szVendorConf, szVendorConf + ".out");
        }
        if (!bModifyResult) {
            /* Modify the configuration failed, lets cleanup temp file(s) */
            try {
                if (bExistsVendor) {
                    if (!RootTools.deleteFileOrDirectory(szSystemConf, false)) {
                        new File(szSystemConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(szVendorConf, false)) {
                        new File(szVendorConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(szSystemConf + ".out", false)) {
                        new File(szSystemConf + ".out").delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(szVendorConf + ".out", false)) {
                        new File(szVendorConf + ".out").delete();
                    }
                } else {
                    if (!RootTools.deleteFileOrDirectory(szSystemConf, false)) {
                        new File(szSystemConf).delete();
                    }
                    if (!RootTools.deleteFileOrDirectory(szSystemConf + ".out", false)) {
                        new File(szSystemConf + ".out").delete();
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
        boolean bOperationSucceed;
        String szBaseDrvPathName = GetBasePath(ctx);
        String szAddondScriptPathName = szBaseDrvPathName;
        if (szBaseDrvPathName.endsWith("/")) {
            szBaseDrvPathName = szBaseDrvPathName + "libv4a_fx_ics.so";
            if (bAddondSupported) {
                szAddondScriptPathName = szAddondScriptPathName + "91-v4a.sh";
            }
        } else {
            szBaseDrvPathName = szBaseDrvPathName + "/libv4a_fx_ics.so";
            if (bAddondSupported) {
                szAddondScriptPathName = szAddondScriptPathName + "/91-v4a.sh";
            }
        }
        try {
            if (bExistsVendor) {
                // Copy files
                bOperationSucceed = RootTools.remount("/system", "RW");
                if (bOperationSucceed) {
                    bOperationSucceed = RootTools.copyFile(szBaseDrvPathName,
                            "/system/lib/soundfx/libv4a_fx_ics.so", false, false);
                }
                if (bOperationSucceed) {
                    bOperationSucceed = RootTools.copyFile(szSystemConf + ".out",
                            "/system/etc/audio_effects.conf", false, false);
                }
                if (bOperationSucceed) {
                    bOperationSucceed = RootTools.copyFile(szVendorConf + ".out",
                            "/system/vendor/etc/audio_effects.conf", false, false);
                }
                if (bOperationSucceed && bAddondSupported) {
                    bOperationSucceed = RootTools.copyFile(szAddondScriptPathName,
                            "/system/addon.d/91-v4a.sh", false, false);
                }
                // Modify permission
                CommandCapture ccSetPermission = new CommandCapture(0,
                        szChmod + " 644 /system/etc/audio_effects.conf",
                        szChmod + " 644 /system/vendor/etc/audio_effects.conf",
                        szChmod + " 644 /system/lib/soundfx/libv4a_fx_ics.so");
                RootTools.getShell(true).add(ccSetPermission);

                // Modify permission of addon.d script if applicable
                if (bAddondSupported) {
                    CommandCapture ccSetAddondPermission = new CommandCapture(0,
                            szChmod + " 644 /system/addon.d/91-v4a.sh");
                    RootTools.getShell(true).add(ccSetAddondPermission);
                }

                RootTools.remount("/system", "RO");
            } else {
                // Copy files
                bOperationSucceed = RootTools.remount("/system", "RW");
                if (bOperationSucceed) {
                    bOperationSucceed = RootTools.copyFile(szBaseDrvPathName,
                            "/system/lib/soundfx/libv4a_fx_ics.so", false, false);
                }
                if (bOperationSucceed) {
                    bOperationSucceed = RootTools.copyFile(szSystemConf + ".out",
                            "/system/etc/audio_effects.conf", false, false);
                }
                if (bOperationSucceed && bAddondSupported) {
                    bOperationSucceed = RootTools.copyFile(szAddondScriptPathName,
                            "/system/addon.d/91-v4a.sh", false, false);
                }

                // Modify permission
                CommandCapture ccSetPermission = new CommandCapture(0,
                        szChmod + " 644 /system/etc/audio_effects.conf",
                        szChmod + " 644 /system/lib/soundfx/libv4a_fx_ics.so");
                RootTools.getShell(true).add(ccSetPermission);

                // Modify permission of addon.d script if applicable
                if (bAddondSupported) {
                    CommandCapture ccSetAddondPermission = new CommandCapture(0,
                            szChmod + " 644 /system/addon.d/91-v4a.sh");
                    RootTools.getShell(true).add(ccSetAddondPermission);
                }

                RootTools.remount("/system", "RO");
            }
        } catch (Exception e) {
            bOperationSucceed = false;
            Log.i("ViPER4Android", "Copy back to /system failed, msg = " + e.getMessage());
        }

        /* Cleanup temp file(s) and close root shell */
        try {
            if (bExistsVendor) {
                if (!RootTools.deleteFileOrDirectory(szSystemConf, false)) {
                    new File(szSystemConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(szVendorConf, false)) {
                    new File(szVendorConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(szSystemConf + ".out", false)) {
                    new File(szSystemConf + ".out").delete();
                }
                if (!RootTools.deleteFileOrDirectory(szVendorConf + ".out", false)) {
                    new File(szVendorConf + ".out").delete();
                }
            } else {
                if (!RootTools.deleteFileOrDirectory(szSystemConf, false)) {
                    new File(szSystemConf).delete();
                }
                if (!RootTools.deleteFileOrDirectory(szSystemConf + ".out", false)) {
                    new File(szSystemConf + ".out").delete();
                }
            }
            // Close all shells
            RootTools.closeAllShells();
        } catch (Exception e) {
            Log.i("ViPER4Android", "Copy back to /system cleanup failed, msg = " + e.getMessage());
            return false;
        }

        return bOperationSucceed;
    }

    // Install ViPER4Android FX driver using without shell command method
    private static boolean InstallDrv_FX_WithoutShell(Context ctx, String szDriverName) {
        boolean bAddondSupported = false;
        int nShellCmdReturn;

        // Make sure we can use external storage for temp directory
        if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            return false;
        }

        // Copy driver assets to local
        if (!CopyAssetsToLocal(ctx, szDriverName, "libv4a_fx_ics.so")) {
            return false;
        }

        // Check if addon.d directory exists and copy script if supported
        if (AddondExists()) {
            CopyAssetsToLocal(ctx, "91-v4a.sh", "91-v4a.sh");
            bAddondSupported = true;
        }

        // Generate temp config file path, thanks to 'ste71m'
        String szSystemConf = StaticEnvironment.GetESPath() + "v4a_audio_system.conf";
        String szVendorConf = StaticEnvironment.GetESPath() + "v4a_audio_vendor.conf";

        // Check vendor directory
        boolean bExistsVendor = RootTools.exists("/system/vendor/etc/audio_effects.conf");

        // Copy configuration to temp directory
        if (bExistsVendor) {
            /* Copy to external storage */
            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("cp /system/etc/audio_effects.conf " + szSystemConf);
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("cp /system/vendor/etc/audio_effects.conf "
                            + szVendorConf);
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
        } else {
            /* Copy to external storage */
            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("cp /system/etc/audio_effects.conf " + szSystemConf);
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
        }

        // Modifing configuration
        boolean bModifyResult = ModifyFXConfig(szSystemConf, szSystemConf + ".out");
        if (bExistsVendor) {
            bModifyResult &= ModifyFXConfig(szVendorConf, szVendorConf + ".out");
        }
        if (!bModifyResult) {
            /* Modify the configuration failed, lets cleanup temp file(s) */
            if (bExistsVendor) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
            } else {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
            }
            // Close shell
            ShellCommand.CloseShell();
            return false;
        }

        // Copy back to system
        String szBaseDrvPathName = GetBasePath(ctx);
        String szAddondScriptPathName = szBaseDrvPathName;
        if (szBaseDrvPathName.endsWith("/")) {
            szBaseDrvPathName = szBaseDrvPathName + "libv4a_fx_ics.so";
            if (bAddondSupported) {
                szAddondScriptPathName = szAddondScriptPathName + "91-v4a.sh";
            }
        } else {
            szBaseDrvPathName = szBaseDrvPathName + "/libv4a_fx_ics.so";
            if (bAddondSupported) {
                szAddondScriptPathName = szAddondScriptPathName + "/91-v4a.sh";
            }
        }

        if (bExistsVendor) {
            // Copy files

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("mount -o rw,remount /system");

            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot remount /system");
                ShellCommand.CloseShell();
                return false;
            }

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("rm /system/lib/soundfx/libv4a_fx_ics.so");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp " + szBaseDrvPathName
                    + " /system/lib/soundfx/libv4a_fx_ics.so");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy V4A driver to /system");
                ShellCommand.CloseShell();
                return false;
            }

            if (bAddondSupported) {
                nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp "
                        + szAddondScriptPathName + " /system/addon.d/91-v4a.sh");

                if (nShellCmdReturn != 0) {
                    Log.e("ViPER4Android", "Cannot copy addon.d script to /system/addon.d/");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp " + szSystemConf + ".out"
                    + " /system/etc/audio_effects.conf");

            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system");
                ShellCommand.CloseShell();
                return false;
            }

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp " + szVendorConf + ".out"
                    + " /system/vendor/etc/audio_effects.conf");

            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system/vendor");
                ShellCommand.CloseShell();
                return false;
            }
            // Modify permission

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("chmod 644 /system/etc/audio_effects.conf");

            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system]");
                ShellCommand.CloseShell();
                return false;
            }

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("chmod 644 /system/vendor/etc/audio_effects.conf");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system/vendor]");
                ShellCommand.CloseShell();
                return false;
            }
            if (bAddondSupported) {
                nShellCmdReturn = ShellCommand
                        .RootExecuteWithoutShell("chmod 644 /system/addon.d/91-v4a.sh");

                if (nShellCmdReturn != 0) {
                    Log.e("ViPER4Android",
                            "Cannot change addon.d script permission [/system/addon.d]");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("chmod 644 /system/lib/soundfx/libv4a_fx_ics.so");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szVendorConf).delete();
                new File(szSystemConf + ".out").delete();
                new File(szVendorConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change driver's permission");
                ShellCommand.CloseShell();
                return false;
            }

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("sync");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("mount -o ro,remount /system");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
        } else {
            // Copy files

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("mount -o rw,remount /system");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot remount /system");
                ShellCommand.CloseShell();
                return false;
            }

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("rm /system/lib/soundfx/libv4a_fx_ics.so");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp " + szBaseDrvPathName
                    + " /system/lib/soundfx/libv4a_fx_ics.so");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy V4A driver to /system");
                ShellCommand.CloseShell();
                return false;
            }
            if (bAddondSupported) {
                nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp "
                        + szAddondScriptPathName + " /system/addon.d/91-v4a.sh");
                if (nShellCmdReturn != 0) {
                    Log.e("ViPER4Android", "Cannot copy addon.d script to /system/addon.d/");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }

            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("cp " + szSystemConf + ".out"
                    + " /system/etc/audio_effects.conf");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot copy audio config to /system");
                ShellCommand.CloseShell();
                return false;
            }
            // Modify permission

            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("chmod 644 /system/etc/audio_effects.conf");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change config's permission [/system]");
                ShellCommand.CloseShell();
                return false;
            }
            if (bAddondSupported) {
                nShellCmdReturn = ShellCommand
                        .RootExecuteWithoutShell("chmod 644 /system/addon.d/91-v4a.sh");
                if (nShellCmdReturn != 0) {
                    Log.e("ViPER4Android",
                            "Cannot change addon.d script permission [/system/addon.d]");
                    // NO RETURN FALSE OR CLOSESHELL - addon.d script failure
                    // should not stop v4a from installing
                }
            }
            nShellCmdReturn = ShellCommand
                    .RootExecuteWithoutShell("chmod 644 /system/lib/soundfx/libv4a_fx_ics.so");
            if (nShellCmdReturn != 0) {
                new File(szSystemConf).delete();
                new File(szSystemConf + ".out").delete();
                Log.e("ViPER4Android", "Cannot change driver's permission");
                ShellCommand.CloseShell();
                return false;
            }
            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("sync");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
            // Determine command structure based on SuperUser or SuperSU use
            nShellCmdReturn = ShellCommand.RootExecuteWithoutShell("mount -o ro,remount /system");
            Log.i("ViPER4Android", "Command return = " + nShellCmdReturn);
        }

        /* Cleanup temp file(s) and close root shell */
        if (bExistsVendor) {
            new File(szSystemConf).delete();
            new File(szVendorConf).delete();
            new File(szSystemConf + ".out").delete();
            new File(szVendorConf + ".out").delete();
        } else {
            new File(szSystemConf).delete();
            new File(szSystemConf + ".out").delete();
        }

        return RootTools.exists("/system/lib/soundfx/libv4a_fx_ics.so");
    }

    // Install ViPER4Android FX driver
    public static boolean InstallDrv_FX(Context ctx, String szDriverName) {
        return InstallDrv_FX_RootTools(ctx, szDriverName)
                || InstallDrv_FX_WithoutShell(ctx, szDriverName);
    }

}
