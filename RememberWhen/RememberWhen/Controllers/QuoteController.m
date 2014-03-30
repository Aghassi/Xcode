//
//  QuoteController.m
//  RememberWhen
//
//  Created by David Aghassi on 3/29/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "QuoteController.h"
#import "ArchiveManagerController.h"
#import "DetailViewController.h"

@interface QuoteController()
    -(void)initializeDefaultDataList;

@end

@implementation QuoteController

/**Variables**/
NSMutableDictionary *quotesList;
//This array is stored as the object in the dictionary
//It will contain different quotes depending on the person
NSMutableArray *quotesPerPerson;

-(void) initializeDefaultDataList{
    quotesList = [[NSMutableDictionary alloc]init];
}

-(id)init{
    if(self = [super init]){
        [self initializeDefaultDataList];
        
        return self;
    }
    self.archiveManager = [[ArchiveManagerController alloc ] init];
    
    return nil;
}

//Restores information from disk
-(void)restoreQuotesDataFromDisk:(NSMutableDictionary *)restoreDictionary{
    quotesList = restoreDictionary;
}

-(void)addQuoteToList:(QuotesInfo *)quote{
    DetailViewController *contactInfo = [[DetailViewController alloc]init];
    
    //Gets the array for the required uniqueID
    quotesPerPerson = [quotesList  valueForKey:[NSString stringWithFormat:@"%i", contactInfo.info.]];
    //Inserts the quote to the front of the list
    [quotesPerPerson insertObject:quote atIndex:0];
    
    //Stores the list again in the dictionary
    [quotesList setObject:quote forKey:[NSNumber numberWithInt:contactInfo.info.recordID]];
}

-(NSMutableArray *)returnQuotesList{
    return quotesPerPerson;
}

-(int)countOfList{
    
}

@end
