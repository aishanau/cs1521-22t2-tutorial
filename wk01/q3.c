#include <stdio.h>
#include <stdlib.h>

int *get_num_ptr(void);

int main(void) {
    int *num = get_num_ptr();

    printf("%d\n", *num);
}

int *get_num_ptr(void) {
    int *x = malloc(sizeof(int)); // malloc gets memory from the heap 
                                  // which is not removed once function returns
    *x = 42;
    return x;
}