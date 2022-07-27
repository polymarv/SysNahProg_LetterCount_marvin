// Type your code here, or load an example.
#include <stdint.h>
int uint64_to_ascii(char *s, uint64_t value, int digits) {
    int returnTest;
    while(value > 0){
        unsigned  mask;
        mask = (1 << 4) - 1;
        uint8_t intNumber = value & mask;
        returnTest = '0' + intNumber;
        value >>= 4;
    }
    return returnTest;
}