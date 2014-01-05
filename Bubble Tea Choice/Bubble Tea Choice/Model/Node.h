//
//  Node.h
//  Bubble Tea Choice
//
//  Created by David on 1/5/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

//Getter setter methods
@property(weak, nonatomic)NSString *answer;
@property(nonatomic)unsigned int place;

//Override the initialization method
-(id)init:(NSString *)answer withNumber:(unsigned int) number;

@end
