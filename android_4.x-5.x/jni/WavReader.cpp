#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include "WavReader.h"

#define FILE_BEGIN SEEK_SET
#define FILE_END SEEK_END

WavReader_R32::WavReader_R32() {
    m_fpSamples = NULL;
    m_pFileHandle = NULL;
    m_uiFrameCount = 0;
    m_uiSamplingRate = 0;
    m_uiChannels = 0;
}

WavReader_R32::~WavReader_R32() {
    if (m_fpSamples != NULL)
        delete[] m_fpSamples;
    if (m_pFileHandle != NULL)
        fclose(m_pFileHandle);
    m_fpSamples = NULL;
    m_pFileHandle = NULL;
    m_uiFrameCount = 0;
    m_uiSamplingRate = 0;
    m_uiChannels = 0;
}

bool WavReader_R32::ReadFOURCC(int8_t cCode[4]) {
    if (m_pFileHandle == NULL)
        return false;
    uint32_t nReadSize = (uint32_t) fread(cCode, sizeof(int8_t), 4,
            m_pFileHandle);
    if (nReadSize != 4)
        return false;
    return true;
}

uint32_t WavReader_R32::SeekToChunk(int8_t cCode[4], uint8_t uiCodeLen) {
    if (m_pFileHandle == NULL)
        return false;
    fseek(m_pFileHandle, 0, FILE_END);
    uint32_t uiFileLength = ftell(m_pFileHandle);
    fseek(m_pFileHandle, 12, FILE_BEGIN);
    uint32_t uiCurrentPos = ftell(m_pFileHandle);
    while (true) {
        int8_t cReadCode[4] = { 0, 0, 0, 0 };
        if (!ReadFOURCC(cReadCode))
            return 0;
        if (memcmp(cReadCode, cCode, uiCodeLen) == 0) {
            uint32_t nChunkLength = ReadUINT32();
            uint32_t nRestBytes = uiFileLength - ftell(m_pFileHandle);
            if (nChunkLength > nRestBytes) {
                uiCurrentPos++;
                fseek(m_pFileHandle, uiCurrentPos, FILE_BEGIN);
                continue;
            }
            return nChunkLength;
        }
        uiCurrentPos++;
        fseek(m_pFileHandle, uiCurrentPos, FILE_BEGIN);
    }
    return 0;
}

uint32_t WavReader_R32::ReadUINT32() {
    if (m_pFileHandle == NULL)
        return 0;
    uint8_t szBuffer[4];
    uint32_t nReadSize = (uint32_t) fread(szBuffer, sizeof(int8_t), 4,
            m_pFileHandle);
    if (nReadSize != 4)
        return 0;
    return ((uint32_t) szBuffer[0]) | ((uint32_t) szBuffer[1] << 8)
            | ((uint32_t) szBuffer[2] << 16) | ((uint32_t) szBuffer[3] << 24);
}

uint16_t WavReader_R32::ReadUINT16() {
    if (m_pFileHandle == NULL)
        return 0;
    uint8_t szBuffer[2];
    uint32_t nReadSize = (uint32_t) fread(szBuffer, sizeof(int8_t), 2,
            m_pFileHandle);
    if (nReadSize != 2)
        return 0;
    return ((uint16_t) szBuffer[0]) | ((uint16_t) szBuffer[1] << 8);
}

void WavReader_R32::ConvertInt8ToFloat32(uint8_t *ptrInput,
        int32_t nSamplesCount,
        int32_t nChannels, float *ptrOutput) {
    for (int32_t i = 0; i < nSamplesCount * nChannels; i++) {
        int32_t nValue = (uint8_t) (ptrInput[i]) - 0x80;
        ptrOutput[i] = (float) ((double) nValue * 0.0078125);
    }
}

void WavReader_R32::ConvertInt16ToFloat32(int16_t *ptrInput,
        int32_t nSamplesCount,
        int32_t nChannels, float *ptrOutput) {
    for (int32_t i = 0; i < nSamplesCount * nChannels; i++)
        ptrOutput[i] = (float) ((double) ((int16_t) (ptrInput[i]))
                * 0.000030517578125);
}

void WavReader_R32::ConvertInt24ToFloat32(uint8_t *ptrInput,
        int32_t nSamplesCount,
        int32_t nChannels, float *ptrOutput) {
    for (int32_t i = 0; i < nSamplesCount * nChannels; i++) {
        int32_t mBits24Int = (ptrInput[0]) + (ptrInput[1] << 8)
                + (ptrInput[2] << 16);
        if (mBits24Int > 0x7FFFFF) {
            mBits24Int &= 0x7FFFFF;
            mBits24Int = 0x7FFFFF - mBits24Int;
            mBits24Int = -mBits24Int;
        }
        ptrOutput[i] =
                (float) ((double) mBits24Int * 0.00000011920928955078125);
        ptrInput += 3;
    }
}

void WavReader_R32::ConvertInt32ToFloat32(int32_t *ptrInput,
        int32_t nSamplesCount,
        int32_t nChannels, float *ptrOutput) {
    for (int32_t i = 0; i < nSamplesCount * nChannels; i++)
        ptrOutput[i] = (float) ((double) ((int32_t) (ptrInput[i]))
                * 0.0000000004656612873077392578125);
}

