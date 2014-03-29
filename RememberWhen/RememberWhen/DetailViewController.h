//
//  DetailViewController.h
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactInfo.h"

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) ContactInfo *info;


@end
