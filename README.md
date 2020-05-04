# fast-atoi - Kai Pinckard

using 1000 iterations
## atoi:
Best run time overall: 0.037066s

## naive atoi implementation:
Best run time overall: 0.017485s

## convertv1:
Best run time overall: 0.008297s

## convertv2:
Best run time overall: 0.007677s

## convertv3:
Best run time overall: 0.007637s

## convertv4:
Best run time overall: 0.003904s

## convertv5:
Best run time overall: 0.004001s

## (Fastest) convertv6:
Best run time overall: 0.003871s

## convertv7 simd:
Best run time overall: 0.017665s

## convertv8 simd:
Best run time overall: 0.008194s

I tried working with uint16 but it was not helpful
to make this work i casted the nums array as an array of uint16s and then acessed 2i;
