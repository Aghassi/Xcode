//
//  main.c
//  Heap
//
//  Created by David on 12/30/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int x;
    int y;
}Point;
int main(int argc, const char * argv[])
{

    //Create the buffer
    char *textBuffer = malloc(sizeof(char) * 2000);
    
    //Print out the buffer by using it
    printf("textBuffer Address: %p \n", textBuffer);
    
    //clean up the buffer
    free(textBuffer);
    //Make it NULL just incase we accidently re-use it. We don't want to
    textBuffer = NULL;
    
    //Create a point dynamically on the heap
    Point *point = malloc(sizeof(Point));
    
    (*point).x = 100;
    point->y =200;  //Short hand deferencing notation
    
    printf("Point: (%d, %d) \n", point->x, point->y);
    
    free(point);
    point = NULL;
    
    return 0;
}

