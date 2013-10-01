package com.vipercn.viper4android_v2.service;

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;
import java.util.concurrent.Semaphore;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.bluetooth.BluetoothA2dp;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.media.AudioManager;
import android.media.audiofx.AudioEffect;
import android.os.Binder;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import android.util.SparseArray;
import android.widget.Toast;

import com.vipercn.viper4android_v2.activity.V4AJniInterface;
import com.vipercn.viper4android_v2.activity.ViPER4Android;

public class ViPER4AndroidService extends Service
{
	private class ResourceMutex
	{
		private Semaphore mSignal = new Semaphore(1);

		public boolean acquire()
		{
			try
			{
				mSignal.acquire();
				return true;
			}
			catch (InterruptedException e)
			{
				return false;
			}
		}

		public void release()
		{
			mSignal.release();
		}
	}

	private class V4ADSPModule
	{
		private final UUID EFFECT_TYPE_NULL = UUID.fromString("ec7178ec-e5e1-4432-a3f4-4657e6795210");
		public AudioEffect mInstance = null;

		public V4ADSPModule(UUID uModuleID, int nAudioSession)
		{
			try
			{
				mInstance = AudioEffect.class.getConstructor(UUID.class, UUID.class, Integer.TYPE, Integer.TYPE).newInstance(EFFECT_TYPE_NULL, uModuleID, 0, nAudioSession);
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

		@SuppressWarnings("unused")  /* For future use */
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

		public void setParameter_px4_vx2x8192(int param, int valueL, int dataLength, byte[] byteData)
		{
			try
			{
				byte[] p = intToByteArray(param);
				byte[] vL = intToByteArray(valueL);
				byte[] vH = intToByteArray(dataLength);
				byte[] v = concatArrays(vL, vH, byteData);
				if (v.length < 8192)
				{
					int zeroPad = 8192 - v.length;
					byte[] zeroArray = new byte[zeroPad];
					v = concatArrays(v, zeroArray);
				}
				setParameter_Native(p, v);
			}
			catch (Exception e)
			{
				Log.i("ViPER4Android", "setParameter_px4_vx2x8192: " + e.getMessage());
			}
		}

		@SuppressWarnings("unused")  /* For future use */
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

		private void ProceedIRBuffer_Speaker(String szConvIRFile, int nChannels, int nFrames, int nBytes)
		{
			// 1. Tell driver to prepare kernel buffer
			Random rndMachine = new Random(System.currentTimeMillis());
			int nKernelBufferID = rndMachine.nextInt();
			setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, nKernelBufferID, nChannels, 0);

			// 2. Read entire ir data and get hash code
			byte[] baKernelData = V4AJniInterface.ReadImpulseResponseToArray(szConvIRFile);
			if (baKernelData == null)
			{
				// Read failed
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baKernelData.length <= 0)
			{
				// Empty ir file
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			int[] baHashCode = V4AJniInterface.GetHashImpulseResponseArray(baKernelData);
			if (baHashCode == null)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baHashCode.length != 2)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baHashCode[0] == 0)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			int nHashCode = baHashCode[1];

			Log.i("ViPER4Android", "[Kernel] Channels = " + nChannels + ", Frames = " + nFrames + ", Bytes = " + baKernelData.length + ", Hash = " + nHashCode);

			// 3. Split kernel data and send to driver
			int nBlockSize = 8184;  /* 8192(packet size) - sizeof(int) - sizeof(int), 8184 bytes = 2046 float samples = 1023 stereo frames */
			int nRestBytes = baKernelData.length, nSendOffset = 0;
			while (nRestBytes > 0)
			{
				int nMinBlockSize = Math.min(nBlockSize, nRestBytes);
				byte[] baSendData = new byte[nMinBlockSize];
				System.arraycopy(baKernelData, nSendOffset, baSendData, 0, nMinBlockSize);
				nSendOffset += nMinBlockSize;
				nRestBytes -= nMinBlockSize;
				// Send to driver
				int nFramesCount = nMinBlockSize / 4;  /* sizeof(float) = 4 */
				setParameter_px4_vx2x8192(ViPER4AndroidService.PARAM_SPKFX_CONV_SETBUFFER, nKernelBufferID, nFramesCount, baSendData);
			}

			// 4. Tell driver to commit kernel buffer
			setParameter_px4_vx4x2(ViPER4AndroidService.PARAM_SPKFX_CONV_COMMITBUFFER, nKernelBufferID, nHashCode);
		}
		private void ProceedIRBuffer_Headphone(String szConvIRFile, int nChannels, int nFrames, int nBytes)
		{
			// 1. Tell driver to prepare kernel buffer
			Random rndMachine = new Random(System.currentTimeMillis());
			int nKernelBufferID = rndMachine.nextInt();
			setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, nKernelBufferID, nChannels, 0);

