//
//  ViewController.h
//  Bubble Tea Choice
//
//  Created by David Aghassi on 1/4/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//Buttons for choices
- (IBAction)trueButton:(id)sender;
- (IBAction)falseButton:(id)sender;

//Navigation and reset
- (IBAction)resetButton:(id)sender;
- (IBAction)backButton:(id)sender;

//Outlets Buttons
@property (weak, nonatomic) IBOutlet UIButton *trueButton;
@property (weak, nonatomic) IBOutlet UIButton *falseButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

//Outlets for TextFields
@property (weak, nonatomic) IBOutlet UITextField *outputText;
@property (weak, nonatomic) IBOutlet UITextField *choicesText;
@property (weak, nonatomic) IBOutlet UILabel *choicesLabel;


@end
