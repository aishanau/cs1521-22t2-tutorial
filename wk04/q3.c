#include <stdio.h>

int max(int a[], int length) {
    int first_element = a[0];
    if (length == 1) {
        return first_element;
    } else {
        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);
        if (first_element > max_so_far) {
            max_so_far = first_element;
        }
        return max_so_far;
    }
}

int main() {
    int array[10] = {1, 2, 3, 4, 5, 6, 4, 3, 2, 1};

    printf("%d", max(array, 10));
    printf("\n");

    return 0;
}