#include <stdio.h>

int main(void) {
    char str[10];
    str[0] = 'H';
    str[1] = 'i';
    str[2] = '\0';
    printf("%s", str);
    return 0;
}
//  0   1   2   3   4   5   6  7   8   9
// [H] [i] [\0] [ ] [ ] [ ] [ ] [ ] [ ] [ ]