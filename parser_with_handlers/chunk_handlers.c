#include "chunk_handlers.h"
#include <stdio.h>
#include <string.h>

// turn 4-character buffer into an integer
int get_big_endian(const char *buf) {
    return ((unsigned char)buf[0] << 24) | ((unsigned char)buf[1] << 16) | ((unsigned char)buf[2] << 8) | (unsigned char)buf[3];
}

// turn 2-character buffer into an integer
int get_2_byte_big_endian(const char *buf) {
    return ((unsigned char)buf[0] << 8) | ((unsigned char)buf[1]);
}

void validate_length(int actualVal, int expectedVal, const char *msg) {
    if (!(actualVal == expectedVal)) {
        printf("%s: actual length is %d, expected length is %d\n", msg, actualVal, expectedVal);
        exit(1);
    }
}

// https://datatracker.ietf.org/doc/html/rfc2083#page-15
// store in struct array:
// [width, height, bit_depth, color_type, compression_method, filter_method, interlace_method]
void header_handler(const char *buf, int len, struct png_data *currPng) {
    printf("Header info:\n");
    validate_length(len, 13, "Error in header length");
    currPng->header_data[0] = get_big_endian(buf);
    printf("width: %d pixels\n", currPng->header_data[0]);
    currPng->header_data[1] = get_big_endian(buf + 4);
    printf("height: %d pixels\n", currPng->header_data[1]);
    currPng->header_data[2] = (unsigned char)buf[8];
    printf("bit depth: %d\n", currPng->header_data[2]);
    currPng->color_type = (unsigned char)buf[9];
    currPng->header_data[3] = (unsigned char)buf[9];
    printf("color type: %d\n", currPng->header_data[3]);
    currPng->header_data[4] = (unsigned char)buf[10];
    printf("compression method: %d\n", currPng->header_data[4]);
    currPng->header_data[5] = (unsigned char)buf[11];
    printf("filter method: %d\n", currPng->header_data[5]);
    currPng->header_data[6] = (unsigned char)buf[12];
    printf("interlace method %d\n", currPng->header_data[6]);
    printf("[");
    for (int i = 0; i < currPng->header_data_size; i++) {
        printf("%d, ", currPng->header_data[i]);
    }
    printf("]\n");
}

void time_handler(const char *buf, int len, struct png_data *currPng) {
    printf("Time header info:\n");
    validate_length(len, 7, "Error in time chunk length");
    printf("Year: %d\n", get_2_byte_big_endian(buf));
    printf("Month: %d\n", (unsigned char)buf[2]);
    printf("Day: %d\n", (unsigned char)buf[3]);
    printf("Hour: %d\n", (unsigned char)buf[4]);
    printf("Minute: %d\n", (unsigned char)buf[5]);
    printf("Second: %d\n", (unsigned char)buf[6]);
}

void phys_pixel_dims_handler(const char *buf, int len, struct png_data *currPng) {
    printf("Physical pixel dimensions:\n");
    validate_length(len, 9, "Error in pHYs chunk length");
    printf("X axis pixels per unit: %d\n", get_big_endian(buf));
    printf("Y axis pixels per unit: %d\n", get_big_endian(buf + 4));
    printf("Unit specifier: %d\n", (unsigned char)buf[8]);
}

void background_color_handler(const char *buf, int len, struct png_data *currPng) {
    printf("Background color chunk\n");
    printf("Color type still accessible: %d\n", currPng->color_type);
}