//
//  Node.h
//  Bubble Tea Choice
//
//  Created by David on 1/4/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

//Setter and getter methods
@property(nonatomic)NSString *answer;
@property(nonatomic)unsigned int number;

-(id)init:(NSString *) answer withNumber:(unsigned int)number;

@end