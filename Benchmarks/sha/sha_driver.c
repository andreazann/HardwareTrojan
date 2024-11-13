/* NIST Secure Hash Algorithm */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sha.c"

int main(int argc, char **argv)
{
    FILE *fin;
    SHA_INFO sha_info;
    fin = fopen("input_small.asc", "rb");
    if (fin == NULL) {
	printf("error opening %s for reading\n", *argv);
    } else {
	sha_stream(&sha_info, fin);
	sha_print(&sha_info);
	fclose(fin);
    }
    return(0);
}
