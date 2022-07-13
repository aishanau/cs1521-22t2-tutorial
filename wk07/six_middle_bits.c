#include <stdint.h>
#include <stdio.h>

#define MASK 0x7E000

uint32_t six_middle_bits(uint32_t value) {
    // 00000000 00000000 01011011 10100000
    // 00000000 00000111 11100000 00000000 &
    // 00000000 00000000 01000000 00000000 >> 13
    // 00000000 00000000 00000000 00000010
    
    // now we need to shift to the right 
    // return 6 middle bits
    return (value & MASK) >> 13;
}

int main() {
    printf("the six middle bits are %x\n", six_middle_bits(23456));
}