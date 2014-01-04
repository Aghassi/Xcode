//
//  main.c
//  Numbers
//
//  Created by David on 12/23/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    char letter = 'a';
    short shortInteger = 32000;
    int intInteger = 2147483647;
    long longInteger= 9223372036854775807;
    long long longlongInteger= 9223372036854775807;
    
    printf("char %c = %d \n", letter, letter);
    printf("short %d \n", shortInteger);
    printf("int %d \n", intInteger);
    printf("long %ld \n", longInteger);
    printf("long long %lld \n", longlongInteger);
    
    return 0;
}

