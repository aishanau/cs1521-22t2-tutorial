// remove public write from specified as command line arguments if needed

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

// chmod a file if publically-writeable

void chmod_if_needed(char *pathname) {
    struct stat info;
    if (stat(pathname, &info)) {
        perror(pathname);
        exit(1);
    }
    mode_t mode = info.st_mode;

    if (mode & S_IWOTH) {
        // change perms to not writeable here
        mode_t new_mode = mode & ~S_IWOTH;
        if (chmod(pathname, new_mode)) {
            perror(pathname);
            exit(1);
        }
        printf("removing public writeable permission from file %s\n", pathname);
    } else {
        printf("%s is not publically writeable\n", pathname);
    }

}

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }
    return 0;
}

