//
//  ContactInfoDataController.m
//  RememberWhen
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ContactInfoDataController.h"

//Class extention with private initialize method
@interface ContactInfoDataController ()

-(void) initializeDefaultDataList;

@end

@implementation ContactInfoDataController
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
    
    return nil;
}


//Methods implemented

//Returns length of list
-(NSUInteger)countOfList{
    return [contactList count];
}

//Returns the object at a given index
-(ContactInfo *)objectInListAtIndex: (NSUInteger)index{
    NSEnumerator *enumerator = [contactList objectEnumerator];
    id value;
    int count = 0;
    while ((count <= index)) {
        /* code that acts on the dictionary’s values */
        value = [enumerator nextObject];
        count++;
    }
    return  value;
}

//Adds an contact with info to the list
-(void)addContactInfoWithInfo:(ContactInfo *)info{
    if(![contactList objectForKey:[NSNumber numberWithInt:info.recordID]]){
        [contactList setObject:info forKey:[NSNumber numberWithInt:info.recordID]];
    }
}

//Returns the list of items
-(NSMutableDictionary *)returnList{
    return  contactList;
}

@end
