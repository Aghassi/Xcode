//
//  ContactInfo.h
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContactInfo : NSObject <NSCoding>

//Contact information
@property(nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, copy) UIImage *picture;
@property (nonatomic, strong) NSDate *date;

//Used to look up the person in address book via a unique ID
@property (nonatomic) int recordID;


@end
