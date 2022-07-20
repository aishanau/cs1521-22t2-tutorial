// Write a C program, first_line.c, which is given one command-line argument, 
// the name of a file, and which prints the first line of that file to stdout. 
// If given an incorrect number of arguments, or if there was an error opening 
// the file, it should print a suitable error message.
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>


int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("An incorrect number of arguments was supplied\n");
        exit(1);
    }
    FILE* read_stream = fopen(argv[1], "r");
    if (read_stream == NULL) {
        perror("");
        exit(1);
    }
    int c;
    while ((c = fgetc(read_stream)) != EOF) {
        fputc(c, stdout);
        if (c == '\n') {
            break;
        }
    }
    fclose(read_stream);
    return 0;
}