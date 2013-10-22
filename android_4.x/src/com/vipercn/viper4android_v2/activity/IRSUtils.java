package com.vipercn.viper4android_v2.activity;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import android.util.Log;

public class IRSUtils
{
	public static long HashIRS(byte[] baArray, int nLength)
	{
		if (baArray == null) return 0;
		if (baArray.length < nLength) return 0;
		if (nLength <= 0) return 0;

		// Generate CRC table
		long[] crcTable = new long[256];
		for (int i = 0; i < 256; i++)
		{
			long crcTblVal = i;
			for (int j = 8; j > 0; j--)
			{
				if ((crcTblVal & 0x01) != 0) crcTblVal = (crcTblVal >> 1) ^ 0xEDB88320L;
				else crcTblVal >>= 1;
			}
			crcTable[i] = crcTblVal;
		}

		// Hash array
		long crcResult = 0xFFFFFFFF;
		for (int i = 0; i < nLength; i++)
		{
			long bData = (long)((byte)baArray[i] & 0xFF);
			int nTblIndex = (int)(crcResult ^ bData) & 0xFF;
			crcResult = ((crcResult >> 8) & 0x00FFFFFF) ^ crcTable[nTblIndex];
		}
		return crcResult ^ 0xFFFFFFFF;
	}

	private static final int WAV_HEADER_CHUNK_ID = 0x52494646;	// "RIFF"
    private static final int WAV_FORMAT = 0x57415645;			// "WAVE"
    private static final int WAV_FORMAT_CHUNK_ID = 0x666d7420;	// "fmt "
    private static final int WAV_DATA_CHUNK_ID = 0x64617461;	// "data"

	private FileInputStream m_fsiIRSStream = null;
	private BufferedInputStream m_bisInputStream = null;

	private long m_nFileLength = 0;
	private long m_nSamplesCount = 0;
	private long m_nBytesCount = 0;
	private int m_nChannels = 0;
	// 0: Unknow, 1: s16le, 2: s24le, 3: s32le, 4: f32
	private int m_nSampleType = 0;
	private int m_nSampleBits = 0;

	public IRSUtils()
	{
		m_fsiIRSStream = null;
		m_bisInputStream = null;
	}

	protected void finalize()
	{
		Release();
	}

	public void Release()
	{
		if (m_bisInputStream != null)
		{
			try { m_bisInputStream.close(); }
			catch (IOException e) {}
			m_bisInputStream = null;
		}
		if (m_fsiIRSStream != null)
		{
			try { m_fsiIRSStream.close(); }
			catch (IOException e) {}
			m_fsiIRSStream = null;
		}
	}

