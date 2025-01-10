#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Maximum file size of 16 MB
# define MAX_SIZE (16 * 1024 * 1024)

void validate(int val, const char *msg, int whichByte);
void check_header(const char *buf);

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

    // validate file as PNG
    check_header(buf);

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

void check_header(const char *buf) {
    int pngHeaderVals[] = {0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a};
    for (unsigned int i = 0; i < 8; i++) {
        validate((unsigned char)buf[i] == pngHeaderVals[i], "header byte ", i);
    }
    printf("header valid!\n");
}