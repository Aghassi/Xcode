//
//  Node.m
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "Node.h"

@implementation Node

//Initiates with a node that contains the answer and the place it will be stored
-(id)init:(NSString *)answer withNumber:(unsigned int)number{
    self = [super init];
    if(self){
        self.answer = answer;
        self.place = number;
        
    }
    return self;
};

@end
