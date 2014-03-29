//
//  ContactInfo.m
//  Class that outlines the unit of data for a contact
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ContactInfo.h"

@implementation ContactInfo

- (IBAction)showPicker:(id)sender
{
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    _firstName = (NSString *) CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    _lastName = (NSString *) CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
}



@end
