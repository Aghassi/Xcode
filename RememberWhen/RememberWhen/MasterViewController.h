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
@class ArchiveManagerController;


@interface MasterViewController : UITableViewController <ABPeoplePickerNavigationControllerDelegate>

@property(strong, nonatomic)ContactInfoDataController *dataController;
@property(strong, nonatomic)ArchiveManagerController *archivalManager;

//picture to be copied from contact info
@property (nonatomic, copy) UIImage *picture;
@property (nonatomic, strong) NSDate *date;

//Called to load the contacts to load from
-(IBAction)showPicker:(id)sender;

@end
