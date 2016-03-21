package com.vipercn.viper4android_v2.preference;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.os.Environment;
import android.preference.ListPreference;
import android.util.AttributeSet;
import android.util.Log;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import com.vipercn.viper4android_v2.activity.DDCDatabase;
import com.vipercn.viper4android_v2.activity.Utils;

public class SummariedListPreferenceDDC extends ListPreference {

	private Map<String, String> mDDCMMData = null;

    public SummariedListPreferenceDDC(Context context, AttributeSet set) {
        super(context, set);
    	mDDCMMData = DDCDatabase.queryManufacturerAndModel(getContext());
    	if (mDDCMMData == null) mDDCMMData = new LinkedHashMap<String, String>();

    	final String szCustomDDCPath = Environment.getExternalStorageDirectory() + "/ViPER4Android/DDC/";
		File mCustomDDCFile = new File(szCustomDDCPath);
		if (!mCustomDDCFile.exists())
		{
			Log.i("ViPER4Android", "Custom DDC directory does not exists");
			mCustomDDCFile.mkdirs();
			mCustomDDCFile.mkdir();
		}
		else Log.i("ViPER4Android", "Custom DDC directory exists");
		ArrayList<String> szCustomDDCList = new ArrayList<String>();
		Utils.GetFileNameList(mCustomDDCFile, ".vdc", szCustomDDCList);
		if (!szCustomDDCList.isEmpty()) {
			for (int i = 0; i < szCustomDDCList.size(); i++) {
				mDDCMMData.put("FILE:" + szCustomDDCList.get(i), szCustomDDCList.get(i));
			}
		}
    }

    @Override
    protected void onPrepareDialogBuilder(Builder builder) {
        try {
            final String[] entriesArray = new String[mDDCMMData.size()];
            final String[] valuesArray = new String[mDDCMMData.size()];
            int index = 0;
            for (Map.Entry<String, String> entry : mDDCMMData.entrySet()) {
            	entriesArray[index] = entry.getValue();
            	valuesArray[index] = entry.getKey();
            	index++;
            }
            setEntries(entriesArray);
            setEntryValues(valuesArray);
            super.onPrepareDialogBuilder(builder);
        } catch (Exception e) {
            setEntries(new String[0]);
            setEntryValues(new String[0]);
            super.onPrepareDialogBuilder(builder);
        }
    }

    @Override
    public void setValue(String value) {
        super.setValue(value);

        if (mDDCMMData.containsKey(value)) {
	        CharSequence szSummary = mDDCMMData.get(value);
	        setSummary(szSummary);
        } else setSummary("");
    }

    public void refreshFromPreference() {
        onSetInitialValue(true, null);
    }
}
