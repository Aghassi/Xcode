//
//  ContactInfo.h
//  RememberWhen
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactInfo : UIViewController <ABPeoplePickerNavigationControllerDelegate>{
}

//Name and picture to be copied from contact info
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, copy) CIImage *picture;
@property (nonatomic, strong) NSDate *date;

-(IBAction)showPicker:(id)sender;


@end