			// 2. Read entire ir data and get hash code
			byte[] baKernelData = V4AJniInterface.ReadImpulseResponseToArray(szConvIRFile);
			if (baKernelData == null)
			{
				// Read failed
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baKernelData.length <= 0)
			{
				// Empty ir file
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			int[] baHashCode = V4AJniInterface.GetHashImpulseResponseArray(baKernelData);
			if (baHashCode == null)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baHashCode.length != 2)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			if (baHashCode[0] == 0)
			{
				// Wrong with hash
				setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				return;
			}
			int nHashCode = baHashCode[1];

			Log.i("ViPER4Android", "[Kernel] Channels = " + nChannels + ", Frames = " + nFrames + ", Bytes = " + baKernelData.length + ", Hash = " + nHashCode);

			// 3. Split kernel data and send to driver
			int nBlockSize = 8184;  /* 8192(packet size) - sizeof(int) - sizeof(int), 8184 bytes = 2046 float samples = 1023 stereo frames */
			int nRestBytes = baKernelData.length, nSendOffset = 0, nPacketIndex = 0;
			while (nRestBytes > 0)
			{
				int nMinBlockSize = Math.min(nBlockSize, nRestBytes);
				byte[] baSendData = new byte[nMinBlockSize];
				System.arraycopy(baKernelData, nSendOffset, baSendData, 0, nMinBlockSize);
				nSendOffset += nMinBlockSize;
				nRestBytes -= nMinBlockSize;
				Log.i("ViPER4Android", "Setting kernel buffer, index = " + nPacketIndex + ", length = " + nMinBlockSize);
				nPacketIndex++;
				// Send to driver
				int nFramesCount = nMinBlockSize / 4;  /* sizeof(float) = 4 */
				setParameter_px4_vx2x8192(ViPER4AndroidService.PARAM_HPFX_CONV_SETBUFFER, nKernelBufferID, nFramesCount, baSendData);
			}

			// 4. Tell driver to commit kernel buffer
			setParameter_px4_vx4x2(ViPER4AndroidService.PARAM_HPFX_CONV_COMMITBUFFER, nKernelBufferID, nHashCode);
		}

