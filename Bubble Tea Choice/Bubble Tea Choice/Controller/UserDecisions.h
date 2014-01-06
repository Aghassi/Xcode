//
//  UserDecisions.h
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol updateUIDelegate <NSObject>

-(void)hideAll;
-(void)updateOutput:(NSString *)output;
-(void)updateTrueButton:(NSString *)trueString;
-(void)updateFalseButton:(NSString *)falseString;

@end

@interface UserDecisions : NSObject

//UI Delegate
@property(nonatomic, strong)id<updateUIDelegate> delegate;

@property(nonatomic) int answerCount;   //The number answer the user is on
@property(nonatomic) int childrenCount; //Helps search through the main options in an order

-(id) init;
//Update the ui on screen
-(void)updateUI:(NSString *)answer;

//Updates the answers chosen. Called by updateUI.
-(void)addAnswer:(NSString *)answer;

@end
