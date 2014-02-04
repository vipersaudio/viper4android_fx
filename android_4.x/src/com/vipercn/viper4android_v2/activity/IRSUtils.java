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

    public static long hashIRS(byte[] mArray, int mLength) {
        if (mArray == null || mArray.length < mLength || mLength <= 0) {
            return 0;
        }

        // Generate CRC table
        long[] crcTable = new long[256];
        for (int i = 0; i < 256; i++) {
            long crcTblVal = i;
            for (int j = 8; j > 0; j--) {
                if ((crcTblVal & 0x01) != 0) {
                    crcTblVal = crcTblVal >> 1 ^ 0xEDB88320L;
                } else {
                    crcTblVal >>= 1;
                }
            }
            crcTable[i] = crcTblVal;
        }

        // Hash array
        long crcResult = 0xFFFFFFFF;
        for (int i = 0; i < mLength; i++) {
            long mData = (long) (mArray[i] & 0xFF);
            int tableIndex = (int) (crcResult ^ mData) & 0xFF;
            crcResult = crcResult >> 8 & 0x00FFFFFF ^ crcTable[tableIndex];
        }
        return ~crcResult;
    }

    private static final int WAV_HEADER_CHUNK_ID = 0x52494646; // "RIFF"
    private static final int WAV_FORMAT = 0x57415645; // "WAVE"
    private static final int WAV_FORMAT_CHUNK_ID = 0x666d7420; // "fmt "
    private static final int WAV_DATA_CHUNK_ID = 0x64617461; // "data"

    private FileInputStream mIrsStream;
    private BufferedInputStream mInputStream;
    private long mSamplesCount;
    private long mBytesCount;
    private int mChannels;

    // 0: Unknown, 1: s16le, 2: s24le, 3: s32le, 4: f32
    private int mSampleType;
    private int mSampleBits;

    public IRSUtils() {
        mIrsStream = null;
        mInputStream = null;
    }

    protected void finalize() throws Throwable {
        try {
            Release();
        } finally {
            super.finalize();
        }
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
        if (!new File(mIrsPathName).exists()) {
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
        int mHeaderId = readUnsignedInt(mInputStream);
        if (mHeaderId != WAV_HEADER_CHUNK_ID) {
            Release();
            return false;
        }
        fileLength = readUnsignedIntLE(mInputStream);
        if (fileLength <= 16) {
            Release();
            return false;
        }
        int mFormat = readUnsignedInt(mInputStream);
        if (mFormat != WAV_FORMAT) {
            Release();
            return false;
        }

        // Read wave header
        int mFormatId = readUnsignedInt(mInputStream);
        if (mFormatId != WAV_FORMAT_CHUNK_ID) {
            Release();
            return false;
        }
        int mFormatSize = readUnsignedIntLE(mInputStream);
        if (mFormatSize < 16) {
            Release();
            return false;
        }
        int audioFormat = readUnsignedShortLE(mInputStream);
        if (audioFormat != 0x0001 && audioFormat != 0x0003) {
            // We only accept WINDOWS_PCM_WAV and PCM_IEEE_FLOAT
            Release();
            return false;
        }
        mChannels = readUnsignedShortLE(mInputStream);
        if (mChannels < 1 || mChannels > 2) {
            // We only accept mono and stereo
            Release();
            return false;
        }
        int mSampleRate = readUnsignedIntLE(mInputStream);
        if (mSampleRate < 8000 || mSampleRate > 192000) {
            // We only accept standard sampling rate
            Release();
            return false;
        }
        int mByteRate = readUnsignedIntLE(mInputStream);
        Log.i("ViPER4Android", "IRS byterate = " + mByteRate);
        int mBlockAlign = readUnsignedShortLE(mInputStream);
        Log.i("ViPER4Android", "IRS blockalign = " + mBlockAlign);
        mSampleBits = readUnsignedShortLE(mInputStream);
        // Calculate sample type
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

        // Read data header
        int mDataId = readUnsignedInt(mInputStream);
        if (mDataId != WAV_DATA_CHUNK_ID) {
            Release();
            return false;
        }
        int mDataSize = readUnsignedIntLE(mInputStream);
        if (mDataSize <= 0 || mDataSize > 4194304) {
            // Too much data, may cause dalvik exception
            Release();
            return false;
        }

        // Calculate samples count
        mBytesCount = mDataSize;
        mSamplesCount = mBytesCount / mChannels / (mSampleBits / 8);
        if (mSamplesCount < 16) {
            // Convolver needs at least 16 samples
            Release();
            return false;
        }
        if (mBytesCount % (mChannels * mSampleBits / 8) != 0) {
            Release();
            return false;
        }

        Log.i("ViPER4Android", "IRS [" + mIrsPathName + "] opened");
        Log.i("ViPER4Android", "IRS attr = [" + mSampleType + "," + mChannels + ","
                + mSamplesCount + "]");

        return true;
    }

    public byte[] readEntireData() {
        if (mInputStream == null || mIrsStream == null) {
            return null;
        }
        if (mSampleType < 1 || mSampleType > 4) {
            return null;
        }

        // Read raw bytes
        byte[] mData = new byte[4096];
        int mReadLength = 0;
        while (true) {
            try {
                int mRead = mInputStream.read(mData, mReadLength, 4096);
                if (mRead < 0) {
                    break;
                }
                mReadLength += mRead;
                // Realloc for next
                byte[] newData = new byte[mReadLength + 4096];
                System.arraycopy(mData, 0, newData, 0, mReadLength);
                mData = newData;
            } catch (IOException e) {
                Log.i("ViPER4Android", "readEntireData, msg = " + e.getMessage());
                break;
            }
        }

        // Arrange byte array
        byte[] newData = new byte[mReadLength];
        System.arraycopy(mData, 0, newData, 0, mReadLength);
        mData = newData;

        // Update samples count according to read result
        if (mBytesCount > mData.length) {
            // If we got less data then header described, then use what we read
            mBytesCount = mData.length;
            mSamplesCount = mBytesCount / mChannels / (mSampleBits / 8);
            if (mBytesCount % (mChannels * mSampleBits / 8) != 0) {
                Release();
                return null;
            }
        } else if (mBytesCount < mData.length) {
            // If we got more data then header described, then use header
            // described
            Log.i("ViPER4Android", "IRSUtils: We got some garbage data, header = " + mBytesCount
                    + ", read = " + mData.length);
            Log.i("ViPER4Android", "IRSUtils: So lets discard some data, length = "
                    + (mData.length - mBytesCount));
            byte[] baActualData = new byte[(int) mBytesCount];
            System.arraycopy(mData, 0, baActualData, 0, (int) mBytesCount);
            mData = baActualData;
        }

        // Convert format
        switch (mSampleType) {
            case 1:
                return convert_S16LE_F32(mData);
            case 2:
                return convert_S24LE_F32(mData);
            case 3:
                return convert_S32LE_F32(mData);
        }

        return mData;
    }

    public int getChannels() {
        return mChannels;
    }

    public int getSampleCount() {
        return (int) mSamplesCount;
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
        int mSamplesCount = baS24LEData.length / 3; // 2 means sizeof(int24)
        byte[] baF32Data = new byte[mSamplesCount * 4]; // 4 means sizeof(float)
        double invscale = 0.00000011920928955078125;

        ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
        bbF32Buffer.order(ByteOrder.nativeOrder());
        for (int i = 0, idx = 0; i < mSamplesCount; i++, idx += 3) {
            byte s24_b1 = baS24LEData[idx];
            byte s24_b2 = baS24LEData[idx + 1];
            byte s24_b3 = baS24LEData[idx + 2];
            int s24 = s24_b1 & 0xFF | (s24_b2 & 0xFF) << 8 | (s24_b3 & 0xFF) << 16;
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
        int mSamplesCount = baS32LEData.length / 4; // 2 means sizeof(int)
        byte[] baF32Data = new byte[mSamplesCount * 4]; // 4 means sizeof(float)
        double invscale = 0.0000000004656612873077392578125;

        ByteBuffer bbS32Buffer = ByteBuffer.wrap(baS32LEData);
        ByteBuffer bbF32Buffer = ByteBuffer.wrap(baF32Data);
        bbS32Buffer.order(ByteOrder.nativeOrder());
        bbF32Buffer.order(ByteOrder.nativeOrder());
        for (int i = 0; i < mSamplesCount; i++) {
            int s32 = bbS32Buffer.getInt();
            float f32 = (float) (s32 * invscale);
            bbF32Buffer.putFloat(f32);
        }
        return baF32Data;
    }

    private static short byteToShortLE(byte b1, byte b2) {
        return (short) (b1 & 0xFF | (b2 & 0xFF) << 8);
    }

    private static int readUnsignedInt(BufferedInputStream bisInput) {
        byte[] mBuffer = new byte[4];
        int dwReturn;
        try {
            dwReturn = bisInput.read(mBuffer);
        } catch (IOException e) {
            return 0;
        }
        return dwReturn == -1 ? -1 : (mBuffer[0] & 0xFF) << 24
                | (mBuffer[1] & 0xFF) << 16
                | (mBuffer[2] & 0xFF) << 8
                | mBuffer[3] & 0xFF;
    }

    private static int readUnsignedIntLE(BufferedInputStream bisInput) {
        byte[] mBuffer = new byte[4];
        int dwReturn;
        try {
            dwReturn = bisInput.read(mBuffer);
        } catch (IOException e) {
            return 0;
        }
        return dwReturn == -1 ? -1 : mBuffer[0] & 0xFF
                | (mBuffer[1] & 0xFF) << 8
                | (mBuffer[2] & 0xFF) << 16
                | (mBuffer[3] & 0xFF) << 24;
    }

    private static short readUnsignedShortLE(BufferedInputStream bisInput) {
        byte[] mBuffer = new byte[2];
        int dwReturn;
        try {
            dwReturn = bisInput.read(mBuffer, 0, 2);
        } catch (IOException e) {
            return 0;
        }
        return dwReturn == -1 ? -1 : byteToShortLE(mBuffer[0], mBuffer[1]);
    }
}