		public void SetConvIRFile(String szConvIRFile, boolean bSpeakerParam)
		{
			/* Commit irs when called here
			 * driver holds a current irs hash
			 * so we just ignore the same irs commited more times
			 */

			if (szConvIRFile == null)
			{
				Log.i("ViPER4Android", "Clear convolver kernel");
				// Clear convolver ir file
				if (bSpeakerParam) setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
				else setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
			}
			else
			{
				Log.i("ViPER4Android", "Convolver kernel = " + szConvIRFile);

				// Set convolver ir file
				if (szConvIRFile.equals(""))
				{
					Log.i("ViPER4Android", "Clear convolver kernel");
					// Clear convolver ir file
					if (bSpeakerParam) setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER, 0, 0, 1);
					else setParameter_px4_vx4x3(ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER, 0, 0, 1);
				}
				else
				{
					int nCommand = ViPER4AndroidService.PARAM_HPFX_CONV_PREPAREBUFFER;
					if (bSpeakerParam) nCommand = ViPER4AndroidService.PARAM_SPKFX_CONV_PREPAREBUFFER;

					// Get ir file info
					int[] iaIRInfo = V4AJniInterface.GetImpulseResponseInfoArray(szConvIRFile);
					if (iaIRInfo == null) setParameter_px4_vx4x3(nCommand, 0, 0, 1);
					else
					{
						if (iaIRInfo.length != 4) setParameter_px4_vx4x3(nCommand, 0, 0, 1);
						else
						{
							if (iaIRInfo[0] == 0) setParameter_px4_vx4x3(nCommand, 0, 0, 1);
							else
							{
								/* Proceed buffer */
								if (bSpeakerParam) ProceedIRBuffer_Speaker(szConvIRFile, iaIRInfo[1], iaIRInfo[2], iaIRInfo[3]);
								else ProceedIRBuffer_Headphone(szConvIRFile, iaIRInfo[1], iaIRInfo[2], iaIRInfo[3]);
							}
						}
					}
				}
			}
		}
	}

	public class LocalBinder extends Binder
	{
		public ViPER4AndroidService getService()
		{
			return ViPER4AndroidService.this;
		}
	}

	public static final UUID ID_V4A_GENERAL_FX = UUID.fromString("41d3c987-e6cf-11e3-a88a-11aba5d5c51b");
	public static final int DEVICE_GLOBAL_OUTPUT_MIXER = 0;

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

	private final LocalBinder mBinder = new LocalBinder();
	protected boolean mUseHeadset = false;
	protected boolean mUseBluetooth = false;
	protected boolean mUseUSBSoundCard = false;
	protected String mPreviousMode = "none";
	private float[] mOverriddenEqualizerLevels;

	private boolean mServicePrepared = false;
	private boolean mDriverIsReady = false;
	private V4ADSPModule mGeneralFX = null;
	private SparseArray<V4ADSPModule> mGeneralFXList = new SparseArray<V4ADSPModule>();
	private ResourceMutex mV4AMutex = new ResourceMutex();

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
	    			updateSystem(false);
	    		}
	    	}
	    }
	};

    private final BroadcastReceiver mAudioSessionReceiver = new BroadcastReceiver()
    {
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "mAudioSessionReceiver::onReceive()");

			SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
			String szCompatibleMode = prefSettings.getString("viper4android.settings.compatiblemode", "global");
			boolean mFXInLocalMode = false;
			if (szCompatibleMode.equals("global")) mFXInLocalMode = false;
			else mFXInLocalMode = true;

			String action = intent.getAction();
			int sessionId = intent.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, 0);
			if (sessionId == 0)
			{
				Log.i("ViPER4Android", "Global output mixer session control received! ");
				return;
			}

			if (action.equals(AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION))
			{
				Log.i("ViPER4Android", String.format("New audio session: %d", sessionId));
				if (!mFXInLocalMode)
				{
					Log.i("ViPER4Android", "Only global effect allowed.");
					return;
				}
				if (mV4AMutex.acquire())
				{
					if (mGeneralFXList.indexOfKey(sessionId) < 0)
					{
						Log.i("ViPER4Android", "Creating local V4ADSPModule ...");
						mGeneralFXList.put(sessionId, new V4ADSPModule(ID_V4A_GENERAL_FX, sessionId));
					}
					mV4AMutex.release();
				}
				else Log.i("ViPER4Android", "Semaphore accquire failed.");
			}

			if (action.equals(AudioEffect.ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION))
			{
				Log.i("ViPER4Android", String.format("Audio session removed: %d", sessionId));
				if (mV4AMutex.acquire())
				{
					if (mGeneralFXList.indexOfKey(sessionId) >= 0)
					{
						V4ADSPModule v4aRemove = mGeneralFXList.get(sessionId);
						mGeneralFXList.remove(sessionId);
						if (v4aRemove != null)
							v4aRemove.release();
					}
					mV4AMutex.release();
				}
				else Log.i("ViPER4Android", "Semaphore accquire failed.");
			}

			updateSystem(false);
		}
	};

	private final BroadcastReceiver mPreferenceUpdateReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "mPreferenceUpdateReceiver::onReceive()");
			updateSystem(false);
		}
	};

	private final BroadcastReceiver mShowNotifyReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "mShowNotifyReceiver::onReceive()");

			String mode = getAudioOutputRouting();
			if (mode.equalsIgnoreCase("headset"))
				ShowNotification(getString(getResources().getIdentifier("text_headset", "string", getApplicationInfo().packageName)));
			else if (mode.equalsIgnoreCase("bluetooth"))
				ShowNotification(getString(getResources().getIdentifier("text_bluetooth", "string", getApplicationInfo().packageName)));
			else ShowNotification(getString(getResources().getIdentifier("text_speaker", "string", getApplicationInfo().packageName)));
		}
	};

	private final BroadcastReceiver mCancelNotifyReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(Context context, Intent intent)
		{
			Log.i("ViPER4Android", "mCancelNotifyReceiver::onReceive()");
			CancelNotification();
		}
	};

	private final BroadcastReceiver mScreenOnReceiver = new BroadcastReceiver()
	{  
		@Override  
		public void onReceive(final Context context, final Intent intent)
		{
			Log.i("ViPER4Android", "mScreenOnReceiver::onReceive()");
			/* Nothing to do here, for now */
		}
	};

	private final BroadcastReceiver mRoutingReceiver = new BroadcastReceiver()
	{
		@Override
		public void onReceive(final Context context, final Intent intent)
		{
			Log.i("ViPER4Android", "mRoutingReceiver::onReceive()");

			final String action = intent.getAction();
            final boolean prevUseHeadset = mUseHeadset;
            final boolean prevUseBluetooth = mUseBluetooth;
            final boolean prevUseUSB = mUseUSBSoundCard;

            if (action.equals(Intent.ACTION_HEADSET_PLUG))
            {
                mUseHeadset = intent.getIntExtra("state", 0) == 1;
            }
            else if (action.equals(BluetoothA2dp.ACTION_CONNECTION_STATE_CHANGED))
            {
                int state = intent.getIntExtra(BluetoothA2dp.EXTRA_STATE, BluetoothA2dp.STATE_DISCONNECTED);
                mUseBluetooth = state == BluetoothA2dp.STATE_CONNECTED;
            }
            else
            {
            	if (Build.VERSION.SDK_INT >= 16)
            	{
            		// Equals Intent.ACTION_ANALOG_AUDIO_DOCK_PLUG
            		if (action.equals("android.intent.action.ANALOG_AUDIO_DOCK_PLUG"))
            			mUseUSBSoundCard = intent.getIntExtra("state", 0) == 1;
            	}
            }

            Log.i("ViPER4Android", "Headset=" + mUseHeadset + ", Bluetooth=" + mUseBluetooth + ", USB=" + mUseUSBSoundCard);
			if (prevUseHeadset != mUseHeadset || prevUseBluetooth != mUseBluetooth || prevUseUSB != mUseUSBSoundCard)
			{
				/* Audio output method changed, so we flush buffer */
				updateSystem(true);
			}
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
        CharSequence contentTitle = "ViPER4Android FX", contentText = nFXType;
        Intent notificationIntent = new Intent(ViPER4AndroidService.this, ViPER4Android.class);
        PendingIntent contentItent = PendingIntent.getActivity(ViPER4AndroidService.this, 0, notificationIntent, 0);

		Notification v4aNotify = new Notification.Builder(ViPER4AndroidService.this)
			.setAutoCancel(false)
			.setOngoing(true)
			.setDefaults(0)
			.setWhen(System.currentTimeMillis())
			.setSmallIcon(nIconID)
			.setTicker(szNotifyText)
			.setContentTitle(contentTitle)
			.setContentText(contentText)
			.setContentIntent(contentItent)
			.getNotification();

        NotificationManager notificationManager = (NotificationManager)getSystemService(android.content.Context.NOTIFICATION_SERVICE);
        notificationManager.notify(0x1234, v4aNotify);
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
					mGeneralFX = new V4ADSPModule(ID_V4A_GENERAL_FX, DEVICE_GLOBAL_OUTPUT_MIXER);
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

			if (mDriverIsReady)
			{
				SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", 0);
				boolean bDriverConfigured = prefSettings.getBoolean("viper4android.settings.driverconfigured", false);
				if (!bDriverConfigured)
				{
					Editor edPrefSettings = prefSettings.edit();
					if (edPrefSettings != null)
					{
						edPrefSettings.putBoolean("viper4android.settings.driverconfigured", true);
						edPrefSettings.commit();
					}
				}
			}

			if (Build.VERSION.SDK_INT < 18)
				startForeground(ViPER4Android.NOTIFY_FOREGROUND_ID, new Notification());

			IntentFilter audioSessionFilter = new IntentFilter();
			audioSessionFilter.addAction(AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION);
			audioSessionFilter.addAction(AudioEffect.ACTION_CLOSE_AUDIO_EFFECT_CONTROL_SESSION);
			registerReceiver(mAudioSessionReceiver, audioSessionFilter);

			final IntentFilter screenFilter = new IntentFilter();
			screenFilter.addAction(Intent.ACTION_SCREEN_ON);
		    registerReceiver(mScreenOnReceiver, screenFilter);

			final IntentFilter audioFilter = new IntentFilter();
			audioFilter.addAction(Intent.ACTION_HEADSET_PLUG);
			if (Build.VERSION.SDK_INT >= 16)
			{
				// Equals Intent.ACTION_ANALOG_AUDIO_DOCK_PLUG
				audioFilter.addAction("android.intent.action.ANALOG_AUDIO_DOCK_PLUG");
			}
			audioFilter.addAction(BluetoothA2dp.ACTION_CONNECTION_STATE_CHANGED);
			audioFilter.addAction(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
			registerReceiver(mRoutingReceiver, audioFilter);

			registerReceiver(mPreferenceUpdateReceiver, new IntentFilter(ViPER4Android.ACTION_UPDATE_PREFERENCES));
			registerReceiver(mShowNotifyReceiver, new IntentFilter(ViPER4Android.ACTION_SHOW_NOTIFY));
			registerReceiver(mCancelNotifyReceiver, new IntentFilter(ViPER4Android.ACTION_CANCEL_NOTIFY));

			Log.i("ViPER4Android", "Service launched.");

			updateSystem(true);
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

			if (Build.VERSION.SDK_INT < 18)
				stopForeground(true);

			unregisterReceiver(mAudioSessionReceiver);
			unregisterReceiver(mScreenOnReceiver);
			unregisterReceiver(mRoutingReceiver);
			unregisterReceiver(mPreferenceUpdateReceiver);
			unregisterReceiver(mShowNotifyReceiver);
			unregisterReceiver(mCancelNotifyReceiver);

			CancelNotification();

			if (mGeneralFX != null)
				mGeneralFX.release();
			mGeneralFX = null;

			Log.i("ViPER4Android", "Service destroyed.");
		}
		catch (Exception e)
		{
			CancelNotification();
		}
	}

	@Override
	public IBinder onBind(Intent intent)
	{
		return mBinder;
	}

	public void setEqualizerLevels(float[] levels)
	{
		mOverriddenEqualizerLevels = levels;
		updateSystem(false);
	}

	public String getAudioOutputRouting()
	{
		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
		String szLockedEffect = prefSettings.getString("viper4android.settings.lock_effect", "none");
		if (szLockedEffect.equalsIgnoreCase("none"))
		{
			if (mUseBluetooth) return "bluetooth";
			if (mUseHeadset) return "headset";
			if (mUseUSBSoundCard) return "headset";  /* We treat usb as headphone for now */
			return "speaker";
		}
		return szLockedEffect;
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

	protected void updateSystem(boolean bRequireReset)
	{
		String mode = getAudioOutputRouting();
		SharedPreferences preferences = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + "." + mode, 0);
		Log.i("ViPER4Android", "Begin system update(" + mode + ")");

		int nFXType = V4A_FX_TYPE_NONE;
		if (mode.equalsIgnoreCase("headset") || mode.equalsIgnoreCase("bluetooth")) nFXType = V4A_FX_TYPE_HEADPHONE;
		else if (mode.equalsIgnoreCase("speaker")) nFXType = V4A_FX_TYPE_SPEAKER;

		if (!mode.equalsIgnoreCase(mPreviousMode))
		{
			mPreviousMode = mode;
			if (mode.equalsIgnoreCase("headset"))
				ShowNotification(getString(getResources().getIdentifier("text_headset", "string", getApplicationInfo().packageName)));
			else if (mode.equalsIgnoreCase("bluetooth"))
				ShowNotification(getString(getResources().getIdentifier("text_bluetooth", "string", getApplicationInfo().packageName)));
			else ShowNotification(getString(getResources().getIdentifier("text_speaker", "string", getApplicationInfo().packageName)));
		}

		SharedPreferences prefSettings = getSharedPreferences(ViPER4Android.SHARED_PREFERENCES_BASENAME + ".settings", MODE_PRIVATE);
		String szCompatibleMode = prefSettings.getString("viper4android.settings.compatiblemode", "global");
		boolean mFXInLocalMode = false;
		if (szCompatibleMode.equals("global")) mFXInLocalMode = false;
		else mFXInLocalMode = true;

		Log.i("ViPER4Android", "<+++++++++++++++ Update global effect +++++++++++++++>");
		updateSystem_Global(preferences, nFXType, bRequireReset, mFXInLocalMode);
		Log.i("ViPER4Android", "<++++++++++++++++++++++++++++++++++++++++++++++++++++>");

		Log.i("ViPER4Android", "<+++++++++++++++ Update local effect +++++++++++++++>");
		updateSystem_Local(preferences, nFXType, bRequireReset, mFXInLocalMode);
		Log.i("ViPER4Android", "<+++++++++++++++++++++++++++++++++++++++++++++++++++>");
	}

	protected void updateSystem_Global(SharedPreferences preferences, int nFXType, boolean bRequireReset, boolean mLocalFX)
	{
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
			Toast.makeText(ViPER4AndroidService.this,
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
			Toast.makeText(ViPER4AndroidService.this,
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

		if (mLocalFX) updateSystem_Module(preferences, nFXType, mGeneralFX, bRequireReset, true);
		else updateSystem_Module(preferences, nFXType, mGeneralFX, bRequireReset, false);
	}

	protected void updateSystem_Local(SharedPreferences preferences, int nFXType, boolean bRequireReset, boolean mLocalFX)
	{
		if (mV4AMutex.acquire())
		{
			List<Integer> v4aUnderControl = new ArrayList<Integer>();
			for (int idx = 0; idx < mGeneralFXList.size(); idx++)
			{
				Integer sessionId = mGeneralFXList.keyAt(idx);
				V4ADSPModule v4aModule = mGeneralFXList.valueAt(idx);
				if ((sessionId < 0) || (v4aModule == null)) continue;
				try
				{
					if (!mLocalFX) updateSystem_Module(preferences, nFXType, v4aModule, bRequireReset, true);
					else updateSystem_Module(preferences, nFXType, v4aModule, bRequireReset, false);
				}
				catch (Exception e)
				{
					Log.i("ViPER4Android", String.format("Trouble trying to manage session %d, removing...", sessionId), e);
					v4aUnderControl.add(sessionId);
					continue;
				}
			}
			for (int idx = 0; idx < v4aUnderControl.size(); idx++)
				mGeneralFXList.remove(v4aUnderControl.get(idx));

			mV4AMutex.release();
		}
		else Log.i("ViPER4Android", "Semaphore accquire failed.");
	}

	protected void updateSystem_Module(SharedPreferences preferences, int nFXType, V4ADSPModule v4aModule, boolean bRequireReset, boolean mMasterSwitchOff)
	{
		Log.i("ViPER4Android", "updateSystem(): Commiting effects type");
		v4aModule.setParameter_px4_vx4x1(PARAM_FX_TYPE_SWITCH, nFXType);

		/******************************************** Headphone FX ********************************************/
		if (nFXType == V4A_FX_TYPE_HEADPHONE)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting headphone-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			if (mOverriddenEqualizerLevels != null)
			{
				for (int i = 0; i < mOverriddenEqualizerLevels.length; i ++)
					SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(mOverriddenEqualizerLevels[i]) * 100), true, v4aModule);
			}
			else
			{
				String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
				for (short i = 0; i < levels.length; i ++)
					SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), true, v4aModule);
			}
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_FIREQ_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			String szConvIRFileName = preferences.getString("viper4android.headphonefx.convolver.kernel", "");
			v4aModule.SetConvIRFile(szConvIRFileName, false);
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_CONV_PROCESS_ENABLED, 0);

			/* Colorful Music (ViPER's Headphone 360) */
			Log.i("ViPER4Android", "updateSystem(): Updating Field Surround (Colorful Music).");
			String[] cmParameter = preferences.getString("viper4android.headphonefx.colorfulmusic.coeffs", "120;200").split(";");
			if (cmParameter.length == 2)
			{
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_COLM_WIDENING, Integer.valueOf(cmParameter[0]));
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_COLM_DEPTH, Integer.valueOf(cmParameter[1]));
			}
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_COLM_MIDIMAGE, Integer.valueOf(preferences.getString("viper4android.headphonefx.colorfulmusic.midimage", "150")));
			if (preferences.getBoolean("viper4android.headphonefx.colorfulmusic.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_COLM_PROCESS_ENABLED, 0);

			/* Diff Surround */
			Log.i("ViPER4Android", "updateSystem(): Updating Diff Surround.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_DELAYTIME, Integer.valueOf(preferences.getString("viper4android.headphonefx.diffsurr.delay", "500")));
			if (preferences.getBoolean("viper4android.headphonefx.diffsurr.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DIFFSURR_PROCESS_ENABLED, 0);

			/* ViPER's Headphone Surround Engine + */
			Log.i("ViPER4Android", "updateSystem(): Updating ViPER's Headphone Surround Engine +.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VHE_EFFECT_LEVEL, Integer.valueOf(preferences.getString("viper4android.headphonefx.vhs.qual", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.vhs.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VHE_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_REVB_PROCESS_ENABLED, 0);

			/* Playback Auto Gain Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Playback AGC.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_AGC_PROCESS_ENABLED, 0);

			/* Dynamic System */
			Log.i("ViPER4Android", "updateSystem(): Updating Dynamic System.");
			String[] dsParameter = preferences.getString("viper4android.headphonefx.dynamicsystem.coeffs", "100;5600;40;40;50;50").split(";");
			if (dsParameter.length == 6)
			{
				v4aModule.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_XCOEFFS, Integer.valueOf(dsParameter[0]), Integer.valueOf(dsParameter[1]));
				v4aModule.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_YCOEFFS, Integer.valueOf(dsParameter[2]), Integer.valueOf(dsParameter[3]));
				v4aModule.setParameter_px4_vx4x2(PARAM_HPFX_DYNSYS_SIDEGAIN, Integer.valueOf(dsParameter[4]), Integer.valueOf(dsParameter[5]));
			}
			int dsBass = Integer.valueOf(preferences.getString("viper4android.headphonefx.dynamicsystem.bass", "0"));
			dsBass = (dsBass * 20) + 100;
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_BASSGAIN, dsBass);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.tube", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_ENABLETUBE, 0);
			if (preferences.getBoolean("viper4android.headphonefx.dynamicsystem.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_DYNSYS_PROCESS_ENABLED, 0);

			/* Fidelity Control */
			Log.i("ViPER4Android", "updateSystem(): Updating Fidelity Control.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.mode", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_SPEAKER, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.freq", "40")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_BASSGAIN, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.bass.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.bass.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERBASS_PROCESS_ENABLED, 0);
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_MODE, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.mode", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_CLARITY, Integer.valueOf(preferences.getString("viper4android.headphonefx.fidelity.clarity.gain", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.fidelity.clarity.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_VIPERCLARITY_PROCESS_ENABLED, 0);

			/* Cure System */
			Log.i("ViPER4Android", "updateSystem(): Updating Cure System.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_CURE_CROSSFEED, Integer.valueOf(preferences.getString("viper4android.headphonefx.cure.crossfeed", "0")));
			if (preferences.getBoolean("viper4android.headphonefx.cure.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_CURE_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_OUTPUT_PAN, Integer.valueOf(preferences.getString("viper4android.headphonefx.channelpan", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_HPFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.headphonefx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.headphonefx.enable", false);
			if (mMasterSwitchOff) bMasterControl = false;
			v4aModule.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/
		/********************************************* Speaker FX *********************************************/
		else if (nFXType == V4A_FX_TYPE_SPEAKER)
		{
			Log.i("ViPER4Android", "updateSystem(): Commiting speaker-fx parameters");

			/* FIR Equalizer */
			Log.i("ViPER4Android", "updateSystem(): Updating FIR Equalizer.");
			if (mOverriddenEqualizerLevels != null)
			{
				for (int i = 0; i < mOverriddenEqualizerLevels.length; i ++)
					SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(mOverriddenEqualizerLevels[i]) * 100), false, v4aModule);
			}
			else
			{
				String[] levels = preferences.getString("viper4android.headphonefx.fireq.custom", "0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;").split(";");
				for (short i = 0; i < levels.length; i ++)
					SetV4AEqualizerBandLevel(i, (int)Math.round(Float.valueOf(levels[i]) * 100), false, v4aModule);
			}
			if (preferences.getBoolean("viper4android.headphonefx.fireq.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_FIREQ_PROCESS_ENABLED, 0);

			/* ViPER's Reverberation */
			Log.i("ViPER4Android", "updateSystem(): Updating Reverberation.");
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_ROOMSIZE, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomsize", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WIDTH, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.roomwidth", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DAMP, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.damp", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_WET, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.wet", "0")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_DRY, Integer.valueOf(preferences.getString("viper4android.headphonefx.reverb.dry", "50")));
			if (preferences.getBoolean("viper4android.headphonefx.reverb.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_REVB_PROCESS_ENABLED, 0);

			/* Convolver */
			Log.i("ViPER4Android", "updateSystem(): Updating Convolver.");
			String szConvIRFileName = preferences.getString("viper4android.headphonefx.convolver.kernel", "");
			v4aModule.SetConvIRFile(szConvIRFileName, true);
			if (preferences.getBoolean("viper4android.headphonefx.convolver.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_CONV_PROCESS_ENABLED, 0);

			/* eXtraLoud */
			Log.i("ViPER4Android", "updateSystem(): Updating eXtraLoud.");
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_RATIO, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.ratio", "50")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.volume", "80")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_MAXSCALER, Integer.valueOf(preferences.getString("viper4android.headphonefx.playbackgain.maxscaler", "400")));
			if (preferences.getBoolean("viper4android.headphonefx.playbackgain.enable", false))
				v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 1);
			else v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_AGC_PROCESS_ENABLED, 0);

			/* Limiter */
			Log.i("ViPER4Android", "updateSystem(): Updating Limiter.");
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_OUTPUT_VOLUME, Integer.valueOf(preferences.getString("viper4android.headphonefx.outvol", "100")));
			v4aModule.setParameter_px4_vx4x1(PARAM_SPKFX_LIMITER_THRESHOLD, Integer.valueOf(preferences.getString("viper4android.speakerfx.limiter", "100")));

			/* Master Switch */
			boolean bMasterControl = preferences.getBoolean("viper4android.speakerfx.enable", false);
			if (mMasterSwitchOff) bMasterControl = false;
			v4aModule.mInstance.setEnabled(bMasterControl);
		}
		/******************************************************************************************************/

		/* Reset */
		if (bRequireReset)
			v4aModule.setParameter_px4_vx4x1(PARAM_SET_RESET_STATUS, 1);
		/*********/

		Log.i("ViPER4Android", "System updated.");
	}
}
