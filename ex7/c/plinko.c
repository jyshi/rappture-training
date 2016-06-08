#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define LEVELS 9

int
main(int argc, char **argv)
{
    int max, drop, i, pos, count[LEVELS+1];
    double rnum;

    printf("how many drops?\n");
    if (scanf("%d", &max) != 1) {
        fprintf(stderr,"bad number!\n");
        exit(1);
    }

    for (i=0; i < LEVELS+1; i++) {
        count[i] = 0;
    }

    for (drop=0; drop < max; drop++) {
        pos = LEVELS;
        for (i=0; i < LEVELS; i++) {
            pos += (drand48() < 0.5) ? -1 : 1;
        }
        count[pos/2]++;
    }

    printf("Statistics:\n");
    for (i=0; i < LEVELS+1; i++) {
        printf("Bucket %d: %d\n", i, count[i]);
    }
    return 0;
}
