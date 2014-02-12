//
//  ContactInfo.m
//  Class that outlines the unit of data for a contact
//
//  Created by David Aghassi on 2/12/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ContactInfo.h"

@implementation ContactInfo

//Adds name and picture to the property.
-(id)initWithName:(NSString *)name picture:(CIImage *)picture time:(NSDate *)date{
    self = [super init];
    if (self) {
        _name = name;
        _picture = picture;
        _date = date;
        
        return  self;
    }
    
    return nil;
    
}

@end
