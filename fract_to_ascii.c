// Type your code here, or load an example.
#include <stdint.h>
int frac_to_ascii(char *s, uint64_t a, uint64_t b) {
    if(b == 0 || a > b){
        for(int cnt = 0; cnt < 6; cnt ++){
            s[cnt] = '#';
        }
    }
    else{
        uint64_t buffer = a*10000/b;
        if(a == b){
            s[0] = '1';
        } else{
            s[0] = '0';
        }
        for (int i = 5; i >= 2; --i)
        {
            //s[i] = '#';
            unsigned  mask;
            mask = (1 << 4) - 1;
            uint8_t intNumber = buffer & mask;
            s[i] = '0' + intNumber;
            buffer >>= 4;
        }
    }
    s[1] = '.';
    return 6;
}