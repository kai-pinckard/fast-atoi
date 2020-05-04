# fast-strconvert

using 1000 iterations
atoi:
Best run time overall: 0.037066s

naive atoi implementation:
Best run time overall: 0.016786s


convert v1 implementation:
Best run time overall: 0.008184s


convert v3:
Best run time overall: 0.004237s

convert v4:
Best run time overall: 0.00392s

convert v5:
Best run time overall: 0.003877s

convert v7:
Best run time overall: 0.003752s

convert v8 simd:
Best run time overall: 0.0182s

I tried working with uint16 but it was not helpful
to make this work i casted the nums array as an array of uint16s and then acessed 2i;
