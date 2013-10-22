package com.vipercn.viper4android_v2.preference;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

import com.vipercn.viper4android_v2.R;
import com.vipercn.viper4android_v2.activity.StaticEnvironment;
import com.vipercn.viper4android_v2.activity.Utils;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.os.Environment;
import android.preference.ListPreference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

public class SummariedListPreferenceWithCustom extends ListPreference
{
	public SummariedListPreferenceWithCustom(Context context, AttributeSet set)
	{
		super(context, set);
	}

	@Override  
	protected void onPrepareDialogBuilder(Builder builder)
	{
		try
		{
			if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
			{
				Log.i("ViPER4Android", "External storage not mounted");
				setEntries(new String[0]);
				setEntryValues(new String[0]);
				String szTip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
				szTip = String.format(szTip, StaticEnvironment.GetV4AKernelPath());
				Toast.makeText(getContext(), szTip, Toast.LENGTH_LONG).show();
				super.onPrepareDialogBuilder(builder);
				return;
			}

			final String szKernelPath = StaticEnvironment.GetV4AKernelPath();
			File mKnlFile = new File(szKernelPath);

			if (!mKnlFile.exists())
			{
				Log.i("ViPER4Android", "Kernel directory does not exists");
				mKnlFile.mkdirs();
				mKnlFile.mkdir();
			}
			else Log.i("ViPER4Android", "Kernel directory exists");

			ArrayList<String> szKnlList = new ArrayList<String>();
			Utils.GetFileNameList(mKnlFile, ".irs", szKnlList);
			Utils.GetFileNameList(mKnlFile, ".wav", szKnlList);

			if (szKnlList.isEmpty())
			{
				String szTip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
				szTip = String.format(szTip, StaticEnvironment.GetV4AKernelPath());
				Toast.makeText(getContext(), szTip, Toast.LENGTH_LONG).show();
			}
			else Collections.sort(szKnlList);

			final String[] szKnlArray = new String[szKnlList.size()];
			final String[] szKnlArrayVal = new String[szKnlList.size()];
			for(int i = 0; i < szKnlList.size(); i++)
			{
				szKnlArray[i] = szKnlList.get(i);
				szKnlArrayVal[i] = szKernelPath + szKnlList.get(i);
			}

			setEntries(szKnlArray);
			setEntryValues(szKnlArrayVal);

			super.onPrepareDialogBuilder(builder);
		}
		catch (Exception e)
		{
			setEntries(new String[0]);
			setEntryValues(new String[0]);
			String szTip = getContext().getResources().getString(R.string.text_ir_dir_isempty);
			szTip = String.format(szTip, StaticEnvironment.GetV4AKernelPath());
			Toast.makeText(getContext(), szTip, Toast.LENGTH_LONG).show();
			super.onPrepareDialogBuilder(builder);
		}
	}

	@Override
	public void setValue(String value)
	{
		super.setValue(value);

		try
		{
			CharSequence[] entries = getEntries();
			CharSequence[] entryValues = getEntryValues();
			if (entries == null || entryValues == null)
			{
				if (value == null)
				{
					setSummary("");
					return;
				}
				if (value.isEmpty())
				{
					setSummary("");
					return;
				}
				if (value.contains("/"))
				{
					String fileName = value.substring(value.lastIndexOf("/") + 1);
					setSummary(fileName);
					return;
				}
				setSummary(value);
				return;
			}
			for (int i = 0; i < entryValues.length; i ++)
			{
				if (entryValues[i].equals(value))
				{
					setSummary(entries[i]);
					break;
				}
			}
		}
		catch (Exception e)
		{
			setSummary("");
		}
	}

	public void refreshFromPreference()
	{
		onSetInitialValue(true, null);
	}
}
