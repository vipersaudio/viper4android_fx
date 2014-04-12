
package com.vipercn.viper4android_v2.activity;

import java.io.File;
import java.util.LinkedHashMap;
import java.util.Map;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.util.Log;

public class DDCDatabase {

	public static boolean initializeDatabase(Context ctx) {
		String szLocalDatabasePathName = Utils.getBasePath(ctx);
		if (szLocalDatabasePathName.endsWith("/")) {
			szLocalDatabasePathName = szLocalDatabasePathName + "ViPERDDC.db";
		} else {
			szLocalDatabasePathName = szLocalDatabasePathName + "/ViPERDDC.db";
		}

		File fDBFile = new File(szLocalDatabasePathName);
		if (fDBFile.exists()) fDBFile.delete();
		fDBFile = null;
		if (!Utils.copyAssetsToLocal(ctx, "ViPERDDC.db", "ViPERDDC.db")) {
			szLocalDatabasePathName = null;
			return false;
		}

		return true;
	}

	public static Map<String, String> queryManufacturerAndModel(Context ctx) {
		String szLocalDatabasePathName = Utils.getBasePath(ctx);
		if (szLocalDatabasePathName.endsWith("/")) {
			szLocalDatabasePathName = szLocalDatabasePathName + "ViPERDDC.db";
		} else {
			szLocalDatabasePathName = szLocalDatabasePathName + "/ViPERDDC.db";
		}

		Map<String, String> mManufacturerAndModel = new LinkedHashMap<String, String>();
		SQLiteDatabase dbViPERDDC = null;
		Cursor mDDCData = null;
		try {
			String[] szColumns = new String[] { "ID", "Company", "Model" };
			dbViPERDDC = SQLiteDatabase.openDatabase(szLocalDatabasePathName, null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
			mDDCData = dbViPERDDC.query("DDCData", szColumns, null, null, null, null, "Company COLLATE NOCASE");
			if ((mDDCData != null) && mDDCData.moveToFirst()) {
				do {
					if (mDDCData.isNull(0) || mDDCData.isNull(1) || mDDCData.isNull(2))
						continue;
					String szKey = mDDCData.getString(1).trim() + " - " + mDDCData.getString(2).trim();
					mManufacturerAndModel.put(mDDCData.getString(0).trim(), szKey);
				} while (mDDCData.moveToNext());
				mDDCData.close();
				mDDCData = null;
			}
			dbViPERDDC.close();
			dbViPERDDC = null;
			szColumns = null;
			szLocalDatabasePathName = null;
			return mManufacturerAndModel;
		} catch (SQLiteException ex) {
			Log.i("ViPER4Android", "queryManufacturerAndModel[ViPER-DDC] :" + ex.getMessage());
			mDDCData = null;
			dbViPERDDC = null;
			szLocalDatabasePathName = null;
			return mManufacturerAndModel;
		}
	}

	public static String queryDDCBlock(String szKeyID, Context ctx) {
		String szLocalDatabasePathName = Utils.getBasePath(ctx);
		if (szLocalDatabasePathName.endsWith("/")) {
			szLocalDatabasePathName = szLocalDatabasePathName + "ViPERDDC.db";
		} else {
			szLocalDatabasePathName = szLocalDatabasePathName + "/ViPERDDC.db";
		}

		SQLiteDatabase dbViPERDDC = null;
		Cursor mDDCData = null;
		try {
			String[] szColumns = new String[] { "ID", "SR_44100_Coeffs", "SR_48000_Coeffs" };
			String[] szQueryArgs = new String[] { szKeyID };
			dbViPERDDC = SQLiteDatabase.openDatabase(szLocalDatabasePathName, null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
			mDDCData = dbViPERDDC.query("DDCData", szColumns, "ID=?", szQueryArgs, null, null, null);
			if (mDDCData == null || mDDCData.getCount() != 1) {
				dbViPERDDC.close();
				dbViPERDDC = null;
				szColumns = null;
				szQueryArgs = null;
				szLocalDatabasePathName = null;
				return "";
			}
			mDDCData.moveToFirst();
			String szC44100 = mDDCData.getString(1).trim();
			String szC48000 = mDDCData.getString(2).trim();
			mDDCData.close();
			dbViPERDDC.close();
			mDDCData = null;
			dbViPERDDC = null;
			szColumns = null;
			szQueryArgs = null;
			szLocalDatabasePathName = null;
			if (szC44100.length() <= 0 || szC48000.length() <= 0) {
				return "";
			}
			return szC44100 + "," + szC48000;
		} catch (Exception ex) {
			Log.i("ViPER4Android", "queryDDCBlock[ViPER-DDC] :" + ex.getMessage());
			mDDCData = null;
			dbViPERDDC = null;
			szLocalDatabasePathName = null;
			return "";
		}
	}

	public static float[] blockToFloatArray(String szDDCBlock) {
		if ((szDDCBlock == null) ||
			(szDDCBlock.length() < 3) ||
			(!szDDCBlock.contains(",")))
			return null;
		try {
			String[] szCoeffs = szDDCBlock.split(",");
			float[] faCoeffsArray = new float[szCoeffs.length];
			for (int i = 0; i < szCoeffs.length; i++) {
				faCoeffsArray[i] = Float.valueOf(szCoeffs[i]);
			}
			return faCoeffsArray;
		} catch (Exception ex) {
			return null;
		}
	}

}
