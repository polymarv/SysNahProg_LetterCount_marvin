/*===================================================================
 * DHBW Ravensburg - Campus Friedrichshafen
 *
 * Vorlesung Systemnahe Programmierung (SNP)
 *
 *===================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <sys/time.h>

#define BUFSIZE 20


// function prototypes
extern int uint64_to_ascii(char *s, uint64_t value, int digits);


uint64_t values[] = {
            10,
           999,
         10000,
    1234567890,
        987654,
       5900000,
     888888888,
   12345678901,
             0
};


int
main(int argc, char *argv[])
{
    char buffer1[BUFSIZE];
    char buffer2[BUFSIZE];
    int digits;

    int idx = 0;
    do {
        sprintf(buffer1, "'%10ld'", values[idx]);
        memset(buffer2, 0, sizeof(buffer2));
        digits = uint64_to_ascii(buffer2, values[idx], 10);
        printf("%14s '%s' %2d\n", buffer1, buffer2, digits);
    } while(values[idx++] != 0);

    exit(EXIT_SUCCESS);
} /* end of main */
