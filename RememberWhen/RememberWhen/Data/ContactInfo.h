//
//  ContactInfo.h
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactInfo : NSObject

@property(nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, copy) CIImage *picture;
@property (nonatomic, strong) NSDate *date;


@end