bool WavReader_R32::OpenWavFile(const char *pszFilePathName) {
    if (pszFilePathName == NULL)
        return false;
    if (strlen(pszFilePathName) <= 0)
        return false;
    if (m_fpSamples != NULL)
        delete[] m_fpSamples;
    if (m_pFileHandle != NULL)
        fclose(m_pFileHandle);
    m_fpSamples = NULL;
    m_pFileHandle = NULL;
    m_uiFrameCount = 0;
    m_uiSamplingRate = 0;
    m_uiChannels = 0;

    m_pFileHandle = fopen(pszFilePathName, "rb");
    if (m_pFileHandle == NULL)
        return false;

    int8_t cCode[4];
    if (!ReadFOURCC(cCode))
        return false;
    if ((cCode[0] != 'R') || (cCode[1] != 'I') || (cCode[2] != 'F')
            || (cCode[3] != 'F'))
        return false;
    uint32_t uiRiffChunkDataSize = ReadUINT32();
    if (uiRiffChunkDataSize == 0)
        return false;
    if (!ReadFOURCC(cCode))
        return false;
    if ((cCode[0] != 'W') || (cCode[1] != 'A') || (cCode[2] != 'V')
            || (cCode[3] != 'E'))
        return false;

    cCode[0] = 'f';
    cCode[1] = 'm';
    cCode[2] = 't';
    uint32_t nFormatLength = SeekToChunk(cCode, 3);
    if (nFormatLength < 16)
        return false;
    uint16_t nFormatTag = ReadUINT16();
    if ((nFormatTag != 0x0001) && (nFormatTag != 0x0003))
        return false;

    uint16_t uiChannels = ReadUINT16();
    if ((uiChannels != 1) && (uiChannels != 2))
        return false;
    uint32_t uiSampleRate = ReadUINT32();
    ReadUINT32();
    ReadUINT16();
    uint16_t uiBitsPerSample = ReadUINT16();
    if ((uiBitsPerSample != 8) && (uiBitsPerSample != 16)
            && (uiBitsPerSample != 24) && (uiBitsPerSample != 32))
        return false;

    cCode[0] = 'd';
    cCode[1] = 'a';
    cCode[2] = 't';
    cCode[3] = 'a';
    uint32_t uiDataSize = SeekToChunk(cCode, 4);
    uint32_t uiFrameCount = uiDataSize / (uiBitsPerSample / 8) / uiChannels;
    if (uiFrameCount == 0)
        return false;

    if (nFormatTag == 0x0003) {
        m_fpSamples = new float[uiFrameCount * uiChannels];
        if (m_fpSamples == NULL)
            return false;
        uint32_t nReadFrameCount = (uint32_t) fread(m_fpSamples, sizeof(float),
                uiFrameCount * uiChannels,
                m_pFileHandle);
        if (nReadFrameCount != uiFrameCount * uiChannels) {
            delete[] m_fpSamples;
            return false;
        }
        m_uiFrameCount = uiFrameCount;
        m_uiSamplingRate = uiSampleRate;
        m_uiChannels = uiChannels;
        return true;
    } else {
        uint32_t uiReadDataLength = uiFrameCount * uiChannels
                * (uiBitsPerSample / 8);
        uint8_t *ucFrameBuffer = new uint8_t[uiReadDataLength];
        if (ucFrameBuffer == NULL)
            return false;
        uint32_t nReadFrameCount = (uint32_t) fread(ucFrameBuffer,
                sizeof(uint8_t),
                uiReadDataLength,
                m_pFileHandle);
        if (nReadFrameCount != uiReadDataLength) {
            delete[] ucFrameBuffer;
            return false;
        }
        m_fpSamples = new float[uiFrameCount * uiChannels];
        if (m_fpSamples == NULL) {
            delete[] ucFrameBuffer;
            return false;
        }
        switch (uiBitsPerSample) {
            case 8:
                ConvertInt8ToFloat32(ucFrameBuffer, uiFrameCount, uiChannels,
                        m_fpSamples);
                break;

            case 16:
                ConvertInt16ToFloat32((int16_t*) ucFrameBuffer, uiFrameCount,
                        uiChannels, m_fpSamples);
                break;

            case 24:
                ConvertInt24ToFloat32(ucFrameBuffer, uiFrameCount, uiChannels,
                        m_fpSamples);
                break;

            case 32:
                ConvertInt32ToFloat32((int32_t*) ucFrameBuffer, uiFrameCount,
                        uiChannels, m_fpSamples);
                break;
        }
        delete[] ucFrameBuffer;
        m_uiFrameCount = uiFrameCount;
        m_uiSamplingRate = uiSampleRate;
        m_uiChannels = uiChannels;
        return true;
    }

    return false;
}

void WavReader_R32::ScalePCM(float rGain) {
    if (m_fpSamples == NULL)
        return;
    for (uint32_t i = 0; i < m_uiFrameCount * m_uiChannels; i++)
        m_fpSamples[i] *= rGain;
}

uint32_t WavReader_R32::GetFrameCount() {
    return m_uiFrameCount;
}

uint32_t WavReader_R32::GetSamplingRate() {
    return m_uiSamplingRate;
}

uint32_t WavReader_R32::GetChannels() {
    return m_uiChannels;
}

uint32_t WavReader_R32::ReadEntirePCM(float *fpBuffer, uint32_t nFrames) {
    if (m_fpSamples == NULL)
        return 0;
    if (fpBuffer == NULL)
        return 0;
    if (nFrames != m_uiFrameCount)
        return 0;
    memcpy(fpBuffer, m_fpSamples,
           m_uiFrameCount * m_uiChannels * sizeof(float));
    return nFrames;
}

float* WavReader_R32::GetDataBuffer() {
    return m_fpSamples;
}
