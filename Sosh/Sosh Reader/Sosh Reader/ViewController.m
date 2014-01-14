//
//  ViewController.m
//  Sosh Reader
//
//  Created by David Aghassi on 1/13/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ViewController.h"
#import "Nodes.h"

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
        NSString *readText = [NSString stringWithContentsOfFile:@"Sonnet 1.rtf" encoding:NSASCIIStringEncoding error:nil];
        arrayOfText = [readText componentsSeparatedByString:@"\n"];
        
    }
    //Creates the sorted array if it doesn't exist
    //Inplace sorting would be bad, so copying to a new array is my choice.
    //Going to work with a version of mergesort, but with a mutable array
    //I will divide the array to the point where the node I am going to insert fits
    //Then I will insert said node using the "insertAtIndex" function
    if (!sortedArray) {
        sortedArray = [[NSMutableArray alloc]init];
    }
    
}


//Sorts the array passed into it, and stores it to sortedArray
-(void)sortByLength:(NSMutableArray *)arrayToBeSorted{
    //Grabs each line from the text file
    //Stores the line with the length in a node
    //Sorts the nodes by their length
    for(int index = 0; index <= [arrayToBeSorted count];index++){
        Nodes *textNode = [[Nodes alloc]init];
        textNode.line = arrayToBeSorted[index];
        textNode.length = [arrayToBeSorted[index] length];
        
        //Created the list if it doesn't exist
        if (!sortedArray[0]) {
            [sortedArray insertObject:textNode atIndex:index];
        }
        
        //Creates a temp array with the new highest node in the first place
        //If the current node to be added is higher than the current highest
        //node.
        //Adds the array from sorted to the temp array in their new positions
        //(thus shifting everything down one position)
        //Set the old sorted array to the new temp array
        //Set the temp array to nil so it gets cleaned up
        else if (textNode.length > ((Nodes *)sortedArray[0]).length){
            NSMutableArray *temp = [[NSMutableArray alloc]initWithObjects:textNode, nil];
            [temp replaceObjectsInRange:NSMakeRange(1, [sortedArray count])withObjectsFromArray:sortedArray];
            [sortedArray setArray:temp];
            temp = nil;
        }
        else{
            //Recursively call break down function
            //Use binary search to find the area where the new
            //Node needs to be inserted
            
        }
        
    }
    
}

//Inserts the object in the proper place of the sortedArray
-(void)findPositionIn:(NSMutableArray *)array forObject:(Nodes *)node{
    if (<#condition#>) {
        <#statements#>
    }
    
}
@end
