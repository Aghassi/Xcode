//
//  QuotesInfo.m
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "QuotesInfo.h"

@implementation QuotesInfo

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        _quote = [aDecoder decodeObjectForKey:@"quote"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_quote forKey:@"quote"];
}

@end
