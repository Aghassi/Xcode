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
UserDecisions *decision = nil;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)trueButton:(id)sender {
    if(!decision){
        decision = [[UserDecisions alloc]init];
    }
    [decision updateUI:[sender currentTitle]];
}

- (IBAction)falseButton:(id)sender {
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
}

- (IBAction)backButton:(id)sender {
}
@end
