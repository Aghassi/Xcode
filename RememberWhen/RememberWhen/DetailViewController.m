//
//  DetailViewController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
//Array to store quotes
NSMutableArray *savedQuotes;

#pragma Dealing with quotes

//Displays the alert
-(IBAction)addQuote:(id)sender{
    //Displays the Alert View on screen for the user to input the quote.
    UIAlertView *quote = [[UIAlertView alloc] initWithTitle:@"Input Quote"
                                                   message:@"Enter quote here"
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Save", nil];
    quote.alertViewStyle = UIAlertViewStylePlainTextInput;
    [quote show];
}

//Called when the alert view is dismissed.
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Check the title of the button
    //Store the title to a string
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Save"]){
        //If the array is not initialized, initialize it and assign the message to it
        //Otherwise add the object
        if (!savedQuotes) {
            savedQuotes = [[NSMutableArray alloc] initWithObjects:[alertView textFieldAtIndex:0], nil];
        }
        else{
            [savedQuotes addObject:[alertView textFieldAtIndex:0]];
        }
    }
}


#pragma mark - Managing the detail item

- (void)setContactInfo:(ContactInfo *) newContactInfo{
    if (_info != newContactInfo) {
        _info = newContactInfo;
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set the title of the scene
    //If no first name, use the last name
    if (_info.firstName) {
        self.navigationItem.title = [NSString stringWithFormat:@"%@'s Quotes", _info.firstName];
    }
    else{
        self.navigationItem.title = [NSString stringWithFormat:@"%@'s Quotes", _info.lastName];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
