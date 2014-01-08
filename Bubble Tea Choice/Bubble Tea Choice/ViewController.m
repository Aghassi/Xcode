//
//  ViewController.m
//  Bubble Tea Choice
//
//  Created by David Aghassi on 1/4/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ViewController.h"
#import "UserDecisions.h"


@interface ViewController ()

@end

@implementation ViewController
//Used for calling certain methods
UserDecisions *decision = nil;
NSMutableArray *choicesArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if(!decision){
        decision = [[UserDecisions alloc]init];
        [decision setDelegate:self];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)trueButton:(id)sender {
    [decision updateUI:[sender currentTitle]];
}

- (IBAction)falseButton:(id)sender {
    [decision updateUI:[sender currentTitle]];
}

- (IBAction)resetButton:(id)sender {
    //Resets buttons and questions
    [_trueButton setTitle:@"Milk" forState:UIControlStateNormal];
    [_falseButton setTitle:@"No Milk" forState:UIControlStateNormal];
    [_outputText setText:@"Do you want milk or no milk in your tea?"];
    [_choicesText setText:@""];
    
    //Sets proper things visible and hidden
    [_trueButton setHidden:false];
    [_falseButton setHidden:false];
    [_outputText setHidden:false];
    [_choicesText setHidden:false];
    [_backButton setHidden:true];
    [_resetButton setHidden:true];
    
    //Set the answer count and children count
    //Reset answer choices list.
    decision.childrenCount = 1;
    decision.answerCount= 0;
    [decision resetAnswers];
    
}

- (IBAction)backButton:(id)sender {
    [decision removeAnswer];
    decision.childrenCount= decision.childrenCount/2;
    
    if(decision.childrenCount <0){
        decision.childrenCount = 1;
    }
    else if (decision.childrenCount <=2){
        decision.childrenCount = 1;
        [_backButton setHidden:true];
    }
    [decision updateButtonsAndText];
    
    
}

#pragma - updateUIDelegates -

//Called when the last screen is displayed
-(void)hideAll{
    [_trueButton setHidden:true];
    [_falseButton setHidden:true];
    [_backButton setHidden:true];
    [_resetButton setHidden:false];
    [_finalizeButton setHidden:false];
    
}

//Makes back button visible
-(void)makeBackVisible{
    [_backButton setHidden:false];
}

//Updates the text on the false button
-(void)updateFalseButton:(NSString *)falseString{
    [_falseButton setTitle:falseString forState:UIControlStateNormal];
}

//Updates the text on the true button
-(void)updateTrueButton:(NSString *)trueString{
    [_trueButton setTitle:trueString forState:UIControlStateNormal];
}

//Updates the output text box
-(void)updateOutput:(NSString *)output{
    [_outputText setText:output];
}

//Updates the choices textbox
-(void)updateChoices:(NSString *)choices{
    if(!choicesArray){
        choicesArray = [[NSMutableArray alloc] initWithCapacity:4];
    }
    //If this is the first button press, add string to array and display
    if([_choicesText.text isEqualToString:@""]){
        [choicesArray addObject:choices];
        _choicesText.text = [NSString stringWithFormat:@"%@", choices];
    }
    //Otherwise, add the new string to the array, and print the array
    //using a comma as a way to concatinate the string and get rid of
    //the ugly look of printing out an array.
    else{
        [choicesArray addObject:choices];
        [_choicesText setText:[NSString stringWithFormat:@"%@",[choicesArray componentsJoinedByString:@", "]]];
    }
}

//Removes the last choice from the array
-(void)removeChoiceFromArray{
    [choicesArray removeLastObject];
    [_choicesText setText:[NSString stringWithFormat:@"%@", [choicesArray componentsJoinedByString:@","]]];
    
}

#pragma - Flavor View Controller Delegate -
-(void)userDidSelectFlavor{
    
}


@end
