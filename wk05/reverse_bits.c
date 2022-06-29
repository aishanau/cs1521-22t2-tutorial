#include <stdio.h>
#include <assert.h>
#include <stdint.h>

typedef uint64_t Word;

#define SIZE_OF_INT 64
#define BASE_MASK 1u // 1u << 63 

Word reverseBits(Word w) {
    // 1. loop over all 32 bits 
    Word reversed_number = 0;

    for (Word bit = 0; bit < SIZE_OF_INT; bit++) {
        // declare our masks here 
        // mask to check 
        Word check_mask = BASE_MASK << (SIZE_OF_INT - 1 - bit);
        // mask to set return value
        Word return_mask = BASE_MASK << bit;
        // check if bit is set (check if 1 or 0)
        // if bit is 1, then set the bit in the opposite direction 
        if (check_mask & w) { // if statement is always true if the return value is nonzero 
            reversed_number = reversed_number | return_mask;
        }
    }
    return reversed_number;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}