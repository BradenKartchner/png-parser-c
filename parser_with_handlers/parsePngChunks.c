/**
 * TODO: add GUI?
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "chunk_handlers.h"
#include "chunk_handlers.c"

// Maximum file size of 16 MB
# define MAX_SIZE (16 * 1024 * 1024)

void validate(int val, const char *msg, int whichByte);
void check_signature(const char *buf);

int main(int argc, char **argv) {
    // check to make sure file was passed in via command line
    if (argc != 2) {
        printf("Usage: %s <png file>\n", argv[0]);
        return 1;
    }
    
    // allocate character buffer
    char *buf = (char *)malloc(MAX_SIZE);
    if (!buf) {
        fprintf(stderr, "Couldn't allocate memory\n");
        return 1;
    }

    // open specified file
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror("fopen");
        free(buf);
        return 1;
    }

    // read file into the buffer
    int size = fread(buf, 1, MAX_SIZE, f);
    printf("file size: %d\n", size);

    // validate file as PNG
    check_signature(buf);

    // Initialize struct for containing png data
    struct png_data myPngStruct;
    memset(&myPngStruct, 0x00, sizeof(myPngStruct));

    /* Parse PNG file */
    // position in buffer (start after signature)
    int posInBuff = 8;
    while (posInBuff < size) {
        // copy length of chunk to lenbuf
        char lenbuf[4];
        memcpy(lenbuf, buf + posInBuff, 4);
        // convert length buffer to int
        int len = get_big_endian(lenbuf);
        // advance position in buffer
        posInBuff = posInBuff + 4;
        // create chunk type buffer
        // 4 bytes of ascii + 1 byte as null terminator lets us treat it as a string (pass to printf directly)
        char chunkbuf[5];
        memcpy(chunkbuf, buf + posInBuff, 4);
        chunkbuf[4] = 0;
        // handle each chunk parsing separately
        for (unsigned int i = 0; chunk_handlers[i].type != NULL; i++) {
            if (!strcmp(chunkbuf, chunk_handlers[i].type)) {
                chunk_handlers[i].func(buf + posInBuff + 4, len, &myPngStruct);
                break;
            }
        }
        // advance position in buffer for chunk type (4 bytes), len, and crc (4 bytes)
        posInBuff = posInBuff + 8 + len;
        printf("chunk: %s - len: %d (%d)\n", chunkbuf, len, size - posInBuff);
    }

    // close file and free buffer
    fclose(f);
    free(buf);

    return 0;
}

void validate(int val, const char *msg, int whichByte) {
    if (!val) {
        fprintf(stderr, "Invalid file: %s %d\n", msg, whichByte);
        exit(1);
    }
    // printf("%s %d\n", msg, whichByte);
}

// note that signed char has a range of -127 to 127 (1 byte)
void check_signature(const char *buf) {
    int pngSignatureVals[] = {0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a};
    for (unsigned int i = 0; i < 8; i++) {
        validate((unsigned char)buf[i] == pngSignatureVals[i], "signature byte ", i);
    }
    printf("signature valid!\n");
}
