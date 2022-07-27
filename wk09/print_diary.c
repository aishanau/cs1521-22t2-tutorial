// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char *home = getenv("HOME");
    if (home == NULL) {
        home = ".";
    }
    int length = strlen(home) + 7 + 1;
    char pathname[length];
    snprintf(pathname, length, "%s/.diary", home);
    printf("The pathname is: %s\n", pathname);
    FILE* read_stream = fopen(pathname, "r");
    if (read_stream == NULL) {
        perror(pathname);
        exit(1);
    }
    int byte = fgetc(read_stream);
    while (byte != EOF) {
        fputc(byte, stdout);
        byte = fgetc(read_stream);
    }
    fclose(read_stream);




    
    // printf("%s\n", home);
    return 0;
}