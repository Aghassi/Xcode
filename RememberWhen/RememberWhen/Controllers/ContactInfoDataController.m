//
//  ContactInfoDataController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ContactInfoDataController.h"
#import "ArchiveManagerController.h"

//Class extention with private initialize method
@interface ContactInfoDataController ()

-(void) initializeDefaultDataList;

@end

@implementation ContactInfoDataController
/**Variables**/
//Stores the current list of names to be shown
NSMutableDictionary *contactList;

//initializes the data set to be used
-(void) initializeDefaultDataList{
     contactList= [[NSMutableDictionary alloc]init];
}

-(id)init{
    if (self = [super init]) {
        [self initializeDefaultDataList];
        
        return self;
    }
    self.archivalManager = [[ArchiveManagerController alloc]init];
    
    return nil;
}

//Restores the contact list to that which is fed in from disk.
-(void)restoreDataListFromDisk:(NSMutableDictionary *)restoreDictionary{
    if (!restoreDictionary) {
        contactList = [[NSMutableDictionary alloc]init];
    }
    else{
        contactList = restoreDictionary;
    }
}


//Methods implemented

//Returns length of list
-(NSUInteger)countOfList{
    return [contactList count];
}

//Returns the object at a given index
-(ContactInfo *)objectInListAtIndex: (NSUInteger)index{
    //Create enumerator
    NSEnumerator *enumerator = [contactList objectEnumerator];
    
    //The current Contact Info to be returned
    id value;
    
    //The count until index is reached
    int count = 0;
    
    //Count until we get to the index that is wished.
    //Each count will assign value to the object that is at the NEXT
    //option
    while ((count <= index)) {
        /* code that acts on the dictionary’s values */
        value = [enumerator nextObject];
        count++;
    }
    return  value;
}

//Adds an contact with info to the list
-(void)addContactInfoWithInfo:(ContactInfo *)info{
    //Only add the object if the key value (based on the recordID) doesn't exist
    if(![contactList objectForKey:[NSNumber numberWithInt:info.recordID]]){
        [contactList setObject:info forKey:[NSNumber numberWithInt:info.recordID]];
        
#pragma Save Data
        //Save new information to disk
        [ArchiveManagerController saveContactDataToDisk:contactList];
        
    }
}

//Returns the list of items
-(NSMutableDictionary *)returnList{
    return  contactList;
}

@end
