#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

uint32_t HashCRC32(uint8_t *ucpBuffer, uint32_t uiBufferSize) {
    uint32_t crcTable[256];
    for (int32_t i = 0; i < 256; i++) {
        uint32_t crcTbl = i;
        for (int32_t j = 8; j > 0; j--) {
            if (crcTbl & 0x01) crcTbl = (crcTbl >> 1) ^ 0xEDB88320L;
            else crcTbl >>= 1;
        }
        crcTable[i] = crcTbl;
    }

    uint32_t crcResult = 0xFFFFFFFF;
    while (uiBufferSize--) {
        uint8_t u8Data = *ucpBuffer;
        crcResult = ((crcResult >> 8) & 0x00FFFFFF) ^ crcTable[(crcResult ^ u8Data) & 0xFF];
        ucpBuffer++;
    }

    return (crcResult ^ 0xFFFFFFFF);
}
