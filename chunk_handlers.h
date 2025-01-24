#ifndef CHUNK_HANDLERS_H
#define CHUNK_HANDLERS_H

#include <stdlib.h>

// function prototypes

int get_big_endian(const char *buf);
int get_2_byte_big_endian(const char *buf);
void validate_length(int actualVal, int expectedVal, const char *msg);
void header_handler(const char *buf, int len);
void time_handler(const char *buf, int len);
void phys_pixel_dims_handler(const char *buf, int len);


// type definitions

typedef void (*chunk_handler_ptr)(const char *buf, int len);

struct chunk_handler {
    const char *type;
    chunk_handler_ptr func;
};

const struct chunk_handler chunk_handlers[] = {
    {"IHDR", header_handler},
    {"tIME", time_handler},
    {"pHYs", phys_pixel_dims_handler},
    { NULL, NULL }
};

#endif