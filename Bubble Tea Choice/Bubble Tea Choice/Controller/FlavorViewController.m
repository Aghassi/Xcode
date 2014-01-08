//
//  FlavorViewController.m
//  Bubble Tea Choice
//
//  Created by David Aghassi on 1/7/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "FlavorViewController.h"

@implementation FlavorViewController
- (IBAction)userDidFinishChoice:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
