package com.vipercn.viper4android_v2;

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.media.audiofx.AudioEffect;
import android.os.Binder;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.Toast;

import com.vipercn.viper4android_v2.activity.ViPER4Android;

public class HeadsetService extends Service
{
	private class V4ADSPModule
	{
		private final UUID EFFECT_TYPE_NULL = UUID.fromString("ec7178ec-e5e1-4432-a3f4-4657e6795210");
		public AudioEffect mInstance = null;

		public V4ADSPModule(UUID uModuleID, int nPriority)
		{
			try
			{
				mInstance = AudioEffect.class.getConstructor(UUID.class, UUID.class, Integer.TYPE, Integer.TYPE).newInstance(EFFECT_TYPE_NULL, uModuleID, nPriority, 0);
				Log.i("ViPER4Android", "Creating viper4android module, " + uModuleID.toString());
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", e.getMessage());
				mInstance = null;
			}
		}

		public void release()
		{
			Log.i("ViPER4Android", "Free viper4android module.");
			if (mInstance != null)
				mInstance.release();
			mInstance = null;
		}

		private byte[] intToByteArray(int value)
		{
			ByteBuffer converter = ByteBuffer.allocate(4);
			converter.order(ByteOrder.nativeOrder());
			converter.putInt(value);
			return converter.array();
		}

		private int byteArrayToInt(byte[] valueBuf, int offset)
		{
			ByteBuffer converter = ByteBuffer.wrap(valueBuf);
			converter.order(ByteOrder.nativeOrder());
			return converter.getInt(offset);
		}

		private byte[] concatArrays(byte[]... arrays)
		{
			int len = 0;
			for (byte[] a : arrays)
			{
				len += a.length;
			}
			byte[] b = new byte[len];
			int offs = 0;
			for (byte[] a : arrays)
			{
				System.arraycopy(a, 0, b, offs, a.length);
				offs += a.length;
			}
			return b;
		}

