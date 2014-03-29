//
//  ArchiveManagerController.h
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveManagerController : NSObject

//Stores data to a plist for the list of contacts
+(void)saveContactDataToDisk:(NSMutableDictionary *)dictionary;
+(NSMutableDictionary *)retrieveContactDataFromDisk;
+(NSString *)getPathForContacts;

//Stores data from the quotes to disk
-(void)saveQuotesDataToDisk:(NSMutableDictionary *)dictionary;
-(NSMutableDictionary *)retrieveQuotesDataFromDisk;
-(NSString *)getPathForQuotes;

@end
