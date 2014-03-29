//
//  ContactInfo.m
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ContactInfo.h"

@implementation ContactInfo

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        _firstName = [aDecoder decodeObjectForKey:@"firstName"];
        _lastName = [aDecoder decodeObjectForKey:@"lastName"];
        _picture = [aDecoder decodeObjectForKey:@"picture"];
        _date = [aDecoder decodeObjectForKey:@"date"];
        _recordID = [aDecoder decodeIntForKey:@"uniqueID"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.picture forKey:@"picture"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeInteger:self.recordID forKey:@"uniqueID"];
}

@end
