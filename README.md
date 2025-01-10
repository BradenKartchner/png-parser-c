# png-parser-c

PNG Parser in C

# for reference

https://datatracker.ietf.org/doc/html/rfc2083
https://progbook.org/png.html

# PNG file format basics

Basics:

-   PNG starts with a signature: sequence of bytes that can be used to identify the file as a PNG
-   Signiture is followed by multiple chunks, where each chunk contains a different kind of information about the file, including the actual image data
-   each chunk is identified by 4 characters and includes: the identifier, the length, the actual data, and the CRC (cyclic redundancy check)
-   CRC is a checksum used to ensure the contents of the buffer are valid

The signature is 8 bytes long and contains the following values (hex):
| 89 | 50 | 4E | 47 | 0D | 0A | 1A | 0A |
| --- | --- | --- | --- | --- | --- | --- | --- |

In ASCII, bytes 2-3 are "PNG"
bytes 5-6 are "\r\n" and byte 8 is also "\n"

After the signature, the series of chunks begins.
Each chunk has the following format:
| Length | Chunk type | Chunk data | CRC |
| --- | --- | --- | --- |
| 4 bytes | 4 bytes | _length_ bytes | 4 bytes |