	public boolean LoadIRS(String szIRSPathName)
	{
		if (szIRSPathName == null) return false;
		if (szIRSPathName.equals("")) return false;
		if (!(new File(szIRSPathName).exists())) return false;
		Release();

		// Open irs file
		try { m_fsiIRSStream = new FileInputStream(szIRSPathName); }
		catch (FileNotFoundException e)
		{
			m_fsiIRSStream = null;
			m_bisInputStream = null;
			Log.i("ViPER4Android", "LoadIRS, FileNotFoundException, msg = " + e.getMessage());
			return false;
		}
		m_nFileLength = new File(szIRSPathName).length();
		if (m_nFileLength <= 16)
		{
			Release();
			return false;
		}

		// Read file header
		m_bisInputStream = new BufferedInputStream(m_fsiIRSStream, 4096);
		int nHeaderId = ReadUnsignedInt(m_bisInputStream);
        if (nHeaderId != WAV_HEADER_CHUNK_ID)
        {
            Release();
            return false;
        }
        m_nFileLength = ReadUnsignedIntLE(m_bisInputStream);
		if (m_nFileLength <= 16)
		{
			Release();
			return false;
		}
        int nFormat = ReadUnsignedInt(m_bisInputStream);
        if (nFormat != WAV_FORMAT)
        {
			Release();
			return false;
        }

        // Read wave header
        int nFormatId = ReadUnsignedInt(m_bisInputStream);
        if (nFormatId != WAV_FORMAT_CHUNK_ID)
        {
			Release();
			return false;
        }
        int nFormatSize = ReadUnsignedIntLE(m_bisInputStream);
        if (nFormatSize < 16)
        {
			Release();
			return false;
        }
        int nAudioFormat = ReadUnsignedShortLE(m_bisInputStream);
        if ((nAudioFormat != 0x0001) && (nAudioFormat != 0x0003))
        {
        	// We only accept WINDOWS_PCM_WAV and PCM_IEEE_FLOAT
			Release();
			return false;
        }
        m_nChannels = ReadUnsignedShortLE(m_bisInputStream);
        if ((m_nChannels < 1) || (m_nChannels > 2))
        {
        	// We only accept mono and stereo
			Release();
			return false;
        }
        int nSampleRate = ReadUnsignedIntLE(m_bisInputStream);
        if ((nSampleRate < 8000) || (nSampleRate > 192000))
        {
        	// We only accept standard sampling rate
			Release();
			return false;
        }
        int nByteRate = ReadUnsignedIntLE(m_bisInputStream);
        Log.i("ViPER4Android", "IRS byterate = " + nByteRate);
        int nBlockAlign = ReadUnsignedShortLE(m_bisInputStream);
        Log.i("ViPER4Android", "IRS blockalign = " + nBlockAlign);
        m_nSampleBits = ReadUnsignedShortLE(m_bisInputStream);
        // Calculate sample type
        {
        	m_nSampleType = 0;
        	if (nAudioFormat == 0x0001)
        	{
        		if (m_nSampleBits == 16) m_nSampleType = 1;
        		else if (m_nSampleBits == 24) m_nSampleType = 2;
        		else if (m_nSampleBits == 32) m_nSampleType = 3;
        		else
        		{
                	// We only accept s16le, s24le and s32le in integer format
        			Release();
        			return false;
        		}
        	}
        	else
        	{
        		if (m_nSampleBits == 32)
        			m_nSampleType = 4;
        		else
        		{
                	// We only accept f32 in floating format
        			Release();
        			return false;
        		}
        	}
        }

        // Read data header
        int nDataId = ReadUnsignedInt(m_bisInputStream);
        if (nDataId != WAV_DATA_CHUNK_ID)
        {
			Release();
			return false;
        }
        int nDataSize = ReadUnsignedIntLE(m_bisInputStream);
        if ((nDataSize <= 0) || (nDataSize > 4194304))
        {
        	// Too many data, may cause dalvik exception
			Release();
			return false;
        }

        // Calculate samples count
        {
        	m_nBytesCount = nDataSize;
        	m_nSamplesCount = m_nBytesCount / m_nChannels / (m_nSampleBits / 8);
        	if (m_nSamplesCount < 16)
        	{
        		// Convolver needs at least 16 samples
    			Release();
    			return false;
        	}
    		if (m_nBytesCount % (m_nChannels * (m_nSampleBits / 8)) != 0)
    		{
    			Release();
    			return false;
    		}
        }

        Log.i("ViPER4Android", "IRS [" + szIRSPathName + "] opened");
        Log.i("ViPER4Android", "IRS attr = [" + m_nSampleType + "," + m_nChannels + "," + m_nSamplesCount + "]");

        return true;
	}

	public byte[] ReadEntireData()
	{
		if ((m_bisInputStream == null) || (m_fsiIRSStream == null)) return null;
		if ((m_nSampleType < 1) || (m_nSampleType > 4)) return null;

		// Read raw bytes
		byte[] baData = new byte[4096];
		int nReadLength = 0;
		while (true)
		{
			try
			{
				int nRead = m_bisInputStream.read(baData, nReadLength, 4096);
				if (nRead < 0) break;
				nReadLength += nRead;
				// Realloc for next
				byte[] baNewData = new byte[nReadLength + 4096];
				System.arraycopy(baData, 0, baNewData, 0, nReadLength);
				baData = baNewData;
			}
			catch (IOException e)
			{ break; }
		}

		// Arrange byte array
		byte[] baNewData = new byte[nReadLength];
		System.arraycopy(baData, 0, baNewData, 0, nReadLength);
		baData = baNewData;

		// Update samples count according to read result
		if (m_nBytesCount > baData.length)
		{
			// If we got less data then header described, then use what we read
			m_nBytesCount = baData.length;
			m_nSamplesCount = m_nBytesCount / m_nChannels / (m_nSampleBits / 8);
			if (m_nBytesCount % (m_nChannels * (m_nSampleBits / 8)) != 0)
			{
				Release();
				return null;
			}
		}
		else if (m_nBytesCount < baData.length)
		{
			// If we got more data then header described, then use header described
			Log.i("ViPER4Android", "IRSUtils: We got some garbage data, header = " + m_nBytesCount + ", read = " + baData.length);
			Log.i("ViPER4Android", "IRSUtils: So lets discard some data, length = " + (baData.length - m_nBytesCount));
			byte[] baActualData = new byte[(int)m_nBytesCount];
			System.arraycopy(baData, 0, baActualData, 0, (int)m_nBytesCount);
			baData = baActualData;
		}

		// Convert format
		switch (m_nSampleType)
		{
			case 1: return Convert_S16LE_F32(baData);
			case 2: return Convert_S24LE_F32(baData);
			case 3: return Convert_S32LE_F32(baData);
		}

		return baData;
	}

