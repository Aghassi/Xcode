//
//  main.m
//  Strings
//
//  Created by David on 12/31/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        NSString *name = @"David";
        NSLog(@" My name is %@", name);
        
        NSUInteger length = [name length];
        NSLog(@"Length of name: %lu", length);
        
    }
    return 0;
}

