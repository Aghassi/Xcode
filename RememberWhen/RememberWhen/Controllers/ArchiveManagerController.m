//
//  ArchiveManagerController.m
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ArchiveManagerController.h"

@implementation ArchiveManagerController


/**Contact retrieval**/
#pragma Contact Data
//Gets the path for the contacts and returns it.
+(NSString *)getPathForContacts {
    
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docDir = [paths objectAtIndex: 0];
    
    NSString* docFile = [docDir stringByAppendingPathComponent:@"ContactsInfo.plist"];
    
    return docFile;
    
}

//Saves the contacts
+(void)saveContactDataToDisk:(NSMutableDictionary *)dictionary{    
    [NSKeyedArchiver archiveRootObject:dictionary toFile:[self getPathForContacts]];
}

//Unarchives the contacts and returns a mutable dictionary
+(NSMutableDictionary *)retrieveContactDataFromDisk{
    NSMutableDictionary *returnDictionary = (NSMutableDictionary *)[NSKeyedUnarchiver
                                            unarchiveObjectWithFile:[self getPathForContacts]];
    
    return returnDictionary;
    
}



/**Quotes retrieval**/
#pragma Quotes Data

//Archives quotes
-(void)saveQuotesDataToDisk:(NSMutableDictionary *)dictionary{
    [NSKeyedArchiver archiveRootObject:dictionary toFile:[self getPathForQuotes]];
}

//Unarchives quotes and returns a mutable dictionary
-(NSMutableDictionary *)retrieveQuotesDataFromDisk{
    NSMutableDictionary *returnDictionary = (NSMutableDictionary *)[NSKeyedUnarchiver
                                                                    unarchiveObjectWithFile:[self getPathForQuotes]];
    return returnDictionary;
}

//Returns the path to the file for quotes.
-(NSString *)getPathForQuotes {
    
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docDir = [paths objectAtIndex: 0];
    
    NSString* docFile = [docDir stringByAppendingPathComponent:@"QuotesInfo.plist"];
    
    return docFile;
    
}

@end
