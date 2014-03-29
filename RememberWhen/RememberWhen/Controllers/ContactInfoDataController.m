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

-(void) initializeDefaultDataList{
    NSMutableArray *contactList = [[NSMutableArray alloc]init];
    
    self.masterContactInfoList = contactList;
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
    return [self.masterContactInfoList count];
}

//Returns the object at a given index
-(ContactInfo *)objectInListAtIndex: (NSUInteger)index{
    return [self.masterContactInfoList objectAtIndex:index];
}

//Adds an contact with info to the list
-(void)addContactInfoWithInfo:(ContactInfo *)info{
    [self.masterContactInfoList addObject:info];
}

@end
