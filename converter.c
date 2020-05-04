/*
 * Trivial implementation of converter function.
 * You may override this file or create your own.
 */
#include "converter.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void convert_all(unsigned nlines, char *lines[], quote_t nums[])
{
  for (unsigned i = 0; i < nlines; i++) {
    nums[i] = atoi(lines[i]);
  }
}

void printdigits(char *lines[])
{
    for (unsigned i = 1436645; i < 1436656; i++)
    {
        unsigned j = 0;
        printf("%ld %d %d %d %d = %d %d %d %d |= %d\n", sizeof(lines[i]), lines[i][j], lines[i][j+1], lines[i][j+2], lines[i][j+3], lines[i][j+4], lines[i][j+5], lines[i][j+6], lines[i][j+7], lines[i][j+8]);
    }
}

void naive_convert(unsigned nlines, char *lines[], quote_t  nums[])
{
    /* for (unsigned i = 0; i <= nlines; i++)
    {
        for (unsigned j = 0; j <= strlen(lines[i]); j++)
        {
            printf("%d\n", lines[i][j]);
        }
    } */

     for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = 0;
        for (unsigned j = 0; j < strlen(lines[i]); j++)
        {
            number = (number + (lines[i][j] - 48)) * 10;
        }
        number = number/10;
        nums[i] = number;
        //printf("%d\n", number);
    }
}
