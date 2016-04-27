package com.vipercn.viper4android_v2.preference;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.preference.ListPreference;
import android.util.AttributeSet;
import android.util.Log;

import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.ArrayList;

import com.vipercn.viper4android_v2.activity.DDCDatabase;
import com.vipercn.viper4android_v2.activity.StaticEnvironment;
import com.vipercn.viper4android_v2.activity.Utils;

public class SummariedListPreferenceDDC extends ListPreference {

	private Map<String, String> mDDCMMData = null;

    public SummariedListPreferenceDDC(Context context, AttributeSet set) {
        super(context, set);
    	mDDCMMData = DDCDatabase.queryManufacturerAndModel(getContext());
    	if (mDDCMMData == null) mDDCMMData = new LinkedHashMap<String, String>();

		final String customDDCPath = StaticEnvironment.getV4aCustomDDCPath();
		File customDDCFile = new File(customDDCPath);
		if (!customDDCFile.exists()) {
			Log.i("ViPER4Android", "Custom DDC directory does not exists");
			customDDCFile.mkdirs();
			customDDCFile.mkdir();
		} else Log.i("ViPER4Android", "Custom DDC directory exists");
		ArrayList<String> customDDCList = new ArrayList<String>();
		Utils.getFileNameList(customDDCFile, ".vdc", customDDCList);
		if (!customDDCList.isEmpty()) {
			for (int i = 0; i < customDDCList.size(); i++) {
				mDDCMMData.put("FILE:" + customDDCList.get(i), customDDCList.get(i));
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
