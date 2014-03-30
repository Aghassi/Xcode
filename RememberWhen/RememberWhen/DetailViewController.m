//
//  DetailViewController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "DetailViewController.h"
#import "QuoteController.h"

@interface DetailViewController ()
- (void)configureView;
@end

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
            [savedQuotes insertObject:[alertView textFieldAtIndex:0] atIndex:0];
        }
    }
}

#pragma Table View
//Denotes the number of sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Denotes the number of rows in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.quoteManager countOfList];
}


//Sets up the table view to show the contact info.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactInfoCell";
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
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
