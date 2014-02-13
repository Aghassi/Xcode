//
//  DetailViewController.h
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactInfo;

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) ContactInfo *info;

//Information regarding the new contact being added
@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImage *imageLabel;

@end
