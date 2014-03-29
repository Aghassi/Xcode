//
//  DetailViewController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma Dealing with quotes

-(IBAction)addQuote:(id)sender{
    UIAlertView *quote = [[UIAlertView alloc] initWithTitle:@"Input Quote"
                                                   message:@"Enter quote here"
                                                  delegate:nil
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil, nil];
    quote.alertViewStyle = UIAlertViewStylePlainTextInput;
    [quote show];
}

#pragma mark - Managing the detail item

- (void)setContactInfo:(ContactInfo *) newContactInfo{
    if (_info != newContactInfo) {
        _info = newContactInfo;
        
        //Update the view.
        [self configureView];
    }
}


- (void)configureView
{
    // Update the user interface for the detail item.
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