		public void setParameter_px4_vx4x1(int param, int valueL)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] v = intToByteArray(valueL);
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx4x1: " + e.getMessage());
			}
		}

		public void setParameter_px4_vx4x2(int param, int valueL, int valueH)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] vL = intToByteArray(valueL);
				byte[] vH = intToByteArray(valueH);
				byte[] v = concatArrays(vL, vH);
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx4x2: " + e.getMessage());
			}
		}

		@SuppressWarnings("unused")
		public void setParameter_px4_vx4x3(int param, int valueL, int valueH, int valueE)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] vL = intToByteArray(valueL);
				byte[] vH = intToByteArray(valueH);
				byte[] vE = intToByteArray(valueE);
				byte[] v = concatArrays(vL, vH, vE);
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx4x3: " + e.getMessage());
			}
		}

		@SuppressWarnings("unused")
		public void setParameter_px4_vx4x4(int param, int valueL, int valueH, int valueE, int valueR)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] vL = intToByteArray(valueL);
				byte[] vH = intToByteArray(valueH);
				byte[] vE = intToByteArray(valueE);
				byte[] vR = intToByteArray(valueR);
				byte[] v = concatArrays(vL, vH, vE, vR);
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx4x4: " + e.getMessage());
			}
		}

		public void setParameter_px4_vx1x256(int param, int dataLength, byte[] byteData)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] vL = intToByteArray(dataLength);
				byte[] v = concatArrays(vL, byteData);
				if (v.length < 256)
				{
					int zeroPad = 256 - v.length;
					byte[] zeroArray = new byte[zeroPad];
					v = concatArrays(v, zeroArray);
				}
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx1x256: " + e.getMessage());
			}
		}

		public void setParameter_px4_vxString(int param, String szData)
		{
			int stringLen = szData.length();
			byte[] stringBytes = szData.getBytes(Charset.forName("US-ASCII"));
			setParameter_px4_vx1x256(param, stringLen, stringBytes);
		}

		public void setParameter_Native(byte[] parameter, byte[] value)
		{
			if (mInstance == null) return;
			try
			{
				Method setParameter = AudioEffect.class.getMethod("setParameter", byte[].class, byte[].class);
				setParameter.invoke(mInstance, parameter, value);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_Native: " + e.getMessage());
			}
		}

		public int getParameter_px4_vx4x1(int param)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] v = new byte[4];
				getParameter_Native(p, v);
				int val = byteArrayToInt(v, 0);
				return val;
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "getParameter_px4_vx4x1: " + e.getMessage());
				return -1;
			}
		}

		public void getParameter_Native(byte[] parameter, byte[] value)
		{
			if (mInstance == null) return;
			try
			{
				Method getParameter = AudioEffect.class.getMethod("getParameter", byte[].class, byte[].class);
				getParameter.invoke(mInstance, parameter, value);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "getParameter_Native: " + e.getMessage());
			}
		}
	}

	public class LocalBinder extends Binder
	{
		public HeadsetService getService()
		{
			return HeadsetService.this;
		}
	}

	public static final String NAME = "com.vipercn.viper4android_v2.HEADSET_SERVICE";
	public static final UUID ID_V4A_GENERAL_FX = UUID.fromString("41d3c987-e6cf-11e3-a88a-11aba5d5c51b");

	/* ViPER4Android Driver Status */
	public static final int PARAM_GET_DRIVER_VERSION = 32769;
	public static final int PARAM_GET_NEONENABLED = 32770;
	public static final int PARAM_GET_ENABLED = 32771;
	public static final int PARAM_GET_CONFIGURE = 32772;
	public static final int PARAM_GET_STREAMING = 32773;
	public static final int PARAM_GET_EFFECT_TYPE = 32774;
	public static final int PARAM_GET_SAMPLINGRATE = 32775;
	public static final int PARAM_GET_CHANNELS = 32776;
	public static final int PARAM_GET_CONVUSABLE = 32777;
	/*******************************/

	/* ViPER4Android Driver Status Control */
	public static final int PARAM_SET_COMM_STATUS = 36865;
	public static final int PARAM_SET_UPDATE_STATUS = 36866;
	public static final int PARAM_SET_RESET_STATUS = 36867;
	/***************************************/

	/* ViPER4Android FX Types */
	public static final int V4A_FX_TYPE_NONE = 0;
	public static final int V4A_FX_TYPE_HEADPHONE = 1;
	public static final int V4A_FX_TYPE_SPEAKER = 2;
	/**************************/

	/* ViPER4Android General FX Parameters */
	public static final int PARAM_FX_TYPE_SWITCH = 65537;
	public static final int PARAM_HPFX_CONV_PROCESS_ENABLED = 65538;
	public static final int PARAM_HPFX_CONV_UPDATEKERNEL_DEPRECATED = 65539;  /* DEPRECATED in 4.x system, use buffer instead */
	public static final int PARAM_HPFX_CONV_PREPAREBUFFER = 65540;
	public static final int PARAM_HPFX_CONV_SETBUFFER = 65541;
	public static final int PARAM_HPFX_CONV_COMMITBUFFER = 65542;
	public static final int PARAM_HPFX_VHE_PROCESS_ENABLED = 65543;
	public static final int PARAM_HPFX_VHE_EFFECT_LEVEL = 65544;
	public static final int PARAM_HPFX_FIREQ_PROCESS_ENABLED = 65545;
	public static final int PARAM_HPFX_FIREQ_BANDLEVEL = 65546;
	public static final int PARAM_HPFX_COLM_PROCESS_ENABLED = 65547;
	public static final int PARAM_HPFX_COLM_WIDENING = 65548;
	public static final int PARAM_HPFX_COLM_MIDIMAGE = 65549;
	public static final int PARAM_HPFX_COLM_DEPTH = 65550;
	public static final int PARAM_HPFX_DIFFSURR_PROCESS_ENABLED = 65551;
	public static final int PARAM_HPFX_DIFFSURR_DELAYTIME = 65552;
	public static final int PARAM_HPFX_REVB_PROCESS_ENABLED = 65553;
	public static final int PARAM_HPFX_REVB_ROOMSIZE = 65554;
	public static final int PARAM_HPFX_REVB_WIDTH = 65555;
	public static final int PARAM_HPFX_REVB_DAMP = 65556;
	public static final int PARAM_HPFX_REVB_WET = 65557;
	public static final int PARAM_HPFX_REVB_DRY = 65558;
	public static final int PARAM_HPFX_AGC_PROCESS_ENABLED = 65559;
	public static final int PARAM_HPFX_AGC_RATIO = 65560;
	public static final int PARAM_HPFX_AGC_VOLUME = 65561;
	public static final int PARAM_HPFX_AGC_MAXSCALER = 65562;
	public static final int PARAM_HPFX_DYNSYS_PROCESS_ENABLED = 65563;
	public static final int PARAM_HPFX_DYNSYS_ENABLETUBE = 65564;
	public static final int PARAM_HPFX_DYNSYS_XCOEFFS = 65565;
	public static final int PARAM_HPFX_DYNSYS_YCOEFFS = 65566;
	public static final int PARAM_HPFX_DYNSYS_SIDEGAIN = 65567;
	public static final int PARAM_HPFX_DYNSYS_BASSGAIN = 65568;
	public static final int PARAM_HPFX_VIPERBASS_PROCESS_ENABLED = 65569;
	public static final int PARAM_HPFX_VIPERBASS_MODE = 65570;
	public static final int PARAM_HPFX_VIPERBASS_SPEAKER = 65571;
	public static final int PARAM_HPFX_VIPERBASS_BASSGAIN = 65572;
	public static final int PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED = 65573;
	public static final int PARAM_HPFX_VIPERCLARITY_MODE = 65574;
	public static final int PARAM_HPFX_VIPERCLARITY_CLARITY = 65575;
	public static final int PARAM_HPFX_CURE_PROCESS_ENABLED = 65576;
	public static final int PARAM_HPFX_CURE_CROSSFEED = 65577;
	public static final int PARAM_HPFX_OUTPUT_VOLUME = 65578;
	public static final int PARAM_HPFX_OUTPUT_PAN = 65579;
	public static final int PARAM_HPFX_LIMITER_THRESHOLD = 65580;
	public static final int PARAM_SPKFX_CONV_PROCESS_ENABLED = 65581;
	public static final int PARAM_SPKFX_CONV_UPDATEKERNEL_DEPRECATED = 65582;  /* DEPRECATED in 4.x system, use buffer instead */
	public static final int PARAM_SPKFX_CONV_PREPAREBUFFER = 65583;
	public static final int PARAM_SPKFX_CONV_SETBUFFER = 65584;
	public static final int PARAM_SPKFX_CONV_COMMITBUFFER = 65585;
	public static final int PARAM_SPKFX_FIREQ_PROCESS_ENABLED = 65586;
	public static final int PARAM_SPKFX_FIREQ_BANDLEVEL = 65587;
	public static final int PARAM_SPKFX_REVB_PROCESS_ENABLED = 65588;
	public static final int PARAM_SPKFX_REVB_ROOMSIZE = 65589;
	public static final int PARAM_SPKFX_REVB_WIDTH = 65590;
	public static final int PARAM_SPKFX_REVB_DAMP = 65591;
	public static final int PARAM_SPKFX_REVB_WET = 65592;
	public static final int PARAM_SPKFX_REVB_DRY = 65593;
	public static final int PARAM_SPKFX_AGC_PROCESS_ENABLED = 65594;
	public static final int PARAM_SPKFX_AGC_RATIO = 65595;
	public static final int PARAM_SPKFX_AGC_VOLUME = 65596;
	public static final int PARAM_SPKFX_AGC_MAXSCALER = 65597;
	public static final int PARAM_SPKFX_OUTPUT_VOLUME = 65598;
	public static final int PARAM_SPKFX_LIMITER_THRESHOLD = 65599;
	/***************************************/

    private AudioManager mAudioManager = null;
    private V4ADSPModule mGeneralFX = null;

    private final LocalBinder mBinder = new LocalBinder();
	protected boolean useHeadphone = false;
	protected boolean inCall = false;
	protected String mPreviousMode = "none";
	private boolean mServicePrepared = false;
	private boolean mDriverIsReady = false;

	private final Timer tmDrvStatusCommTimer = new Timer();
	private static Handler hDrvStatusCommTimerHandler = new Handler()
	{
	    @Override
	    public void handleMessage(Message msg)
	    {
	    	if (msg == null)
	    	{
	    		super.handleMessage(msg);
	    		return;
	    	}

	    	if (msg.what == 1)
	    	{
		    	try
		    	{
		    		if (msg.obj == null)
		    		{
		    			super.handleMessage(msg);
		    			return;
		    		}
		    		V4ADSPModule v4a = (V4ADSPModule)(msg.obj);
			    	if (v4a != null)
			    	{
			    		if (v4a.mInstance != null)
			    			v4a.setParameter_px4_vx4x1(PARAM_SET_COMM_STATUS, 1);
			    	}
			    	super.handleMessage(msg);
		    	}
		    	catch (Exception e) { super.handleMessage(msg); }
	    	}
	    }
	};
	private TimerTask ttDrvStatusCommTimer = new TimerTask()
	{
	    @Override
	    public void run()
	    {
	        Message message = new Message();
	        message.what = 1;
	        message.obj = (V4ADSPModule)mGeneralFX;
	        hDrvStatusCommTimerHandler.sendMessage(message);
	    }
	};

	private boolean bMediaMounted = false;
	private final Timer tmMediaStatusTimer = new Timer();
	private TimerTask ttMediaStatusTimer = new TimerTask()
	{
	    @Override
	    public void run()
	    {
	    	/* This is the *best* way to solve the fragmentation of android system */
	    	/* Use a media mounted broadcast is not safe */

	    	if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
	    		bMediaMounted = false;
	    	else
	    	{
	    		if (!bMediaMounted)
	    		{
	    			Log.i("ViPER4Android", "Media mounted, now updating parameters");
	    			bMediaMounted = true;
	    			updateDspSystem();
	    		}
	    	}
	    }
	};

    private final BroadcastReceiver audioSessionReceiver = new BroadcastReceiver()
    {
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "audioSessionReceiver::onReceive()");
			updateDspSystem();
		}
	};

    private final BroadcastReceiver preferenceUpdateReceiver = new BroadcastReceiver()
    {
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "preferenceUpdateReceiver::onReceive()");
			updateDspSystem();
		}
	};

	private final BroadcastReceiver showNotifyReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "showNotifyReceiver::onReceive()");

			SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
			String szLockedEffect = prefSettings.getString("viper4android.settings.lock_effect", "none");
			String mode = "";

			if (szLockedEffect.equalsIgnoreCase("none"))
			{
				if (inCall) mode = "disable";
				else if (mAudioManager.isBluetoothA2dpOn()) mode = "bluetooth";
				else mode = useHeadphone ? "headset" : "speaker";
			}
			else mode = szLockedEffect;

			if (mode.equalsIgnoreCase("headset"))
				ShowNotification(getString(getResources().getIdentifier("text_headset", "string", getApplicationInfo().packageName)));
			else if (mode.equalsIgnoreCase("bluetooth"))
				ShowNotification(getString(getResources().getIdentifier("text_bluetooth", "string", getApplicationInfo().packageName)));
			else ShowNotification(getString(getResources().getIdentifier("text_speaker", "string", getApplicationInfo().packageName)));
		}
	};

	private final BroadcastReceiver cancelNotifyReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "cancelNotifyReceiver::onReceive()");
			CancelNotification();
		}
	};

	private final BroadcastReceiver screenOnReceiver = new BroadcastReceiver()
	{
		@Override  
		public void onReceive(final Context context, final Intent intent)
		{
			Log.i("ViPER4Android", "screenOnReceiver::onReceive()");
			/* Nothing to do here, for now */
		}
	};

    private final BroadcastReceiver headsetReceiver = new BroadcastReceiver()
    {
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "headsetReceiver::onReceive()");

			String mode = "disable";
			final String action = intent.getAction();

			if (inCall)
			{
				mode = "disable";
				updateDspSystem();
				Log.i("ViPER4Android", "headsetReceiver::onReceive()");
				return;
			}

            if (action.equals(Intent.ACTION_HEADSET_PLUG))
            {
            	useHeadphone = intent.getIntExtra("state", 0) != 0;
        		if (mAudioManager.isBluetoothA2dpOn()) mode = "bluetooth";
        		else mode = useHeadphone ? "headset" : "speaker";
            }
            else if (action.equals(BluetoothDevice.ACTION_ACL_CONNECTED))
            {
                final int deviceClass = ((BluetoothDevice)intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE)).getBluetoothClass().getDeviceClass();
                if ((deviceClass == BluetoothClass.Device.AUDIO_VIDEO_HEADPHONES) || (deviceClass == BluetoothClass.Device.AUDIO_VIDEO_WEARABLE_HEADSET))
                {
                	mode = "bluetooth";
				}
			}
            else if (action.equals(AudioManager.ACTION_AUDIO_BECOMING_NOISY))
            {
        		if (mAudioManager.isBluetoothA2dpOn()) mode = "bluetooth";
        		else mode = useHeadphone ? "headset" : "speaker";
            }
            else if (action.equals(BluetoothDevice.ACTION_ACL_DISCONNECTED))
            {
            	final int deviceClass = ((BluetoothDevice)intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE)).getBluetoothClass().getDeviceClass();
                if ((deviceClass == BluetoothClass.Device.AUDIO_VIDEO_HEADPHONES) || (deviceClass == BluetoothClass.Device.AUDIO_VIDEO_WEARABLE_HEADSET))
				{
                	mode = useHeadphone ? "headset" : "speaker";
				}
			}

            updateDspSystem(mode);
		}
	};

	private final PhoneStateListener mPhoneListener = new PhoneStateListener()
	{
		@Override
		public void onCallStateChanged(int state, String incomingNumber)
		{
			switch (state)
			{
			case TelephonyManager.CALL_STATE_OFFHOOK:
				inCall = true;
				break;
			default:
				inCall = false;
				break;
			}
			updateDspSystem();
		}
	};

	private void ShowNotification(String nFXType)
	{
    	SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
    	boolean bEnableNotify = preferences.getBoolean("viper4android.settings.show_notify_icon", false);
    	if (!bEnableNotify)
    	{
    		Log.i("ViPER4Android", "ShowNotification(): show_notify = false");
    		return;
    	}

        int nIconID = getResources().getIdentifier("icon", "drawable", getApplicationInfo().packageName);
		String szNotifyText = "ViPER4Android FX " + nFXType;

        Notification notify = new Notification(nIconID, szNotifyText, System.currentTimeMillis());
        notify.flags |= Notification.FLAG_ONGOING_EVENT;
        notify.flags |= Notification.FLAG_NO_CLEAR;
        notify.defaults = 0;

        CharSequence contentTitle = "ViPER4Android FX";
        CharSequence contentText = nFXType;

        Intent notificationIntent = new Intent(HeadsetService.this, ViPER4Android.class);
        PendingIntent contentItent = PendingIntent.getActivity(HeadsetService.this, 0, notificationIntent, 0);
        notify.setLatestEventInfo(HeadsetService.this, contentTitle, contentText, contentItent);

        NotificationManager notificationManager = (NotificationManager)getSystemService(android.content.Context.NOTIFICATION_SERVICE);
        notificationManager.notify(0x1234, notify);
    }

	private void CancelNotification()
	{
		NotificationManager notificationManager = (NotificationManager)getSystemService(NOTIFICATION_SERVICE); 
        notificationManager.cancel(0x1234);
	}

	@Override
	public void onCreate()
	{
		super.onCreate();
		mServicePrepared = false;

		try
		{
			CancelNotification();

			try
			{
				Log.i("ViPER4Android", "Creating global V4ADSPModule ...");
				if (mGeneralFX == null)
					mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, 0);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "Creating V4ADSPModule failed.");
				mGeneralFX = null;
			}

			if (mGeneralFX == null)
				mDriverIsReady = false;
			else
			{
				mDriverIsReady = true;
				String szDriverVer = GetDriverVersion();
				if (szDriverVer.equals("0.0.0.0")) mDriverIsReady = false;
				else mDriverIsReady = true;
			}

			Context context = getApplicationContext();
			mAudioManager = (AudioManager)context.getSystemService(Context.AUDIO_SERVICE);

			startForeground(ViPER4Android.NOTIFY_FOREGROUND_ID, new Notification());

			TelephonyManager tm = (TelephonyManager)getSystemService(TELEPHONY_SERVICE);
			tm.listen(mPhoneListener, PhoneStateListener.LISTEN_CALL_STATE);

			IntentFilter audioFilter = new IntentFilter();
			audioFilter.addAction(AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION);
			audioFilter.addAction(AudioEffect.ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION);

			registerReceiver(audioSessionReceiver, audioFilter);

			IntentFilter intentFilter = new IntentFilter(Intent.ACTION_HEADSET_PLUG);
			intentFilter.addAction(BluetoothDevice.ACTION_ACL_CONNECTED);
			intentFilter.addAction(BluetoothDevice.ACTION_ACL_DISCONNECTED);
			intentFilter.addAction(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
			registerReceiver(headsetReceiver, intentFilter);

			registerReceiver(preferenceUpdateReceiver, new IntentFilter(ViPER4Android.ACTION_UPDATE_PREFERENCES));

			registerReceiver(showNotifyReceiver, new IntentFilter(ViPER4Android.ACTION_SHOW_NOTIFY));
			registerReceiver(cancelNotifyReceiver, new IntentFilter(ViPER4Android.ACTION_CANCEL_NOTIFY));

			final IntentFilter screenFilter = new IntentFilter();
			screenFilter.addAction(Intent.ACTION_SCREEN_ON);
		    registerReceiver(screenOnReceiver, screenFilter);

			Log.i("ViPER4Android", "Service launched.");

			updateDspSystem();
			mServicePrepared = true;

			tmDrvStatusCommTimer.schedule(ttDrvStatusCommTimer, 60000, 60000);
			tmMediaStatusTimer.schedule(ttMediaStatusTimer, 15000, 60000);  /* First is 15 secs, then 60 secs */
		}
		catch (Exception e)
		{
			mServicePrepared = false;
			CancelNotification();
			System.exit(0);
		}
	}

	@Override
	public void onDestroy()
	{
		super.onDestroy();

		mServicePrepared = false;
		try
		{
			tmDrvStatusCommTimer.cancel();
			tmMediaStatusTimer.cancel();

			stopForeground(true);

			unregisterReceiver(audioSessionReceiver);
			unregisterReceiver(headsetReceiver);
			unregisterReceiver(preferenceUpdateReceiver);
			unregisterReceiver(screenOnReceiver);
			unregisterReceiver(showNotifyReceiver);
			unregisterReceiver(cancelNotifyReceiver);

			TelephonyManager tm = (TelephonyManager)getSystemService(TELEPHONY_SERVICE);
			tm.listen(mPhoneListener, 0);

			CancelNotification();

			if (mGeneralFX != null)
				mGeneralFX.release();
			mGeneralFX = null;

			Log.i("ViPER4Android", "Service destroyed.");
		}
		catch(Exception e)
		{
			CancelNotification();
		}
	}

	@Override
	public IBinder onBind(Intent intent)
	{
		return mBinder;
	}

	public boolean GetServicePrepared()
	{
		return mServicePrepared;
	}

	public boolean GetDriverIsReady()
	{
		return mDriverIsReady;
	}

	public void StartStatusUpdating()
	{
		if (mGeneralFX != null && mDriverIsReady)
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SET_UPDATE_STATUS, 1);
	}

	public void StopStatusUpdating()
	{
		if (mGeneralFX != null && mDriverIsReady)
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SET_UPDATE_STATUS, 0);
	}

	public String GetDriverVersion()
	{
		int nVerDWord = 0;
		if (mGeneralFX != null && mDriverIsReady)
			nVerDWord = mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_DRIVER_VERSION);
		int VMain, VSub, VExt, VBuild;
		VMain  = (nVerDWord & 0xFF000000) >> 24;
		VSub   = (nVerDWord & 0x00FF0000) >> 16;
		VExt   = (nVerDWord & 0x0000FF00) >>  8;
		VBuild = (nVerDWord & 0x000000FF) >>  0;
		return VMain + "." + VSub + "." + VExt + "." + VBuild;
	}

	public boolean GetDriverNEON()
	{
		boolean bResult = false;
		if (mGeneralFX != null && mDriverIsReady)
		{
			if (mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_NEONENABLED) == 1)
				bResult = true;
		}
		return bResult;
	}

	public boolean GetDriverEnabled()
	{
		boolean bResult = false;
		if (mGeneralFX != null && mDriverIsReady)
		{
			if (mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_ENABLED) == 1)
				bResult = true;
		}
		return bResult;
	}

	public boolean GetDriverUsable()
	{
		boolean bResult = false;
		if (mGeneralFX != null && mDriverIsReady)
		{
			if (mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_CONFIGURE) == 1)
				bResult = true;
		}
		return bResult;
	}

	public boolean GetDriverProcess()
	{
		boolean bResult = false;
		if (mGeneralFX != null && mDriverIsReady)
		{
			if (mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_STREAMING) == 1)
				bResult = true;
		}
		return bResult;
	}

	public int GetDriverEffectType()
	{
		int nResult = V4A_FX_TYPE_NONE;
		if (mGeneralFX != null && mDriverIsReady)
			nResult = mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_EFFECT_TYPE);
		return nResult;
	}

	public int GetDriverSamplingRate()
	{
		int nResult = 0;
		if (mGeneralFX != null && mDriverIsReady)
			nResult = mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_SAMPLINGRATE);
		return nResult;
	}

	public int GetDriverChannels()
	{
		int nResult = 0;
		if (mGeneralFX != null && mDriverIsReady)
			nResult = mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_CHANNELS);
		return nResult;
	}

	public boolean GetConvolverUsable()
	{
		boolean bResult = false;
		if (mGeneralFX != null && mDriverIsReady)
		{
			if (mGeneralFX.getParameter_px4_vx4x1(PARAM_GET_CONVUSABLE) == 1)
				bResult = true;
		}
		return bResult;
	}

	protected void SetV4AEqualizerBandLevel(int idx, int level, boolean hpfx, V4ADSPModule dsp)
	{
		if (dsp == null || !mDriverIsReady) return;
		if (hpfx) dsp.setParameter_px4_vx4x2(PARAM_HPFX_FIREQ_BANDLEVEL, idx, level);
		else dsp.setParameter_px4_vx4x2(PARAM_SPKFX_FIREQ_BANDLEVEL, idx, level);
	}

	protected void updateDspSystem()
	{
		final String mode;

		if (inCall) mode = "disable";
		else
		{
			SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
			String szLockedEffect = prefSettings.getString("viper4android.settings.lock_effect", "none");
			if (szLockedEffect.equalsIgnoreCase("none"))
			{
				if (mAudioManager.isBluetoothA2dpOn()) mode = "bluetooth";
				else mode = useHeadphone ? "headset" : "speaker";
			}
			else mode = szLockedEffect;
		}

		int nFXType = V4A_FX_TYPE_NONE;
		if (mode.equalsIgnoreCase("headset") || mode.equalsIgnoreCase("bluetooth"))
			nFXType = V4A_FX_TYPE_HEADPHONE;
		else if (mode.equalsIgnoreCase("speaker"))
			nFXType = V4A_FX_TYPE_SPEAKER;

		if (!mode.equalsIgnoreCase(mPreviousMode))
		{
			mPreviousMode = mode;
			if (mode.equalsIgnoreCase("headset"))
				ShowNotification(getString(getResources().getIdentifier("text_headset", "string", getApplicationInfo().packageName)));
			else if (mode.equalsIgnoreCase("bluetooth"))
				ShowNotification(getString(getResources().getIdentifier("text_bluetooth", "string", getApplicationInfo().packageName)));
			else ShowNotification(getString(getResources().getIdentifier("text_speaker", "string", getApplicationInfo().packageName)));
		}

		SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + mode, 0);	
		Log.i("ViPER4Android", "Begin system update(" + mode + ")");

		if ((mGeneralFX == null) || (mGeneralFX.mInstance == null) || (!mDriverIsReady))
		{
			Log.i("ViPER4Android", "updateSystem(): Effects is invalid!");
			return;
		}

		AudioEffect.Descriptor mFXVerify = mGeneralFX.mInstance.getDescriptor();
		if (mFXVerify == null)
		{
			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			return;
		}
		if (!mFXVerify.uuid.equals(ID_V4A_GENERAL_FX))
		{
			Toast.makeText(HeadsetService.this,
					getString(getResources().getIdentifier("text_token_lost", "string", getApplicationInfo().packageName)),
					Toast.LENGTH_LONG).show();

			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			Log.i("ViPER4Android", "updateSystem(): The effect has been replaced by system!");
			Log.i("ViPER4Android", "updateSystem(): Reloading driver");
			try
			{
				mGeneralFX.release();
				mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, 0);
				if ((mGeneralFX == null) || (mGeneralFX.mInstance == null)) return;
			}
			catch (Exception e)
			{
				return;
			}
		}
		if (!mGeneralFX.mInstance.hasControl())
		{
			Toast.makeText(HeadsetService.this,
					getString(getResources().getIdentifier("text_token_lost", "string", getApplicationInfo().packageName)),
					Toast.LENGTH_LONG).show();

			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			Log.i("ViPER4Android", "updateSystem(): The effect has been taken over by system!");
			Log.i("ViPER4Android", "updateSystem(): Reloading driver");
			try
			{
				mGeneralFX.release();
				mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, 0);
				if ((mGeneralFX == null) || (mGeneralFX.mInstance == null)) return;
			}
			catch (Exception e)
			{
				return;
			}
		}

		Log.i("ViPER4Android", "updateSystem(): Commiting effects type");
		mGeneralFX.setParameter_px4_vx4x1(PARAM_FX_TYPE_SWITCH, nFXType);

		/******************************************** Headphone FX ********************************************/
		if (nFXType == V4A_FX_TYPE_HEADPHONE)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting headphone-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
			for (short i = 0; i < levels.length; i ++)
				SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), true, mGeneralFX);
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			mGeneralFX.setParameter_px4_vxString(PARAM_HPFX_CONV_UPDATEKERNEL_DEPRECATED, preferences.getString("viper4android.headphonefx.convolver.kernel", ""));
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 0);

			/* Colorful Music (ViPER's Headphone 360) */
			Log.i("ViPER4Android", "updateSystem(): Updating Field Surround (Colorful Music).");
			String[] cmParameter = preferences.getString("viper4android.headphonefx.colorfulmusic.coeffs", "120;200").split(";");
			if (cmParameter.length == 2)
			{
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_WIDENING, Integer.valueOf(cmParameter[0]));
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_DEPTH, Integer.valueOf(cmParameter[1]));
			}
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_MIDIMAGE, Integer.valueOf(preferences.getString("viper4android.headphonefx.colorfulmusic.midimage", "150")));
			if (preferences.getBoolean("viper4android.headphonefx.colorfulmusic.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 0);

			/* Diff Surround */
			Log.i("ViPER4Android", "updateSystem(): Updating Diff Surround.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_DELAYTIME, Integer.valueOf(preferences.getString("viper4android.headphonefx.diffsurr.delay", "500")));
			if (preferences.getBoolean("viper4android.headphonefx.diffsurr.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 0);

			/* ViPER's Headphone Surround Engine + */
			Log.i("ViPER4Android", "updateSystem(): Updating ViPER's Headphone Surround Engine +.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_EFFECT_LEVEL, Integer.valueOf(preferences.getString("viper4android.headphonefx.vhs.qual", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.vhs.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 0);

			/* Playback Auto Gain Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Playback AGC.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 0);

			/* Dynamic System */
			Log.i("ViPER4Android", "updateSystem(): Updating Dynamic System.");
			String[] dsParameter = preferences.getString("viper4android.headphonefx.dynamicsystem.coeffs", "100;5600;40;40;50;50").split(";");
			if (dsParameter.length == 6)
			{
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_XCOEFFS, Integer.valueOf(dsParameter[0]), Integer.valueOf(dsParameter[1]));
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_YCOEFFS, Integer.valueOf(dsParameter[2]), Integer.valueOf(dsParameter[3]));
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_SIDEGAIN, Integer.valueOf(dsParameter[4]), Integer.valueOf(dsParameter[5]));
			}
			int dsBass = Integer.valueOf(preferences.getString("viper4android.headphonefx.dynamicsystem.bass", "0"));
			dsBass = (dsBass * 20) + 100;
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_BASSGAIN, dsBass);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.tube", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 0);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 0);

			/* Fidelity Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Fidelity Control.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.mode", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_SPEAKER, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.freq", "40")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_BASSGAIN, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.bass.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 0);
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.mode", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_CLARITY, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.clarity.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 0);

			/* Cure System */
			Log.i("ViPER4Android", "updateSystem(): Updating Cure System.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_CROSSFEED, Integer.valueOf(preferences.getString("viper4android.headphonefx.cure.crossfeed", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.cure.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_PAN, Integer.valueOf(preferences.getString("viper4android.headphonefx.channelpan", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.headphonefx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.headphonefx.enable", false);
			mGeneralFX.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/
		/********************************************* Speaker FX *********************************************/
		else if (nFXType == V4A_FX_TYPE_SPEAKER)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting speaker-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
			for (short i = 0; i < levels.length; i ++)
				SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), false, mGeneralFX);
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			mGeneralFX.setParameter_px4_vxString(PARAM_SPKFX_CONV_UPDATEKERNEL_DEPRECATED, preferences.getString("viper4android.headphonefx.convolver.kernel", ""));
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 0);

			/* eXtraLoud */
			Log.i("ViPER4Android", "updateSystem(): Updating eXtraLoud.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.speakerfx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.speakerfx.enable", false);
			mGeneralFX.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/
		
		Log.i("ViPER4Android", "System updated.");
	}

	protected void updateDspSystem(String mode)
	{
		if (!mode.equalsIgnoreCase("disable"))
		{
			SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
			String szLockedEffect = prefSettings.getString("viper4android.settings.lock_effect", "none");
			if (!szLockedEffect.equalsIgnoreCase("none")) mode = szLockedEffect;
		}

		int nFXType = V4A_FX_TYPE_NONE;
		if (mode.equalsIgnoreCase("headset") || mode.equalsIgnoreCase("bluetooth"))
			nFXType = V4A_FX_TYPE_HEADPHONE;
		else if (mode.equalsIgnoreCase("speaker"))
			nFXType = V4A_FX_TYPE_SPEAKER;

		if (!mode.equalsIgnoreCase(mPreviousMode))
		{
			mPreviousMode = mode;
			if (mode.equalsIgnoreCase("headset"))
				ShowNotification(getString(getResources().getIdentifier("text_headset", "string", getApplicationInfo().packageName)));
			else if (mode.equalsIgnoreCase("bluetooth"))
				ShowNotification(getString(getResources().getIdentifier("text_bluetooth", "string", getApplicationInfo().packageName)));
			else ShowNotification(getString(getResources().getIdentifier("text_speaker", "string", getApplicationInfo().packageName)));
		}

		SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + mode, 0);	
		Log.i("ViPER4Android", "Begin system update(" + mode + ")");

		if ((mGeneralFX == null) || (mGeneralFX.mInstance == null) || (!mDriverIsReady))
		{
			Log.i("ViPER4Android", "updateSystem(): Effects is invalid!");
			return;
		}

		AudioEffect.Descriptor mFXVerify = mGeneralFX.mInstance.getDescriptor();
		if (mFXVerify == null)
		{
			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			return;
		}
		if (!mFXVerify.uuid.equals(ID_V4A_GENERAL_FX))
		{
			Toast.makeText(HeadsetService.this,
					getString(getResources().getIdentifier("text_token_lost", "string", getApplicationInfo().packageName)),
					Toast.LENGTH_LONG).show();

			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			Log.i("ViPER4Android", "updateSystem(): The effects has been replaced by system!");
			Log.i("ViPER4Android", "updateSystem(): Reloading driver");
			try
			{
				mGeneralFX.release();
				mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, 0);
				if ((mGeneralFX == null) || (mGeneralFX.mInstance == null)) return;
			}
			catch (Exception e)
			{
				return;
			}
		}
		if (!mGeneralFX.mInstance.hasControl())
		{
			Toast.makeText(HeadsetService.this,
					getString(getResources().getIdentifier("text_token_lost", "string", getApplicationInfo().packageName)),
					Toast.LENGTH_LONG).show();

			Log.i("ViPER4Android", "updateSystem(): Effects token lost!");
			Log.i("ViPER4Android", "updateSystem(): The effects has been taken over by system!");
			Log.i("ViPER4Android", "updateSystem(): Reloading driver");
			try
			{
				mGeneralFX.release();
				mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, 0);
				if ((mGeneralFX == null) || (mGeneralFX.mInstance == null)) return;
			}
			catch (Exception e)
			{
				return;
			}
		}

		Log.i("ViPER4Android", "updateSystem(): Commiting effects type");
		mGeneralFX.setParameter_px4_vx4x1(PARAM_FX_TYPE_SWITCH, nFXType);

		/******************************************** Headphone FX ********************************************/
		if (nFXType == V4A_FX_TYPE_HEADPHONE)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting headphone-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
			for (short i = 0; i < levels.length; i ++)
				SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), true, mGeneralFX);
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			mGeneralFX.setParameter_px4_vxString(PARAM_HPFX_CONV_UPDATEKERNEL_DEPRECATED, preferences.getString("viper4android.headphonefx.convolver.kernel", ""));
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 0);

			/* Colorful Music (ViPER's Headphone 360) */
			Log.i("ViPER4Android", "updateSystem(): Updating Field Surround (Colorful Music).");
			String[] cmParameter = preferences.getString("viper4android.headphonefx.colorfulmusic.coeffs", "120;200").split(";");
			if (cmParameter.length == 2)
			{
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_WIDENING, Integer.valueOf(cmParameter[0]));
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_DEPTH, Integer.valueOf(cmParameter[1]));
			}
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_MIDIMAGE, Integer.valueOf(preferences.getString("viper4android.headphonefx.colorfulmusic.midimage", "150")));
			if (preferences.getBoolean("viper4android.headphonefx.colorfulmusic.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 0);

			/* Diff Surround */
			Log.i("ViPER4Android", "updateSystem(): Updating Diff Surround.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_DELAYTIME, Integer.valueOf(preferences.getString("viper4android.headphonefx.diffsurr.delay", "500")));
			if (preferences.getBoolean("viper4android.headphonefx.diffsurr.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 0);

			/* ViPER's Headphone Surround Engine + */
			Log.i("ViPER4Android", "updateSystem(): Updating ViPER's Headphone Surround Engine +.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_EFFECT_LEVEL, Integer.valueOf(preferences.getString("viper4android.headphonefx.vhs.qual", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.vhs.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 0);

			/* Playback Auto Gain Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Playback AGC.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 0);

			/* Dynamic System */
			Log.i("ViPER4Android", "updateSystem(): Updating Dynamic System.");
			String[] dsParameter = preferences.getString("viper4android.headphonefx.dynamicsystem.coeffs", "100;5600;40;40;50;50").split(";");
			if (dsParameter.length == 6)
			{
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_XCOEFFS, Integer.valueOf(dsParameter[0]), Integer.valueOf(dsParameter[1]));
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_YCOEFFS, Integer.valueOf(dsParameter[2]), Integer.valueOf(dsParameter[3]));
				mGeneralFX.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_SIDEGAIN, Integer.valueOf(dsParameter[4]), Integer.valueOf(dsParameter[5]));
			}
			int dsBass = Integer.valueOf(preferences.getString("viper4android.headphonefx.dynamicsystem.bass", "0"));
			dsBass = (dsBass * 20) + 100;
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_BASSGAIN, dsBass);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.tube", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 0);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 0);

			/* Fidelity Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Fidelity Control.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.mode", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_SPEAKER, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.freq", "40")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_BASSGAIN, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.bass.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 0);
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.mode", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_CLARITY, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.clarity.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 0);

			/* Cure System */
			Log.i("ViPER4Android", "updateSystem(): Updating Cure System.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_CROSSFEED, Integer.valueOf(preferences.getString("viper4android.headphonefx.cure.crossfeed", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.cure.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_PAN, Integer.valueOf(preferences.getString("viper4android.headphonefx.channelpan", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_HPFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.headphonefx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.headphonefx.enable", false);
			mGeneralFX.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/
		/********************************************* Speaker FX *********************************************/
		else if (nFXType == V4A_FX_TYPE_SPEAKER)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting speaker-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
			for (short i = 0; i < levels.length; i ++)
				SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), false, mGeneralFX);
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			mGeneralFX.setParameter_px4_vxString(PARAM_SPKFX_CONV_UPDATEKERNEL_DEPRECATED, preferences.getString("viper4android.headphonefx.convolver.kernel", ""));
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 0);

			/* eXtraLoud */
			Log.i("ViPER4Android", "updateSystem(): Updating eXtraLoud.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 1);
			else mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			mGeneralFX.setParameter_px4_vx4x1(PARAM_SPKFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.speakerfx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.speakerfx.enable", false);
			mGeneralFX.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/
		
		Log.i("ViPER4Android", "System updated.");
	}
}
