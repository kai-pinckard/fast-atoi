# fast-atoi - Kai Pinckard

In order to quickly convert historical S&P 500 quotes from strings of text into integers a variety of implementations of a converter function were implemented. As a baseline the performance of the standard library atoi function was measured. In an effort to address noisy measurements all benchmarking was done with 1000 iterations. 

## atoi:
Best run time overall: 0.037066s

Out of 1000 iterations, the fastest atoi was able to convert all the stock qoutes into integers was 0.037066s. 

## naive_convert:
Best run time overall: 0.017485s

This basic implementation prioritized readability and simplicity, as a result it could and will benefit from further refinements. ``naive_convert`` works by iterating over each of the char*s in the input parameter lines. For each char*  ``naive_convert`` iterates over each character, detecting the end of the char* by calling ``strlen``. 48 is subtracted from each character since that converts the character representation of the digit into the integer representation of the digit. When another digit is being processed, the previous digits are multiplied by 10 before adding the current digit. 

This implementation runs in about half as much time as atoi. The performance gain can be primarily attributed to a reduced need for error checking. For example, atoi needs to check that each character is actually a digit and needs to be able to handle negative inputs. In contrast, ``naive_convert`` assumes all inputs can be converted into natural numbers, and it is able to avoid all this error checking. 

## convertv1:
Best run time overall: 0.008297s

The first optimization to over the ``naive_convert`` method was to remove the call to strlen in the inner loop. Thus, converting it to a while loop that simply checks that the current character is not the string termination character. This optimization reduced the best run time by approximately a factor of 2 over ``naive_convert``. 

## convertv2:
Best run time overall: 0.007677s

The next improvement that was made was removing some unused temp variables and removing the interation variable for the inner loop entirely. This resulted in a modest performance gain. 

## convertv3:
Best run time overall: 0.003987s

The next optimization was made by noting that the all the input integers had at most 5 digits and at minimum 3 digits. Thus, it was possible to remove the inner loop entirely, by processing 3 digits without any conditionals and by handling any additional digits with two conditionals. This managed to nearly cut the best run time in half again. 

## convertv4:
Best run time overall: 0.003904s

The next improvement was made by noting that there are many quotes with four digits than with 5 digits. This means that it was possible to use ``__builtin_expect()`` to signal to the compiler which outcome is most likely to occur for the each of the two conditionals. This helped decrease incorrect speculative execution. Therby improving performance by about 2%. 

## convertv5:
Best run time overall: 0.004001s

The next optimization attempt actually slowed down the best run time. The idea was that iteration variables rather than directly iterating over the addresses directly adds additional overhead. In order to remove the iteration variables, a sentinel character is needed so that we can detect when the end of lines has been reached. Thus, the last line of input was processed first and it was overwritten with NULL. As a result, it was possible to identify when the end of the data to convert had been reached without using an iteration variable. Unfortunately, the overhead of this out of order processing seems to completely overshadowed any potential performance gains that could have been had.

## (Fastest) convertv6:
Best run time overall: 0.003871s

The final optimization that improved performance was combining multiple addition operations into one. This works because subtracting 5328 is equivalent to subtracting 48 from each of the first three characters before they are scaled up by the correct factor. Thereby reducing the number of addition operations that are necessary. This resulted in the best overall performance for any implementation of convert of 0.003871s about a full order of magnitude faster than atoi! 

At this point, an attempt was made to replace the multiplications by 10 with the corresponding bitwise operations. Furthermore, each line that subtracts by 48 was replaced with a ``number & 15``, which has the same effect since all the digits ascii values have the bits corresponding to 32 and 16 turned on. However, upon measuring it became clear that the compiler knew better ways to optimize multiplications and subtractions so they were reverted back and all bitwise operations were removed. 

## convertv7:
Best run time overall: 0.017665s

Recognizing that the registers were not being fully utilized when converting 32 bit integers, convert was rewritten to leverage SIMD. In order for this to work, the function checks that there are at least 4 lines left to process since the SIMD instructions will be processing 4 quotes simultaneously. It should be noted that the function could easily be rewritten to process 8 quotes simultaneously since all of the quotes actually fit into 16 bit integers. This was not done initially since processing only four at a time allowed for quicker development and testing. Upon benchmarking it was determined that the SIMD instructions were significantly slower than the non SIMD instructions. This is because it required a lot of additional data movement since SIMD requires that the data be properly aligned in contiguous memory locations. No attempt was made to rewrite the SIMD instructions to process 8 quotes simultaneously since the data movement would only become more of an issue in that case and because then some additional conversion would be required when storing the computed uint16_t integer results as uint32_t integers.

## convertv8:
Best run time overall: 0.008194s

Noting that the data is always able to fit inside a uint16_t, the convert function was rewritten to work with uint16_ts instead. This required casting nums into a uint16_t pointer and then handling the storage manually. In order to store 16 bit integers in space that was allocated for 32 bit integers, the interation index variable i was doubled before storing the 16bit integers. This works because upon testing it was discovered that the entire space reserved for nums is set to be 0. Thus, even though only the last 16 bits of each 32 bit integer are being written to, the first 16 bits have already been correctly set to 0. 


