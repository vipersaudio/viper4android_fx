package com.vipercn.viper4android_v2.preference;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Bundle;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;

import java.util.Arrays;
import java.util.Locale;

import com.vipercn.viper4android_v2.R;

public class EqualizerPreference extends DialogPreference
{
	protected EqualizerSurface listEqualizer, dialogEqualizer;
	private float[] levels = new float[10];
	private float[] initialLevels = new float[10];

	private static int showedDialogCount;

	public EqualizerPreference(Context context, AttributeSet attributeSet)
	{
		super(context, attributeSet);
		setLayoutResource(R.layout.equalizer);
		setDialogLayoutResource(R.layout.equalizer_popup);
	}

	@Override
	protected void onBindDialogView(View view)
	{
		super.onBindDialogView(view);

		dialogEqualizer = (EqualizerSurface) view.findViewById(R.id.FrequencyResponse);
		dialogEqualizer.setOnTouchListener(new OnTouchListener()
		{
			public boolean onTouch(View v, MotionEvent event)
			{
				float x = event.getX();
				float y = event.getY();

				int band = dialogEqualizer.findClosest(x);

				int wy = v.getHeight();
				float level = (y / wy) * (EqualizerSurface.MIN_DB - EqualizerSurface.MAX_DB) - EqualizerSurface.MIN_DB;
				if (level < EqualizerSurface.MIN_DB)
				{
					level = EqualizerSurface.MIN_DB;
				}
				if (level > EqualizerSurface.MAX_DB)
				{
					level = EqualizerSurface.MAX_DB;
				}

				dialogEqualizer.setBand(band, level);
				levels[band] = level;
				refreshPreference(levels);
				return true;
			}
		});

		for (int i = 0; i < levels.length; i ++)
		{
			dialogEqualizer.setBand(i, levels[i]);
		}
	}

	@Override
	protected void onDialogClosed(boolean positiveResult)
	{
		if (positiveResult)
		{
			initialLevels = Arrays.copyOf(levels, levels.length);
			if (listEqualizer != null)
			{
				for (int i = 0; i < levels.length; i ++)
				{
					listEqualizer.setBand(i, levels[i]);
				}
			}
			refreshPreference(levels);
			notifyChanged();
		}
		else if (showedDialogCount == 1)
		{
			levels = Arrays.copyOf(initialLevels, levels.length);
			refreshPreference(levels);
			notifyChanged();
		}
		showedDialogCount--;
	}

	protected void refreshPreference(float[] levels)
	{
		String levelString = "";
		for (int i = 0; i < levels.length; i ++)
		{
			levelString += String.format(Locale.ROOT, "%.1f", Math.round(levels[i] * 10.f) / 10.f) + ";";
		}
		EqualizerPreference.this.persistString(levelString);
	}

	@Override
	protected void onBindView(View view)
	{
		super.onBindView(view);
		listEqualizer = (EqualizerSurface) view.findViewById(R.id.FrequencyResponse);
		for (int i = 0; i < levels.length; i ++)
		{
			listEqualizer.setBand(i, levels[i]);
		}
	}

	@Override
	protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue)
	{
		String levelString = restorePersistedValue ? getPersistedString(null) : (String) defaultValue;
		if (levelString != null)
		{
			String[] levelsStr = levelString.split(";");
			if (levelsStr.length != levels.length)
			{
				return;
			}
			for (int i = 0; i < levels.length; i ++)
			{
				initialLevels[i] = levels[i] = Float.valueOf(levelsStr[i]);
			}
		}
	}

	@Override
	protected void showDialog (Bundle state)
	{
		super.showDialog(state);
		showedDialogCount++;
	}

	@Override
	protected Parcelable onSaveInstanceState ()
	{
		Parcelable superState = super.onSaveInstanceState();
		SavedLevels savedLevels = new SavedLevels(superState);
		savedLevels.levels = levels;
		savedLevels.initialLevels = initialLevels;
		return savedLevels;
	}

    @Override
    protected void onRestoreInstanceState (Parcelable state)
    {
		SavedLevels levelsState = (SavedLevels)state;
		levels = levelsState.levels;
		initialLevels = levelsState.initialLevels;
		super.onRestoreInstanceState (levelsState.getSuperState());
	}

	public void refreshFromPreference()
	{
		onSetInitialValue(true, "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;");
	}

	public static class SavedLevels extends BaseSavedState
	{
		private float[] initialLevels;
		private float[] levels;

		@Override
		public void writeToParcel(Parcel out, int flags)
		{
			out.writeFloatArray(levels);
			out.writeFloatArray(initialLevels);
		}

		public static final Parcelable.Creator<SavedLevels> CREATOR = new Parcelable.Creator<SavedLevels>()
		{
			public SavedLevels createFromParcel(Parcel in)
			{
				return new SavedLevels(in);
			}

			public SavedLevels[] newArray(int size)
			{
				return new SavedLevels[size];
			}
		};

		private SavedLevels(Parcel in)
		{
			super(in);
			in.readFloatArray(levels);
			in.readFloatArray(initialLevels);
		}

		private SavedLevels(Parcelable parcelable)
		{
			super(parcelable);
		}
	}
}
