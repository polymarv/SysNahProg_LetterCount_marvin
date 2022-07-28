/*===================================================================
 * DHBW Ravensburg - Campus Friedrichshafen
 *
 * Vorlesung Systemnahe Programmierung (SNP)
 *
 * frac_test.c
 *
 *===================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <sys/time.h>

#define BUFSIZE 10

// function prototypes
extern int frac_to_ascii(char *s, uint64_t a, uint64_t b);

uint64_t data[][2] = {
    {  12344,100000},
    {  12345,100000},
    {  12345,12344},
    {      0,10000},
    {      1,10000},
    {      4,10000},
    {      5,10000},
    {      9,10000},
    {     10,10000},
    {    999,100000},
    {   9999,100000},
    {  99900,100000},
    {  99990,100000},
    {  99999,100000},
    {      0,100000},
    {      4,100000},
    {      5,100000},
    {     11,100000},
    {     14,100000},
    {     15,100000},
    {9999999,10000000},
    {0,0}
};


int
main(int argc, char *argv[])
{
    char buffer[BUFSIZE];

    int i = 0;
    do {
        int cc = frac_to_ascii(buffer, data[i][0], data[i][1]);
        buffer[cc] = '\0';
        printf("%s  ", buffer);
        if((data[i][1] == 0) || (data[i][0] > data[i][1])) {
            printf("#.####");
        } else {
            printf("%1.4lf", (double)data[i][0]/(double)data[i][1]); 
        }
        printf("  %ld/%ld\n", data[i][0], data[i][1]);
    } while(data[i++][1] != 0);
    printf("\n");

    exit(EXIT_SUCCESS);
} /* end of main */
