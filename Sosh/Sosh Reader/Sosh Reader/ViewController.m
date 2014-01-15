//
//  ViewController.m
//  Sosh Reader
//
//  Created by David Aghassi on 1/13/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ViewController.h"
#import "Nodes.h"
#import "ListViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableArray *sortedArray;
NSArray *arrayOfText;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sortText:(id)sender {
    //Creates array of text to be sorted if it doesn't exist
    if (!arrayOfText) {
#warning UPDATE THIS LINE WITH THE PROPER FILE PATH
        NSString *readText = [NSString stringWithContentsOfFile:@"/Users/davidaghassi/GitHub/Xcode/Sosh/Sosh Reader/Sosh Reader/Files/Sonnet 1.txt" encoding:NSUTF8StringEncoding error:NULL];
        arrayOfText = [readText componentsSeparatedByString:@"\n"];
        
    }
    //Creates the sorted array if it doesn't exist
    //Inplace sorting would be bad, so copying to a new array is my choice.
    //Going to work with a version of mergesort, but with a mutable array
    //I will divide the array to the point where the node I am going to insert fits
    //Then I will insert said node using the "insertAtIndex" function
    [self sortByLength:arrayOfText];
    
}


//Sorts the array passed into it, and stores it to sortedArray
-(void)sortByLength:(NSArray *)arrayToBeSorted{
    //Grabs each line from the text file
    //Stores the line with the length in a node
    //Sorts the nodes by their length
    for(int index = 0; index < [arrayToBeSorted count];index++){
        Nodes *textNode = [[Nodes alloc]init];
        textNode.line = arrayToBeSorted[index];
        textNode.length = [arrayToBeSorted[index] length];
        
        //Created the list if it doesn't exist
        if (!sortedArray) {
            sortedArray = [[NSMutableArray alloc]initWithObjects:textNode, nil];
            NSLog(@"%@", ((Nodes *)sortedArray[0]).line);
        }
        
        //Creates a temp array with the new highest node in the first place
        //If the current node to be added is higher than the current highest
        //node.
        //Adds the array from sorted to the temp array in their new positions
        //(thus shifting everything down one position)
        //Set the old sorted array to the new temp array
        //Set the temp array to nil so it gets cleaned up
        else if (textNode.length > ((Nodes *)sortedArray[0]).length){
            NSMutableArray *temp = [[NSMutableArray alloc]initWithCapacity:[sortedArray count]];
            [temp insertObject:textNode atIndex:0];
//            [temp replaceObjectsInRange:NSMakeRange(1, [sortedArray count])withObjectsFromArray:sortedArray];
            [temp insertObjects:sortedArray atIndexes:[[NSIndexSet alloc]initWithIndexesInRange:NSMakeRange(1, [sortedArray count])]];
            [sortedArray setArray:temp];
            temp = nil;
        }
        //If it is the lowest length object, just add it to the end of the array
        else if (textNode.length < ((Nodes *)[sortedArray lastObject]).length){
            [sortedArray addObject:textNode];
        }
        else{
            //Recursively call break down function
            //Use binary search to find the area where the new
            //Node needs to be inserted
            [self findPositionIn:sortedArray forObject:textNode];
            NSLog(@"%@", [sortedArray description]);
        }
        
    }
    
}

//Inserts the object in the proper place of the sortedArray
-(void)findPositionIn:(NSMutableArray *)array forObject:(Nodes *)node{
    int longest = ((Nodes *)sortedArray[0]).length;
    int shortest = ((Nodes *)[sortedArray lastObject]).length;
    while (longest>=shortest) {
        int midpoint = (longest + shortest)/2;
        int midArray = [self getPositionInArray:sortedArray forLength:midpoint];
        
        if (node.length > midpoint) {
            shortest = midpoint - 1;
        }
        else if(node.length < midpoint){
            longest = midpoint + 1;
        }
        else{
            //Assign the beginning of the array to the midpoint
            //into a temp array.
            //then use the replaceObjectsInRange function to fill the end of the array
            NSMutableArray *temp = [[NSMutableArray alloc]init];
            [temp setArray:sortedArray];
            [temp insertObject:node atIndex:midArray];
            [sortedArray setArray:temp];
            temp = nil;
            break;
            NSLog(@"%@", sortedArray);
        }
    }
    
    
}

#pragma -Gathering information for sorted array-
-(NSUInteger)getPositionInArray:(NSMutableArray *)sortedArray forLength:(int)nodeLength{
    unsigned int index = 0;
    while(nodeLength <= ((Nodes *)sortedArray[index]).length) {
            index++;
    }
    return index;
}


#pragma -Forwarding Data to the TableView-
+(NSUInteger)arraySize{
    return [sortedArray count];
}

+(NSMutableArray *)returnSortedArray{
    return sortedArray;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showData"]) {
        ListViewController *listView = segue.destinationViewController;
        [listView.delegate self];
    }
}
@end
