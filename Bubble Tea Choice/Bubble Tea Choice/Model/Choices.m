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
BOOL _allSet = false;          //defines whether all the answers have been initialized
static NSArray *_11 = nil;  //Tangy
static NSArray *_101 = nil; //Fruity More Sweet Milk
static NSArray *_100 = nil; //Fruity Less Sweet Milk
static NSArray *_011 = nil; //Fruity More Sweet No Milk (same as _101)
static NSArray *_010 = nil; //Fruity Less Sweet No Milk (same as _100)
static NSArray *_001 = nil; //Earthy Less Sweet
static NSArray *_000 = nil; //Earthy More Sweet

//Dictionary
static NSDictionary *_lookUp = nil;
static NSArray *_answerOptions = nil;   //Array of results listed above


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
        
        _011 = _101;
        NSLog(@"Fruity More Sweet No Milk: Initiated");
        
        _010 = _100;
        NSLog(@"Fruity Less Sweet No Milk: Initialized");
        
        _001 = @[@"Boba\n",
                 @"Almond \n",
                 @"Coconut \n",
                 @"Coffee\n",
                 @"Red Bean \n",
                 @"Green Milk \n",
                 @"Mocha"];
        NSLog(@"Earthy Less Sweet: Initialized");
        
        _000 = @[@"Thai \n",
                 @"Taro \n",
                 @"Vanilla \n",
                 @"Chocolate \n",
                 @"Vanilla Latte \n",
                 @"Chai \n"];
        NSLog(@"Earthy More Sweet: Initialized");
        
        
        _allSet = YES;
        [self initializeDictionary];
        
    }
}

/*
 Will initialize the hashtable
 */
+(void)initializeDictionary{
    if(!_lookUp){
        // This should never happen.
//        if (!_allSet) {
//            [self initializeAnswers];
//        }
        
        _lookUp = @{@"11": _11,
                    @"101": _101,
                    @"100": _100,
                    @"011": _011,
                    @"010": _010,
                    @"001": _001,
                    @"000": _000};
    }
    
}

/*
 Will get the string and return it from the main options
 Will through an alert if the string is not found (eg is not in the list)
 */
+(NSString *)getMainOption:(NSString *)object{
    NSString *returnString = nil;
    
    if (!returnString) {
        if([_mainOptions containsObject:object]){
            int indexOfObject = [_mainOptions indexOfObject:object];
            returnString = _mainOptions[indexOfObject];
        }
        else{
            UIAlertView *failed = [[UIAlertView alloc]initWithTitle:@"String not found!" message:@"The string you are looking for could not be found in the array" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [failed show];
        }
    }
    
    return returnString;
}

@end
