#ifndef CHUNK_HANDLERS_H
#define CHUNK_HANDLERS_H

#include <stdlib.h>

// struct definition
struct png_data {
    int color_type;
};

// function prototypes

int get_big_endian(const char *buf);
int get_2_byte_big_endian(const char *buf);
void validate_length(int actualVal, int expectedVal, const char *msg);
void header_handler(const char *buf, int len, struct png_data *currPng);
void time_handler(const char *buf, int len, struct png_data *currPng);
void phys_pixel_dims_handler(const char *buf, int len, struct png_data *currPng);
void background_color_handler(const char *buf, int len, struct png_data *currPng);

// type definitions

typedef void (*chunk_handler_ptr)(const char *buf, int len, struct png_data *currPng);

struct chunk_handler {
    const char *type;
    chunk_handler_ptr func;
};

const struct chunk_handler chunk_handlers[] = {
    {"IHDR", header_handler},
    {"tIME", time_handler},
    {"pHYs", phys_pixel_dims_handler},
    {"bKGD", background_color_handler},
    { NULL, NULL }
};

#endif