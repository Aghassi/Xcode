//
//  QuoteController.h
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuotesInfo.h"
@class ArchiveManagerController;

@interface QuoteController : NSObject

@property(nonatomic, strong)ArchiveManagerController *archiveManager;

//Restores quotes data
-(void)restoreQuotesDataFromDisk: (NSMutableDictionary *)restoreDictionary;

//Adds quote to dictionary
-(void)addQuoteToList:(QuotesInfo *) quote;
//Returns the dictionary of quotes.
-(NSMutableArray *)returnQuotesList;
-(int)countOfList;

@end
