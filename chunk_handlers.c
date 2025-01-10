#include "chunk_handlers.h"
#include <stdio.h>
#include <string.h>

// turn 4-character buffer into an integer
int get_big_endian(const char *buf) {
    return ((unsigned char)buf[0] << 24) | ((unsigned char)buf[1] << 16) | ((unsigned char)buf[2] << 8) | (unsigned char)buf[3];
}

void validate_length(int actualVal, int expectedVal, const char *msg) {
    if (!(actualVal == expectedVal)) {
        printf("%s: actual length is %d, expected length is %d\n", msg, actualVal, expectedVal);
        exit(1);
    }
}

// https://datatracker.ietf.org/doc/html/rfc2083#page-15
void header_handler(const char *buf, int len) {
    printf("Header info:\n");
    validate_length(len, 13, "Error in header length");
    printf("width: %d pixels\n", get_big_endian(buf));
    printf("height: %d pixels\n", get_big_endian(buf + 4));
    printf("bit depth: %d\n", (unsigned char)buf[8]);
    printf("color type: %d\n", (unsigned char)buf[9]);
    printf("compression method: %d\n", (unsigned char)buf[10]);
    printf("filter method: %d\n", (unsigned char)buf[11]);
    printf("interlace method %d\n", (unsigned char)buf[12]);
}

void time_handler(const char *buf, int len) {
    printf("lulz time working\n");
}