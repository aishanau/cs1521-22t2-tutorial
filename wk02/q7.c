#include <stdio.h>

// translate to simple C then translate to MIPS

int main(void) {
    for (int x = 24; x < 42; x += 3) {
        printf("%d\n",x);
    }
}