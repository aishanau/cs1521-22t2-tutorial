#include <stdio.h>
#include <errno.h>

int main() {
    FILE* fp = fopen("bad/pathname", "r");
    errno = ENOENT;
    printf("The error code is %d\n", errno);
    perror("");
}