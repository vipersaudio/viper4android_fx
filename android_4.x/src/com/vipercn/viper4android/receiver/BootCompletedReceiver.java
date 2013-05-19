package com.vipercn.viper4android.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.vipercn.viper4android.service.HeadsetService;

public class BootCompletedReceiver extends BroadcastReceiver
{
    @Override
    public void onReceive(Context context, Intent intent)
    {
    	Log.i("ViPER4Android", "Starting service, reason = BootCompletedReceiver");
        context.startService(new Intent(context, HeadsetService.class));
    }
}
