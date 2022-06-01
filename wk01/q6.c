#include <stdio.h>

// from index 0 to 10 

// from index 10 to 0

void printArray(int n, int nums[]) {
    // base case 
    if (n < 0) {
        return;
    }
    // recursive case
    printf("%d\n", nums[n]);
    printArray(n - 1, nums);
}

// rewrite this to be a recursive function
int main(void)
{
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    printArray(9, nums);
    return 0;
}