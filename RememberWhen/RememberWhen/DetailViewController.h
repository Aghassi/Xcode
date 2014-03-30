//
//  DetailViewController.h
//  RememberWhen
//
//  Created by David Aghassi on 2/11/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContactInfo;
@class QuoteController;
@class ArchiveManagerController;

@interface DetailViewController : UITableViewController <UIAlertViewDelegate>

@property (strong, nonatomic) ContactInfo *info;
@property (nonatomic) QuoteController *quoteManager;
@property (nonatomic) ArchiveManagerController *archiveManager;

-(IBAction)addQuote:(id)sender;

@end
