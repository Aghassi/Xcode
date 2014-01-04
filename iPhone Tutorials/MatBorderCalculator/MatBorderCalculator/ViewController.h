//
//  ViewController.h
//  MatBorderCalculator
//
//  Created by David on 1/3/14.
//  Copyright (c) 2014 David. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *frameWidthTextField;
@property (weak, nonatomic) IBOutlet UITextField *frameHeightTextField;

@property (weak, nonatomic) IBOutlet UITextField *imageWidthTextField;
@property (weak, nonatomic) IBOutlet UITextField *imageHeightTextField;

- (IBAction)calculateButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *leftBorderLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomBorderLabel;

@end
