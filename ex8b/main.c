/*
 * ----------------------------------------------------------------------
 *  MAIN PROGRAM - generated by the Rappture Builder
 * ----------------------------------------------------------------------
 */
#include "rappture.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <ctype.h>

#define NLETTERS 26
int main(int argc, char * argv[]) {
    /* stuff needed for Rappture library */
    RpLibrary* io;
    /*const char* data;*/ char line[255];
    //int err;

    const char* value1;  /* for input.string(value1) */
    int wordb = -1;         /* word search state: -1 = starting
                             *                     0 = found space
                             *                     1 = found word */
    int nwords = 0;         /* count the number of words */
    int count[NLETTERS];    /* counts for all letters being tracked */
    int i, c;

    /* open the XML file containing the run parameters */
    io = rpLibrary(argv[1]);

    if (io == NULL) {
        /* cannot open file or out of memory */
        printf("FAILED loading Rappture data\n");
        exit(1);
    }

    /*
     *********************************************************
     * Get input values from Rappture
     *********************************************************
     */
    
    /* get input value for input.string(value1) */
    rpGetString(io,"input.string(value1).current", &value1);
    

    /*
     *********************************************************
     *  Add your code here for the main body of your program
     *********************************************************
     */


    /* zero out all counts */
    for (i=0; i < NLETTERS; i++) {
        count[i] = 0;
    }
    int len = strlen(value1);
    for (i = 0; i < len; i++) {
        c = value1[i];
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
    }

    /* spit out progress messages as you go along... */
    rpUtilsProgress(0, "Starting...");
    rpUtilsProgress(5, "Loading data...");
    rpUtilsProgress(50, "Half-way there");
    rpUtilsProgress(100, "Done");

    /*
     *********************************************************
     * Save output values back to Rappture
     *********************************************************
     */
    
    /* save output value for output.histogram(value2) */
    /* this shows just one point -- modify as needed */
    /* (x,h,w) = x-coord, height of bar, and width of bar (optional) */
    for  (i = 0; i < NLETTERS; i++)
      {
	if (count[i] > 0)
	  {
	    sprintf(line, "%c %d\n", i+'a', count[i]);
	    rpPutString(io,"output.histogram(value2).component.xy", line, RPLIB_APPEND);
	  }
      }
    
    rpResult(io);
    exit(0);
}