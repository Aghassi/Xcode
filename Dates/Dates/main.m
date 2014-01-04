//
//  main.m
//  Dates
//
//  Created by David on 12/31/13.
//  Copyright (c) 2013 David. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Create a date pointer to the memory allocated in the heap
        NSDate *date = [NSDate date];
        NSLog(@"Today is %@", date);
        
        //Total number of seconds between now
        //And 1970
        double seconds = [date timeIntervalSince1970];
        NSLog(@"Seconds from 1970: %f", seconds);
        
        double secondsPerDay = 60* 60 * 24;
        int days = seconds/ secondsPerDay;
        NSLog(@"The number of days since 1970 is %d", days);
        
        
        //Nest message sends
        //Create an object by allocating memory
        //And then initializing it
        NSDate *today = [[NSDate alloc] init];
        NSDate *tomorrow = [today dateByAddingTimeInterval:secondsPerDay];
        NSLog(@"Today: %@", today);
        NSLog(@"Tomorrow: %@", tomorrow);
        
        //id - any pointer to an object (no * needed)
        id anyObject = [NSDate date];
        NSLog(@"anyObject = %@", anyObject);
        
        //nil
        NSDate *newDate = nil;
        double total = [newDate timeIntervalSince1970];
        NSLog(@" Total seconds: %f", total);    //The method is ignored because total is equal to nil
        
        //Sanity check
        NSLog(@"NewDate: %@", newDate);
        
        if(newDate){
            //Valid date
        }
        else{
            NSLog(@"New date is not valid! Nil date, fix it!");
        }
    }
    
    return 0;
}

