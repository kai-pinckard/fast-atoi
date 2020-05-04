/*
 * API for converter function--do not change this file!
 */
#include <inttypes.h>

typedef uint32_t quote_t;

void convert_all(
    unsigned nlines,  // How many lines do we need to convert?
    char *lines[],    // Array of size nlines pointers to null-terminated strings
    quote_t nums[]    // Array of size nlines for the resulting outputs
);

void naive_convert(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv1(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv2(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv3(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv4(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv5(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv6(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);

void convertv7(
    unsigned nlines,  
    char *lines[],    
    quote_t nums[]);
