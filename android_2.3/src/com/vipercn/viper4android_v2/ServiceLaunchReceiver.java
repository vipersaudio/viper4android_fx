package com.vipercn.viper4android_v2;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class ServiceLaunchReceiver extends BroadcastReceiver
{
	@Override
	public void onReceive(Context context, Intent intent)
	{
		Log.i("ViPER4Android", "Starting service, reason = ServiceLaunchReceiver");
		context.startService(new Intent(HeadsetService.NAME));
	}
}
