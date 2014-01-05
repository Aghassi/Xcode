//
//  UserDecisions.m
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "UserDecisions.h"
#import "Node.h"
#import "Choices.h"
#import "ViewController.h"

@implementation UserDecisions{
    NSMutableArray *answers;
}

//Overrides the init method to define instance variables
-(id)init{
    self = [super init];
    
    if(self){
        self.answerCount = 0;
        self.childrenCount = 1;
        [Choices initializeMainOptions];
    }
    
    return self;
}

-(void)updateUI:(NSString *)answer{
    //Add the answer to the list of answers
    [self addAnswer:answer];
    
    //Updates the count if No is the starting choice
    if ([answer isEqualToString:@"No Milk"]) {
        self.childrenCount = 2;
    }
    
    //Sets the children count to look at the current child
    self.childrenCount = (_childrenCount * 2)+1;
    
    //If less sweet or more sweet, show answers
    if([ answer isEqualToString:@"Less Sweet"] || [answer isEqualToString:@"More Sweet"]){
        ViewController *viewHelper = [[ViewController alloc]init];
        [viewHelper.trueButton setHidden:true];
        [viewHelper.falseButton setHidden:true];
        [viewHelper.backButton setHidden:true];
        [viewHelper.choicesText setHidden:true];
        [viewHelper.choicesLabel setHidden:true];
        
    }
    
    
}

//Adds an answer to the NSMutableList to be looked up at the end
//Of the decision cycle
-(void)addAnswer:(NSString *)answer{
    if(!answers){
        answers = [[NSMutableArray alloc]initWithCapacity:9];
    }
        Node *nodeCurrent = nil;
        int index = 1;
        
        //Checks if the answer exists
        if ([answer isEqualToString:[Choices getMainOption:answer]]) {
            //Gets the index of the answer
            index = [Choices getIndexOfMainOption:answer];
            
            //Checks if it is an even or odd index
            //Checks that it isn't an answer we already went through
            if (index%2 == 0 && index > self.answerCount) {
                nodeCurrent = [[Node alloc]init:answer withNumber:1];
            }
            else if (index %2 != 0 && index > self.answerCount){
                nodeCurrent = [[Node alloc]init:answer withNumber:0];
            }
            else{
                //This should never happen
                UIAlertView *failed = [[UIAlertView alloc]initWithTitle:@"You broke it!" message:@"This shouldn't happen, really it shouldn't. Fuck..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [failed show];

            }
            
            [answers setObject:nodeCurrent atIndexedSubscript:self.answerCount];
            self.answerCount++;
            //Update choices through button press, not here.
        
        
        
    }
    
}

@end