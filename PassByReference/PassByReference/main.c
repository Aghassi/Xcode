//
//  main.c
//  PassByReference
//
//  Created by David on 12/29/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#include <stdio.h>

void integerDevision(int a, int b, int *result, int *remainder){
    //First two variables are passed by value (copies everything)
    //The second two are passed by reference (memory address is copied, but not value)
    *result = a/b;
    *remainder = a%b;
}

int main(int argc, const char * argv[])
{

    int x = 5;
    int y = 2;
    int value = 0;
    int remainder = 0;
    
    printf("%d / %d = %d remainder %d \n",x, y, value, remainder);
    
    //Here we pass the address of the value and remainder
    integerDevision(x,y, &value, &remainder);
    printf("%d / %d = %d remainder %d \n",x, y, value, remainder);
    
    return 0;
}

