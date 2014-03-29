//
//  MasterViewController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "ContactInfoDataController.h"

@interface MasterViewController () {
    ContactInfo *currentContact;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[ContactInfoDataController alloc]init];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Loading contacts
- (IBAction)showPicker:(id)sender
{
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    if(!currentContact){
        currentContact = [[ContactInfo alloc]init];
    }
    
    currentContact.firstName = (NSString *) CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    currentContact.lastName = (NSString *) CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
    currentContact.recordID = ABRecordGetRecordID(person);
    
    currentContact.picture = _picture;
    currentContact.date = _date;
    
    if (!self.dataController) {
        self.dataController = [[ContactInfoDataController alloc]init];
    }
    [self.dataController addContactInfoWithInfo:currentContact];
    
    [self updateTableView];

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
}


#pragma mark - Table View

//Called after a person is added to the list
-(void)updateTableView{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.dataController countOfList]-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths: indexPaths withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
}

//Denotes the number of sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Denotes the number of rows in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
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
    
    cell.textLabel.text = [self.dataController objectInListAtIndex:indexPath.row].lastName;
    cell.detailTextLabel.text = [self.dataController objectInListAtIndex:indexPath.row].firstName;
    cell.imageView.image = [self.dataController objectInListAtIndex:indexPath.row].picture;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


//Passes the necessary information from the table cell to the next scene

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowQuoteDetails"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.info = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end
