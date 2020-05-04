/*
 * Trivial implementation of converter function.
 * You may override this file or create your own.
 */
#include "converter.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "nmmintrin.h"

void convert_all(unsigned nlines, char *lines[], quote_t nums[])
{
  for (unsigned i = 0; i < nlines; i++) {
    nums[i] = atoi(lines[i]);
  }
}

void naive_convert(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = 0;
        for (unsigned j = 0; j < strlen(lines[i]); j++)
        {
            number = (number * 10) + (lines[i][j] - 48);
        }
        nums[i] = number;
    }
}

//remove call to strlen in inner loop
void convertv1(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = 0;
        unsigned j = 0;
        unsigned c = lines[i][0];
        while(c != 0)
        {
            number = (number*10) + (lines[i][j] - 48);
            j++;
            c = lines[i][j];
        }
        nums[i] = number;
        //printf("%d\n", nums[i]);
    }
}


//i tried to convert the outer loop to use char comparison
//convert outer loop to use char comparison as well


//remove unused space temp variables
void convertv2(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = 0;
        char* line = lines[i];
        while(*line != '\0')
        {
            number = (number*10) + (*line++ - 48);
        }
        nums[i] = number;
    }
}

//remove the inner while loop since all calls are between 3 and 4 digits
void convertv3(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = lines[i][0] - 48;

        number = (number * 10) + (lines[i][1] - 48);
        number = (number * 10) + (lines[i][2] - 48);
        
        if (lines[i][3] != '\0')
        {
            number = (number * 10) + (lines[i][3] - 48);
            if (lines[i][4] != '\0')
            {
                number = (number *10  )+ (lines[i][4] - 48);
            }
        }
        nums[i] = number;
    }
}

//use compiler using built in expect to facilitate branch prediction
void convertv4(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        uint32_t number = lines[i][0] - 48;
        number = (number * 10) + (lines[i][1] - 48);
        number = (number * 10) + (lines[i][2] - 48);
        
        if (__builtin_expect(lines[i][3] != '\0', 1))
        {
            number = (number * 10) + (lines[i][3] - 48);
            if (__builtin_expect(lines[i][4] != '\0', 0))
            {
                number = (number *10  )+ (lines[i][4] - 48);
            }
        }
        nums[i] = number;
    }
}

//this is slightly slower for unknown reasons
//use compiler using built in expect to facilitate branch prediction
void convertv5(unsigned nlines, char *lines[], quote_t  nums[])
{
    //handle the last value first and add a sentinel to remove iteration
    // variable
    unsigned last = nlines-1;
    char* line = lines[last];
    uint32_t number = line[0] - 48;

    number = (number * 10) + (line[1] - 48);
    number = (number * 10) + (line[2] - 48);
    
    if (__builtin_expect(line[3] != '\0', 1))
    {
        number = (number * 10) + (line[3] - 48);
        if (__builtin_expect(line[4] != '\0', 0))
        {
            number = (number *10  )+ (line[4] - 48);
        }
    }
    nums[last] = number;

    while(*lines != NULL)
    {
        char* line = lines[0];
        uint32_t number = line[0] - 48;

        number = (number * 10) + (line[1] - 48);
        number = (number * 10) + (line[2] - 48);
        
        if (__builtin_expect(line[3] != '\0', 1))
        {
            number = (number * 10) + (line[3] - 48);
            if (__builtin_expect(line[4] != '\0', 0))
            {
                number = (number *10  )+ (line[4] - 48);
            }
        }
        *nums = number;
        nums++;
        lines++;
    }
}

// Fastest
// Combining multiple addition operations
void convertv6(unsigned nlines, char *lines[], quote_t  nums[])
{
    uint32_t number;
    for (unsigned i = 0; i < nlines; i++)
    {
        number = lines[i][0];
        number = (number * 10) + lines[i][1];
        number = (number * 10) + lines[i][2] - 5328;
        
        if (__builtin_expect(lines[i][3] != '\0', 1))
        {
            number = (number * 10) + lines[i][3] - 48;
            if (__builtin_expect(lines[i][4] != '\0', 0))
            {
                number = (number * 10)+ lines[i][4] - 48;
            }
        }
        nums[i] = number;
    }
}
 
// Use simd when we have 4 contiguous nums with 4 chars
 void convertv7(unsigned nlines, char *lines[], quote_t  nums[])
{
    for (unsigned i = 0; i < nlines; i++)
    {
        char* line = lines[i];
        // check if we can use simd
        if (nlines - i > 4 && line[4] ==  '\0' && line[9] ==  '\0' && line[14] ==  '\0' && line[19] ==  '\0')
        {
            // number = lines[i][0];
            nums[i] =  line[0];
            nums[i+1] = line[5];
            nums[i+2] =  line[10];
            nums[i+3] =  line[15];
            __m128i chunk = _mm_loadu_si128((const __m128i*)&nums[i]);
                
            // number = (number * 10) + lines[i][1];
            __m128i factors = _mm_setr_epi32(10, 10, 10, 10);
            __m128i result = _mm_mullo_epi32(chunk, factors);

            nums[i] = line[1];
            nums[i+1] = line[6];
            nums[i+2] = line[11];
            nums[i+3] = line[16];
            chunk =  _mm_loadu_si128((const __m128i*)&nums[i]);
            result = _mm_add_epi32(result, chunk);

            // number = (number * 10) + lines[i][2];
            factors = _mm_setr_epi32(10, 10, 10, 10);
            result = _mm_mullo_epi32(result, factors);
            nums[i] = line[2];
            nums[i+1] = line[7];
            nums[i+2] = line[12];
            nums[i+3] = line[17];
            chunk =  _mm_loadu_si128((const __m128i*)&nums[i]);
            result = _mm_add_epi32(result, chunk);

            // number = (number * 10) + lines[i][3] - 53328;
            factors = _mm_setr_epi32(10, 10, 10, 10);
            result = _mm_mullo_epi32(result, factors);
            nums[i] = line[3];
            nums[i+1] = line[8];
            nums[i+2] = line[13];
            nums[i+3] = line[18];
            chunk =  _mm_loadu_si128((const __m128i*)&nums[i]);
            result = _mm_add_epi32(result, chunk);
            chunk = _mm_setr_epi32(-53328, -53328, -53328, -53328);
            result = _mm_add_epi32(result, chunk);
            
            _mm_storeu_si128((__m128i*)&nums[i], result);
            i += 3; //since 1 is added in the loop
        }
        else
        {
            uint32_t number = lines[i][0];
            number = (number * 10) + line[1];
            number = ((number * 10) + line[2]) - 5328;
            
            if (__builtin_expect(lines[i][3] != '\0', 1))
            {
                number = (number * 10) + (line[3] - 48);
                if (__builtin_expect(lines[i][4] != '\0', 0))
                {
                    number = (number *10  )+ (line[4] - 48);
                }
            }
            nums[i] = number;
        }
    }
}

//using 16 bit integers
void convertv8(unsigned nlines, char *lines[], quote_t  nums[])
{
    uint16_t number;
    char * line;
    uint16_t* nms = (uint16_t*)nums;
    for (unsigned i = 0; i < nlines; i++)
    {
        line = lines[i];
        number = line[0];
        number = (number * 10) + line[1];
        number = (number * 10) + line[2] - 5328;
        
        if (__builtin_expect(line[3] != '\0', 1))
        {
            number = (number * 10) + line[3] - 48;
            if (__builtin_expect(line[4] != '\0', 0))
            {
                number = (number * 10  )+ line[4] - 48;
            }
        }
        nms[2*i] = number;
    }     
}
 