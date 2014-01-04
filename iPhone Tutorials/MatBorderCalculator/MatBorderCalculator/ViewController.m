//
//  ViewController.m
//  MatBorderCalculator
//
//  Created by David on 1/3/14.
//  Copyright (c) 2014 David. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)calculateButtonPressed:(id)sender {
    NSLog(@"The caclulate button works!");
    [self calculateBoarder];    //Seperates the logic from button pressed
}

//Allows reuse of logic
- (void) calculateBoarder{
    float imageWidth = [self.imageWidthTextField.text floatValue];
    float imageHeight = [self.imageHeightTextField.text floatValue];
    
    float frameWidth = [self.frameWidthTextField.text floatValue];
    float frameHeight = [self.frameHeightTextField.text floatValue];
    
    float borderWidth = (frameWidth - imageWidth)/2;
    float borderHeight = (frameHeight - imageHeight)/2;
    
    NSLog(@" Border: %f x %f", borderWidth, borderHeight);
    
    self.leftBorderLabel.text = [NSString stringWithFormat:@"%.2f", borderHeight];
    self.bottomBorderLabel.text = [NSString stringWithFormat:@"%.2f", borderWidth];
    [self hideKeyboard];
}

-(void)hideKeyboard {
    [self.frameHeightTextField resignFirstResponder];
    [self.frameWidthTextField resignFirstResponder];
    
    [self.imageHeightTextField resignFirstResponder];
    [self.imageWidthTextField resignFirstResponder];
}
@end
