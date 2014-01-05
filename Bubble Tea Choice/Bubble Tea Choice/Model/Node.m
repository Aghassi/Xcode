//
//  Node.m
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "Node.h"

@implementation Node

/**
 *Overrides Init method to initialize with an answer and a number
 *@param answer The answer being passed in
 *@param number The the number assigned based on what was chosen
 **/
-(id)init:(NSString *)answer withNumber:(unsigned int)number{
    self = [super init];
    if(self){
        self.answer = answer;
        self.number = number;
        
    }
    return self;
};

@end
