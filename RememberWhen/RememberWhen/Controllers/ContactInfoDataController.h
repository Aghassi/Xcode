//
//  ContactInfoDataController.h
//
//Creates the master collection that holds all BirdSighting objects
//Returns the number of BirdSighting objects in the collection
//Returns the BirdSighting object at a specific location in the collection
//Creates a new BirdSighting object using input from the user and adds it to the collection
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ContactInfo.h;

@interface ContactInfoDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterContactInfoList;

//Methods required to get size,
//add objects, and get object index
-(NSUInteger)countOfList;
-(ContactInfo *)objectInListAtIndex:(NSUInteger)theIndex;
-(void)addContactInfoWithInfo: (ContactInfo *)info;


@end
