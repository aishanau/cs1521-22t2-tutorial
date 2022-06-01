#include <stdio.h>

// assuming n = 4
// 4! = 4 * 3 * 2 * 1   (4 * 3!)
// 3! =     3 * 2!
// 2! =         2 * 1!
// 1! =             1 * 0!
// 0! =                 1
int factorial(int n) {
    // base case
    if (n == 0) {
        return 1;
    }
    // recursive case
    return n * factorial(n - 1);
}

int main(void)
{
    int n;
    printf("Enter a number:\n");
    scanf("%d", &n);
    printf("%d\n", factorial(n));
    return 0;
}


