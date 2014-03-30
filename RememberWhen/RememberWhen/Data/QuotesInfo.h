//
//  QuotesInfo.h
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuotesInfo : NSObject <NSCoding>

@property(nonatomic, strong)NSString *quote;
@property(nonatomic) int recordID;

@end
