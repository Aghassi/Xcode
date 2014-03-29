//
//  MasterViewController.h
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
@class ContactInfoDataController;


@interface MasterViewController : UITableViewController <ABPeoplePickerNavigationControllerDelegate>

@property(strong, nonatomic)ContactInfoDataController *dataController;

//Name and picture to be copied from contact info
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, copy) CIImage *picture;
@property (nonatomic, strong) NSDate *date;

-(IBAction)showPicker:(id)sender;

@end
