#include <stdio.h>

// translate to simple C then translate to MIPS

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto small_big;
    if (x >= 1000) goto small_big;
        printf("medium\n");
        goto return_label;
    small_big:
        printf("small/big\n");
    
    return_label:
        return 0;
}
