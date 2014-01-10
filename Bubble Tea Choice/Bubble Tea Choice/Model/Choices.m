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
        _11 = @[@"Kumquat-Lemon ",
                @"Green Apple ",
                @"Kiwi ",
                @"Grapefruite ",
                @"Lemon "];
        NSLog(@"Tangy: Initialized");
        
        _101 = @[@"Mango ",
                 @"Strawberry ",
                 @"Blackberry ",
                 @"Rasberry ",
                 @"Grape ",
                 @"Passion Fruit ",
                 @"Lychee ",
                 @"Peach (white) ",
                 @"Rose ",
                 @"Rose-Lychee ",
                 @"Pineapple "];
        NSLog(@"Fruity More Sweet Milk: Initialized");
        
        _100 = @[@"Peach ",
                 @"Honey ",
                 @"Peppermint ",
                 @"Honeydew "];
        NSLog(@"Fruity Less Sweet Milk: Initialized");
        
        _011 = _101;
        NSLog(@"Fruity More Sweet No Milk: Initiated");
        
        _010 = _100;
        NSLog(@"Fruity Less Sweet No Milk: Initialized");
        
        _001 = @[@"Boba",
                 @"Almond ",
                 @"Coconut ",
                 @"Coffee",
                 @"Red Bean ",
                 @"Green Milk ",
                 @"Mocha"];
        NSLog(@"Earthy Less Sweet: Initialized");
        
        _000 = @[@"Thai ",
                 @"Taro ",
                 @"Vanilla ",
                 @"Chocolate ",
                 @"Vanilla Latte ",
                 @"Chai "];
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
            [self throwErrorMessage];
        }
    }
    
    return returnString;
}

//Gets the answer stored at the index being passed in
+(NSString *)getMainOptionAtIndex:(unsigned int)index{
    NSLog(@" %@", _mainOptions[index]);
    return _mainOptions[index];
}

//Gets the index of the option being passed in
+(int)getIndexOfMainOption:(NSString *)answer{
    int index = 0;
    if ([_mainOptions containsObject:answer]) {
        index = [_mainOptions indexOfObject:answer];
    }
    
    return index;
}

//Checks if the main options has the answer being passed in
+(BOOL)mainOptionsContains:(NSString *)answer{
    return [_mainOptions containsObject:answer];
}

#pragma -Dictionary Methods-

//Returns the size of the dictionary
+(int)getDictionarySize{
    return [_lookUp count];
}

//Returns true if the node being looked up exists in the dictionary
+(BOOL)containsKey:(NSString *)key{
    if ([_lookUp objectForKey:key] == nil) {
        return false;
    }
    else{
        return true;
    }
}

//Gets the node at the given key
+(NSArray *)getNodeForKey:(NSString *)key{
    id returnKey = nil;
    
    //If it exists, put the object in a value to be returned.
    if ([_lookUp objectForKey:key] != nil) {
        returnKey = [_lookUp objectForKey:key];
    }
    else{
        [self throwErrorMessage];
    }
    
    return returnKey;
}

#pragma -Error Handling-

+(void)throwErrorMessage{
    UIAlertView *failed = [[UIAlertView alloc]initWithTitle:@"String not found!" message:@"The string you are looking for could not be found in the array" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [failed show];
}

@end
