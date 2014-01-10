//
//  UserDecisions.h
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlavorViewController.h"

@protocol updateUIDelegate <NSObject>

-(void)hideAll;
-(void)makeBackVisible;
-(void)updateOutput:(NSString *)output;
-(void)updateChoices:(NSString *)choices;
-(void)updateTrueButton:(NSString *)trueString;
-(void)updateFalseButton:(NSString *)falseString;
-(void)removeChoiceFromArray;

@end

@interface UserDecisions : NSObject <FlavorViewControllerDelegate>
//UI Delegate
@property(nonatomic, strong)id<updateUIDelegate> delegate;

@property(nonatomic) int answerCount;   //The number answer the user is on
@property(nonatomic) int childrenCount; //Helps search through the main options in an order

//Overrides init
-(id) init;

#pragma -UI Calls-

//Update the ui on screen
-(void)updateUI:(NSString *)answer;

//Called when the back, true, or false buttons is pressed
-(void)updateButtonsAndText;

//Populates return options with proper options
-(void)gatherChoices;

#pragma -Updating Answers-

//Updates the answers chosen. Called by updateUI.
-(void)addAnswer:(NSString *)answer;

//removes an answer from answers list
-(void)removeAnswer;

//Removes all objects from answers
-(void)resetAnswers;

+(NSArray *)returnFlavorsOptions;

@end