	public int GetChannels()
	{
		return m_nChannels;
	}

	public int GetSampleCount()
	{
		return (int)m_nSamplesCount;
	}

	public int GetByteCount()
	{
		return (int)m_nBytesCount;
	}

	private static byte[] Convert_S16LE_F32(byte[] baS16LEData)
	{
		int nSamplesCount = baS16LEData.length / 2;  // 2 means sizeof(short)
		byte[] baF32Data = new byte[nSamplesCount * 4];  // 4 means sizeof(float)
		double invscale = 0.000030517578125;

		ByteBuffer bbS16Buffer = ByteBuffer.wrap(baS16LEData);
		ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
		bbS16Buffer.order(ByteOrder.nativeOrder());
		bbF32Buffer.order(ByteOrder.nativeOrder());
		for (int i = 0; i < nSamplesCount; i++)
		{
			short s16 = bbS16Buffer.getShort();
			float f32 = (float)(s16 * invscale);
			bbF32Buffer.putFloat(f32);
		}
		return baF32Data;
	}

	private static byte[] Convert_S24LE_F32(byte[] baS24LEData)
	{
		int nSamplesCount = baS24LEData.length / 3;  // 2 means sizeof(int24)
		byte[] baF32Data = new byte[nSamplesCount * 4];  // 4 means sizeof(float)
		double invscale = 0.00000011920928955078125;

		ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
		bbF32Buffer.order(ByteOrder.nativeOrder());
		for (int i = 0, idx = 0; i < nSamplesCount; i++, idx += 3)
		{
			byte s24_b1 = baS24LEData[idx + 0];
			byte s24_b2 = baS24LEData[idx + 1];
			byte s24_b3 = baS24LEData[idx + 2];
			int s24 = (int)(s24_b1 & 0xFF | ((s24_b2 & 0xFF) << 8) | ((s24_b3 & 0xFF) << 16));
			if (s24 > 0x7FFFFF)
			{
				s24 &= 0x7FFFFF;
				s24  = 0x7FFFFF - s24;
				s24  = -s24;
			}
			float f32 = (float)(s24 * invscale);
			bbF32Buffer.putFloat(f32);
		}
		return baF32Data;
	}

	private static byte[] Convert_S32LE_F32(byte[] baS32LEData)
	{
		int nSamplesCount = baS32LEData.length / 4;  // 2 means sizeof(int)
		byte[] baF32Data = new byte[nSamplesCount * 4];  // 4 means sizeof(float)
		double invscale = 0.0000000004656612873077392578125;

		ByteBuffer bbS32Buffer = ByteBuffer.wrap(baS32LEData);
		ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
		bbS32Buffer.order(ByteOrder.nativeOrder());
		bbF32Buffer.order(ByteOrder.nativeOrder());
		for (int i = 0; i < nSamplesCount; i++)
		{
			int s32 = bbS32Buffer.getInt();
			float f32 = (float)(s32 * invscale);
			bbF32Buffer.putFloat(f32);
		}
		return baF32Data;
	}

    private static short ByteToShortLE(byte b1, byte b2)
    {
        return (short)(b1 & 0xFF | ((b2 & 0xFF) << 8));
    }

	private static int ReadUnsignedInt(BufferedInputStream bisInput)
	{
        byte[] baBuffer = new byte[4];
        int dwReturn = -1;
        try { dwReturn = bisInput.read(baBuffer); }
        catch (IOException e) { return 0; }
        if (dwReturn == -1) return -1;
        else
        {
            return (((baBuffer[0] & 0xFF) << 24)
            	  | ((baBuffer[1] & 0xFF) << 16)
                  | ((baBuffer[2] & 0xFF) << 8)
                  |  (baBuffer[3] & 0xFF));
        }
    }

    private static int ReadUnsignedIntLE(BufferedInputStream bisInput)
    {
        byte[] baBuffer = new byte[4];
        int dwReturn = -1;
        try { dwReturn = bisInput.read(baBuffer); }
        catch (IOException e) { return 0; }
        if (dwReturn == -1) return -1;
        else
        {
            return ((baBuffer[0] & 0xFF)
            	 | ((baBuffer[1] & 0xFF) << 8)
            	 | ((baBuffer[2] & 0xFF) << 16)
            	 | ((baBuffer[3] & 0xFF) << 24));
        }
    }

    private static short ReadUnsignedShortLE(BufferedInputStream bisInput)
    {
        byte[] baBuffer = new byte[2];
        int dwReturn = -1;
        try { dwReturn = bisInput.read(baBuffer, 0, 2); }
        catch (IOException e) { return 0; }
        if (dwReturn == -1) return -1;
        else return ByteToShortLE(baBuffer[0], baBuffer[1]);
    }
}
