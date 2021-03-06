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
#import "ArchiveManagerController.h"

@interface MasterViewController () {
    ContactInfo *currentContact;
    NSUInteger lastSize;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataController = [[ContactInfoDataController alloc]init];
    
    //Restore data from disk
    self.archivalManager = [[ArchiveManagerController alloc]init];
    [self.dataController restoreDataListFromDisk:[ArchiveManagerController retrieveContactDataFromDisk]];
    
    //Set button as edit button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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
    currentContact.recordID =  ABRecordGetRecordID(person);
    
    currentContact.picture = _picture;
    currentContact.date = _date;
    
    if (!self.dataController) {
        self.dataController = [[ContactInfoDataController alloc]init];
    }
    [self.dataController addContactInfoWithInfo:currentContact];
    
    [self updateTableView];

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    currentContact = nil;
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table View

//Called after a person is added to the list
-(void)updateTableView{
    //If the size of the list has increased since last time, we know we have a new item
    //We can then add that item to the table view
    if (lastSize<[self.dataController countOfList]) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.dataController countOfList]-1 inSection:0];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths: indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
    
    //Set the last size so we don't keep expanding the table view.
    lastSize = [self.dataController countOfList];
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
    return YES;
}

//Called when removing an object from the table
//Object is removed from list
//List is saved
//Table view is reloaded
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Prior to removal");
    NSLog(@"%@", [self.dataController objectInListAtIndex:indexPath.row].firstName);
    
    // Remove the row from data model
    [self.dataController removeContactInfoWithInfo:[self.dataController objectInListAtIndex:indexPath.row]];
    NSLog(@"After removal");
    NSLog(@"%@", [self.dataController objectInListAtIndex:indexPath.row].firstName);
    
    //Reload data
    [self.tableView reloadData];
}

//Sets the table to editable
- (void)setEditing:(BOOL)editing animated:(BOOL)animate
{
    [super setEditing:editing animated:animate];
    if(editing)
    {
        NSLog(@"editMode on");
    }
    else
    {
        NSLog(@"Edit mode off");
    }
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
