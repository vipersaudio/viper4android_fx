package com.vipercn.viper4android_v2.preference;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.os.Environment;
import android.preference.ListPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.activity.StaticEnvironment;
import com.vipercn.viper4android_v2.activity.Utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

public class SummariedListPreferenceWithCustom extends ListPreference {
    public SummariedListPreferenceWithCustom(Context context, AttributeSet set) {
        super(context, set);
    }

    @Override
    protected void onPrepareDialogBuilder(Builder builder) {
        try {
            if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
                Log.i("ViPER4Android", "External storage not mounted");
                setEntries(new String[0]);
                setEntryValues(new String[0]);
                String tip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
                tip = String.format(tip, StaticEnvironment.getV4aKernelPath());
                Toast.makeText(getContext(), tip, Toast.LENGTH_LONG).show();
                super.onPrepareDialogBuilder(builder);
                return;
            }

            final String kernelPath = StaticEnvironment.getV4aKernelPath();
            File kernelFile = new File(kernelPath);

            if (!kernelFile.exists()) {
                Log.i("ViPER4Android", "Kernel directory does not exists");
                kernelFile.mkdirs();
                kernelFile.mkdir();
            } else Log.i("ViPER4Android", "Kernel directory exists");

            ArrayList<String> kernelList = new ArrayList<String>();
            Utils.getFileNameList(kernelFile, ".irs", kernelList);
            Utils.getFileNameList(kernelFile, ".wav", kernelList);

            if (kernelList.isEmpty()) {
                String tip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
                tip = String.format(tip, StaticEnvironment.getV4aKernelPath());
                Toast.makeText(getContext(), tip, Toast.LENGTH_LONG).show();
            } else Collections.sort(kernelList);

            final String[] kernelArray = new String[kernelList.size()];
            final String[] arrayValue = new String[kernelList.size()];
            for (int i = 0; i < kernelList.size(); i++) {
                kernelArray[i] = kernelList.get(i);
                arrayValue[i] = kernelPath + kernelList.get(i);
            }

            setEntries(kernelArray);
            setEntryValues(arrayValue);

            super.onPrepareDialogBuilder(builder);
        } catch (Exception e) {
            setEntries(new String[0]);
            setEntryValues(new String[0]);
            String tip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
            tip = String.format(tip, StaticEnvironment.getV4aKernelPath());
            Toast.makeText(getContext(), tip, Toast.LENGTH_LONG).show();
            super.onPrepareDialogBuilder(builder);
        }
    }

    @Override
    public void setValue(String value) {
        super.setValue(value);

        try {
            CharSequence[] entries = getEntries();
            CharSequence[] entryValues = getEntryValues();
            if (entries == null || entryValues == null) {
                if (value == null) {
                    setSummary("");
                    return;
                }
                if (value.isEmpty()) {
                    setSummary("");
                    return;
                }
                if (value.contains("/")) {
                    String fileName = value.substring(value.lastIndexOf("/") + 1);
                    setSummary(fileName);
                    return;
                }
                setSummary(value);
                return;
            }
            for (int i = 0; i < entryValues.length; i++) {
                if (entryValues[i].equals(value)) {
                    setSummary(entries[i]);
                    break;
                }
            }
        } catch (Exception e) {
            setSummary("");
        }
    }

    public void refreshFromPreference() {
        onSetInitialValue(true, null);
    }
}
