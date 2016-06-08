#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define NLETTERS 26

int
main(int argc, char **argv)
{
    int wordb = -1;         /* word search state: -1 = starting
                             *                     0 = found space
                             *                     1 = found word */
    int nwords = 0;         /* count the number of words */
    int count[NLETTERS];    /* counts for all letters being tracked */
    int i, c;

    /* zero out all counts */
    for (i=0; i < NLETTERS; i++) {
        count[i] = 0;
    }

    printf("Type in a sentence:\n");
    c = getchar();
    while (c != '\n') {
        if (isspace(c)) {
            wordb = 0;
        } else if (isalpha(c)) {
            if (wordb != 1) {
                nwords++;
                wordb = 1;
            }
        }

        c = tolower(c) - 'a';
        if (c >= 0 && c < NLETTERS) {
            count[c]++;
        }

        c = getchar();
    }

    /* print out results */
    printf("Statistics:\n");
    printf("%d words\n\n", nwords);
    for (i=0; i < NLETTERS; i++) {
        if (count[i] > 0) {
            printf("Letter %c: %d\n", i+'a', count[i]);
        }
    }
    return 0;
}
