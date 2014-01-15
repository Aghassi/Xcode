//
//  ListViewController.m
//  Sosh Reader
//
//  Created by David Aghassi on 1/13/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ListViewController.h"
#import "ViewController.h"
#import "Nodes.h"

@implementation ListViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [ViewController arraySize];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Setup the cell..
    cell.textLabel.text = [NSString stringWithFormat:@"%d: %@", ((Nodes *)[[ViewController returnSortedArray]objectAtIndex:(NSUInteger)indexPath.row]).length, ((Nodes *)[[ViewController returnSortedArray]objectAtIndex:(NSUInteger)indexPath.row]).line];
    NSLog(@"%d: %@", ((Nodes *)[[ViewController returnSortedArray]objectAtIndex:(NSUInteger)indexPath.row]).length, ((Nodes *)[[ViewController returnSortedArray]objectAtIndex:(NSUInteger)indexPath.row]).line);
    return cell;
}
@end
