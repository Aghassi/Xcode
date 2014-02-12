//
//  ContactInfo.h
//  RememberWhen
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactInfo : NSObject

//Name and picture to be copied from contact info
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) CIImage *picture;
@property (nonatomic, strong) NSDate *date;

//Init method for this model
-(id)initWithName: (NSString *)name picture:(CIImage *)picture time: (NSDate *)date;


@end
