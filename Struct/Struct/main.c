//
//  main.c
//  Struct
//
//  Created by David on 12/30/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#include <stdio.h>

typedef struct {
    int x;
    int y;
} Point;

int main(int argc, const char * argv[])
{
    Point myPoint;
    myPoint.x = 100;
    myPoint.y = 200;
    
    printf("Point (%d, %d) \n", myPoint.x, myPoint.y);
    
    return 0;
}

