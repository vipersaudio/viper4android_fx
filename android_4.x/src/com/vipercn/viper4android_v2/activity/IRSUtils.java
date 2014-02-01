
package com.vipercn.viper4android_v2.activity;

import android.util.Log;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class IRSUtils {

    public static long hashIRS(byte[] baArray, int nLength) {
        if (baArray == null || baArray.length < nLength || nLength <= 0) {
            return 0;
        }

        // Generate CRC table
        long[] crcTable = new long[256];
        for (int i = 0; i < 256; i++) {
            long crcTblVal = i;
            for (int j = 8; j > 0; j--) {
                if ((crcTblVal & 0x01) != 0) {
                    crcTblVal = (crcTblVal >> 1) ^ 0xEDB88320L;
                } else {
                    crcTblVal >>= 1;
                }
            }
            crcTable[i] = crcTblVal;
        }

        // Hash array
        long crcResult = 0xFFFFFFFF;
        for (int i = 0; i < nLength; i++) {
            long bData = (long) (baArray[i] & 0xFF);
            int nTblIndex = (int) (crcResult ^ bData) & 0xFF;
            crcResult = ((crcResult >> 8) & 0x00FFFFFF) ^ crcTable[nTblIndex];
        }
        return ~crcResult;
    }

    private static final int WAV_HEADER_CHUNK_ID = 0x52494646; // "RIFF"

    private static final int WAV_FORMAT = 0x57415645; // "WAVE"

    private static final int WAV_FORMAT_CHUNK_ID = 0x666d7420; // "fmt "

    private static final int WAV_DATA_CHUNK_ID = 0x64617461; // "data"

    private FileInputStream mIrsStream = null;

    private BufferedInputStream mInputStream = null;

    private long m_nSamplesCount = 0;

    private long m_nBytesCount = 0;

    private int mChannels = 0;

    // 0: Unknow, 1: s16le, 2: s24le, 3: s32le, 4: f32
    private int mSampleType = 0;

    private int mSampleBits = 0;

    public IRSUtils() {
        mIrsStream = null;
        mInputStream = null;
    }

    protected void finalize() {
        Release();
    }

    public void Release() {
        if (mInputStream != null) {
            try {
                mInputStream.close();
            } catch (IOException e) {
                Log.i("ViPER4Android", "Release, msg = " + e.getMessage());
            }
            mInputStream = null;
        }
        if (mIrsStream != null) {
            try {
                mIrsStream.close();
            } catch (IOException e) {
                Log.i("ViPER4Android", "Release, msg = " + e.getMessage());
            }
            mIrsStream = null;
        }
    }

    public boolean LoadIrs(String mIrsPathName) {
        if (mIrsPathName == null || mIrsPathName.equals("")) {
            return false;
        }
        if (!(new File(mIrsPathName).exists())) {
            return false;
        }
        Release();

        // Open irs file
        try {
            mIrsStream = new FileInputStream(mIrsPathName);
        } catch (FileNotFoundException e) {
            mIrsStream = null;
            mInputStream = null;
            Log.i("ViPER4Android", "LoadIrs, FileNotFoundException, msg = " + e.getMessage()
                    + "mIrsPathName = " + mIrsPathName);
            return false;
        }
        long fileLength = new File(mIrsPathName).length();
        if (fileLength <= 16) {
            Release();
            return false;
        }

        // Read file header
        mInputStream = new BufferedInputStream(mIrsStream, 4096);
        int nHeaderId = readUnsignedInt(mInputStream);
        if (nHeaderId != WAV_HEADER_CHUNK_ID) {
            Release();
            return false;
        }
        fileLength = readUnsignedIntLE(mInputStream);
        if (fileLength <= 16) {
            Release();
            return false;
        }
        int nFormat = readUnsignedInt(mInputStream);
        if (nFormat != WAV_FORMAT) {
            Release();
            return false;
        }

        // Read wave header
        int nFormatId = readUnsignedInt(mInputStream);
        if (nFormatId != WAV_FORMAT_CHUNK_ID) {
            Release();
            return false;
        }
        int nFormatSize = readUnsignedIntLE(mInputStream);
        if (nFormatSize < 16) {
            Release();
            return false;
        }
        int audioFormat = readUnsignedShortLE(mInputStream);
        if ((audioFormat != 0x0001) && (audioFormat != 0x0003)) {
            // We only accept WINDOWS_PCM_WAV and PCM_IEEE_FLOAT
            Release();
            return false;
        }
        mChannels = readUnsignedShortLE(mInputStream);
        if ((mChannels < 1) || (mChannels > 2)) {
            // We only accept mono and stereo
            Release();
            return false;
        }
        int nSampleRate = readUnsignedIntLE(mInputStream);
        if ((nSampleRate < 8000) || (nSampleRate > 192000)) {
            // We only accept standard sampling rate
            Release();
            return false;
        }
        int nByteRate = readUnsignedIntLE(mInputStream);
        Log.i("ViPER4Android", "IRS byterate = " + nByteRate);
        int nBlockAlign = readUnsignedShortLE(mInputStream);
        Log.i("ViPER4Android", "IRS blockalign = " + nBlockAlign);
        mSampleBits = readUnsignedShortLE(mInputStream);
        // Calculate sample type
        {
            mSampleType = 0;
            if (audioFormat == 0x0001) {
                if (mSampleBits == 16) {
                    mSampleType = 1;
                } else if (mSampleBits == 24) {
                    mSampleType = 2;
                } else if (mSampleBits == 32) {
                    mSampleType = 3;
                } else {
                    // We only accept s16le, s24le and s32le in integer format
                    Release();
                    return false;
                }
            } else {
                if (mSampleBits == 32) {
                    mSampleType = 4;
                } else {
                    // We only accept f32 in floating format
                    Release();
                    return false;
                }
            }
        }

        // Read data header
        int nDataId = readUnsignedInt(mInputStream);
        if (nDataId != WAV_DATA_CHUNK_ID) {
            Release();
            return false;
        }
        int nDataSize = readUnsignedIntLE(mInputStream);
        if ((nDataSize <= 0) || (nDataSize > 4194304)) {
            // Too many data, may cause dalvik exception
            Release();
            return false;
        }

        // Calculate samples count
        {
            m_nBytesCount = nDataSize;
            m_nSamplesCount = m_nBytesCount / mChannels / (mSampleBits / 8);
            if (m_nSamplesCount < 16) {
                // Convolver needs at least 16 samples
                Release();
                return false;
            }
            if (m_nBytesCount % (mChannels * (mSampleBits / 8)) != 0) {
                Release();
                return false;
            }
        }

        Log.i("ViPER4Android", "IRS [" + mIrsPathName + "] opened");
        Log.i("ViPER4Android", "IRS attr = [" + mSampleType + "," + mChannels + ","
                + m_nSamplesCount + "]");

        return true;
    }

    public byte[] readEntireData() {
        if ((mInputStream == null) || (mIrsStream == null)) {
            return null;
        }
        if ((mSampleType < 1) || (mSampleType > 4)) {
            return null;
        }

        // Read raw bytes
        byte[] baData = new byte[4096];
        int nReadLength = 0;
        while (true) {
            try {
                int nRead = mInputStream.read(baData, nReadLength, 4096);
                if (nRead < 0) {
                    break;
                }
                nReadLength += nRead;
                // Realloc for next
                byte[] baNewData = new byte[nReadLength + 4096];
                System.arraycopy(baData, 0, baNewData, 0, nReadLength);
                baData = baNewData;
            } catch (IOException e) {
                Log.i("ViPER4Android", "readEntireData, msg = " + e.getMessage());
                break;
            }
        }

        // Arrange byte array
        byte[] baNewData = new byte[nReadLength];
        System.arraycopy(baData, 0, baNewData, 0, nReadLength);
        baData = baNewData;

        // Update samples count according to read result
        if (m_nBytesCount > baData.length) {
            // If we got less data then header described, then use what we read
            m_nBytesCount = baData.length;
            m_nSamplesCount = m_nBytesCount / mChannels / (mSampleBits / 8);
            if (m_nBytesCount % (mChannels * (mSampleBits / 8)) != 0) {
                Release();
                return null;
            }
        } else if (m_nBytesCount < baData.length) {
            // If we got more data then header described, then use header
            // described
            Log.i("ViPER4Android", "IRSUtils: We got some garbage data, header = " + m_nBytesCount
                    + ", read = " + baData.length);
            Log.i("ViPER4Android", "IRSUtils: So lets discard some data, length = "
                    + (baData.length - m_nBytesCount));
            byte[] baActualData = new byte[(int) m_nBytesCount];
            System.arraycopy(baData, 0, baActualData, 0, (int) m_nBytesCount);
            baData = baActualData;
        }

        // Convert format
        switch (mSampleType) {
            case 1:
                return convert_S16LE_F32(baData);
            case 2:
                return convert_S24LE_F32(baData);
            case 3:
                return convert_S32LE_F32(baData);
        }

        return baData;
    }

    public int getChannels() {
        return mChannels;
    }

    public int getSampleCount() {
        return (int) m_nSamplesCount;
    }

    public int getByteCount() {
        return (int) m_nBytesCount;
    }

    private static byte[] convert_S16LE_F32(byte[] baS16LEData) {
        int nSamplesCount = baS16LEData.length / 2; // 2 means sizeof(short)
        byte[] baF32Data = new byte[nSamplesCount * 4]; // 4 means sizeof(float)
        double invscale = 0.000030517578125;

        ByteBuffer bbS16Buffer = ByteBuffer.wrap(baS16LEData);
        ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
        bbS16Buffer.order(ByteOrder.nativeOrder());
        bbF32Buffer.order(ByteOrder.nativeOrder());
        for (int i = 0; i < nSamplesCount; i++) {
            short s16 = bbS16Buffer.getShort();
            float f32 = (float) (s16 * invscale);
            bbF32Buffer.putFloat(f32);
        }
        return baF32Data;
    }

    private static byte[] convert_S24LE_F32(byte[] baS24LEData) {
        int nSamplesCount = baS24LEData.length / 3; // 2 means sizeof(int24)
        byte[] baF32Data = new byte[nSamplesCount * 4]; // 4 means sizeof(float)
        double invscale = 0.00000011920928955078125;

        ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
        bbF32Buffer.order(ByteOrder.nativeOrder());
        for (int i = 0, idx = 0; i < nSamplesCount; i++, idx += 3) {
            byte s24_b1 = baS24LEData[idx];
            byte s24_b2 = baS24LEData[idx + 1];
            byte s24_b3 = baS24LEData[idx + 2];
            int s24 = s24_b1 & 0xFF | ((s24_b2 & 0xFF) << 8) | ((s24_b3 & 0xFF) << 16);
            if (s24 > 0x7FFFFF) {
                s24 &= 0x7FFFFF;
                s24 = 0x7FFFFF - s24;
                s24 = -s24;
            }
            float f32 = (float) (s24 * invscale);
            bbF32Buffer.putFloat(f32);
        }
        return baF32Data;
    }

    private static byte[] convert_S32LE_F32(byte[] baS32LEData) {
        int nSamplesCount = baS32LEData.length / 4; // 2 means sizeof(int)
        byte[] baF32Data = new byte[nSamplesCount * 4]; // 4 means sizeof(float)
        double invscale = 0.0000000004656612873077392578125;

        ByteBuffer bbS32Buffer = ByteBuffer.wrap(baS32LEData);
        ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
        bbS32Buffer.order(ByteOrder.nativeOrder());
        bbF32Buffer.order(ByteOrder.nativeOrder());
        for (int i = 0; i < nSamplesCount; i++) {
            int s32 = bbS32Buffer.getInt();
            float f32 = (float) (s32 * invscale);
            bbF32Buffer.putFloat(f32);
        }
        return baF32Data;
    }

    private static short byteToShortLE(byte b1, byte b2) {
        return (short) (b1 & 0xFF | ((b2 & 0xFF) << 8));
    }

    private static int readUnsignedInt(BufferedInputStream bisInput) {
        byte[] baBuffer = new byte[4];
        int dwReturn;
        try {
            dwReturn = bisInput.read(baBuffer);
        } catch (IOException e) {
            return 0;
        }
        if (dwReturn == -1) {
            return -1;
        } else {
            return (((baBuffer[0] & 0xFF) << 24)
                    | ((baBuffer[1] & 0xFF) << 16)
                    | ((baBuffer[2] & 0xFF) << 8)
                    | (baBuffer[3] & 0xFF));
        }
    }

    private static int readUnsignedIntLE(BufferedInputStream bisInput) {
        byte[] baBuffer = new byte[4];
        int dwReturn;
        try {
            dwReturn = bisInput.read(baBuffer);
        } catch (IOException e) {
            return 0;
        }
        if (dwReturn == -1) {
            return -1;
        } else {
            return ((baBuffer[0] & 0xFF)
                    | ((baBuffer[1] & 0xFF) << 8)
                    | ((baBuffer[2] & 0xFF) << 16)
                    | ((baBuffer[3] & 0xFF) << 24));
        }
    }

    private static short readUnsignedShortLE(BufferedInputStream bisInput) {
        byte[] baBuffer = new byte[2];
        int dwReturn;
        try {
            dwReturn = bisInput.read(baBuffer, 0, 2);
        } catch (IOException e) {
            return 0;
        }
        if (dwReturn == -1) {
            return -1;
        } else {
            return byteToShortLE(baBuffer[0], baBuffer[1]);
        }
    }
}
