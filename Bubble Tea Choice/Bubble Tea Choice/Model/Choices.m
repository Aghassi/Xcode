//
//  Choices.m
//  Bubble Tea Choice
//
//  Created by David on 1/4/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "Choices.h"

@implementation Choices
//Main Option
static NSArray *_mainOptions = nil;

//Results
BOOL *_allSet = NO;          //defines whether all the answers have been initialized
static NSArray *_11 = nil;  //Tangy
static NSArray *_101 = nil; //Fruity More Sweet Milk
static NSArray *_100 = nil; //Fruity Less Sweet Milk
static NSArray *_011 = nil; //Fruity More Sweet No Milk (same as _101)
static NSArray *_010 = nil; //Fruity Less Sweet No Milk (same as _100)
static NSArray *_001 = nil; //Earthy Less Sweet
static NSArray *_000 = nil; //Earthy More Sweet

//HashTable
static NSHashTable *_lookUp = nil;


/* All available choices for the application
 Arrays are not initialized until they need to be called
 */

/*
 Initializes the main options array
 */
+(void)initializeMainOptions{
    
    if (!_mainOptions) {
        _mainOptions = @[@"Start",
                         @"Milk", @"No Milk",
                         @"Earthy",@"Fruity",
                         @"Fruity",@"Tangy",
                         @"Less Sweet", @"More Sweet"];
    }

}

/*
 Will initialize the answer lists
 */
+(void)initializeAnswers{
    if (!_allSet) {
        _11 = @[@"Kumquat-Lemon \n",
                @"Green Apple \n",
                @"Kiwi \n",
                @"Grapefruite \n",
                @"Lemon \n"];
        NSLog(@"Tangy: Initialized");
        
        _101 = @[@"Mango \n",
                 @"Strawberry \n",
                 @"Blackberry \n",
                 @"Rasberry \n",
                 @"Grape \n",
                 @"Passion Fruit \n",
                 @"Lychee \n",
                 @"Peach (white) \n",
                 @"Rose \n",
                 @"Rose-Lychee \n",
                 @"Pineapple \n"];
        NSLog(@"Fruity More Sweet Milk: Initialized");
        
        _100 = @[@"Peach \n",
                 @"Honey \n",
                 @"Peppermint \n",
                 @"Honeydew \n"];
        NSLog(@"Fruity Less Sweet Milk: Initialized");
        
        
    }
}

/*
 Will initialize the hashtable
 */
+(void)initializeHashTable{
    
}


@end
