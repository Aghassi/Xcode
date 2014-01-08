//
//  Choices.h
//  Bubble Tea Choice
//
//  Created by David on 1/4/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;

@interface Choices : NSObject

//Initialization methods
+(void)initializeMainOptions;
+(void)initializeAnswers;
+(void)initializeDictionary;

//Getter methods for main options
+(NSString *)getMainOption:(NSString *)object;
+(NSString *)getMainOptionAtIndex: (unsigned int)index;
+(int) getIndexOfMainOption:(NSString *)answer;
+(BOOL)mainOptionsContains:(NSString *)answer;

//Getter methods for dictionary
+(int)getDictionarySize;
+(Node *)getNodeAtIndex:(unsigned int)index;

@end
