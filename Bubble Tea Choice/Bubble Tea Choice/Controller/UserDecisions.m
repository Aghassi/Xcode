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


//Called when either true or false are pressed
-(void)updateUI:(NSString *)answer{
    //Load helper
    
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
        //Hide all
        [self.delegate hideAll];
        [self.delegate updateChoices:answer];
        
    }
    else if ([Choices mainOptionsContains:answer]){
        /*
         *If Tangy, Show answer
         */
        if([answer isEqualToString:[Choices getMainOptionAtIndex:6]]){
            [self.delegate hideAll];
            [self.delegate updateChoices:answer];
        }
        
        /*
         *Update the UI to show the new choices otherwise
         */
        else{
            if ([answer isEqualToString:[Choices getMainOptionAtIndex:1]] || [answer isEqualToString:[Choices getMainOptionAtIndex:2]]) {
                [self.delegate makeBackVisible];
            }
            [self updateButtonsAndText];
            [self.delegate updateChoices:answer];
        }
    }
    
    
}

//Called when the back, true, or false buttons is pressed
-(void)updateButtonsAndText{
    [self.delegate updateTrueButton:[NSString stringWithFormat:@"%@", [Choices getMainOptionAtIndex:self.childrenCount]]];
    [self.delegate updateFalseButton:[NSString stringWithFormat:@"%@",[Choices getMainOptionAtIndex:self.childrenCount +1]]];
    [self.delegate updateOutput:[NSString stringWithFormat:@"Do you want %@ or %@ in your tea?" ,
                                 [Choices getMainOptionAtIndex:self.childrenCount],
                                 [Choices getMainOptionAtIndex:self.childrenCount +1]]];
}

-(void)displayChoices{
    [Choices initializeAnswers];
    [Choices initializeDictionary];
    
    NSString *treePathNumber;
    //See if you can get a smaller capacity in future
    NSMutableString *builder = [[NSMutableString alloc]init];
    for (int index = 0; index< [Choices getDictionarySize]; index++) {
        [builder appendString:[[NSString stringWithFormat:@" %d", [Choices getNodeAtIndex:index].number]init]];
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

//Removes an answer from the answer list
-(void)removeAnswer{
    //Decrement the count so as not to remove nothing
    self.answerCount--;
    [answers removeLastObject];
    
    //Removes last answer from the choice array
    //Also updates the onscreen display of choices.
    [self.delegate removeChoiceFromArray];
    
}

//Resets the answers array when the user calls reset
-(void)resetAnswers{
    [answers removeAllObjects];
    //NSLog(@"Answers have been reset %@", answers);
}

@end
