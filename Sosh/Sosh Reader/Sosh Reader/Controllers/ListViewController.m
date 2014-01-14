//
//  ListViewController.m
//  Sosh Reader
//
//  Created by David Aghassi on 1/13/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "ListViewController.h"
#import "ViewController.h"

@implementation ListViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [ViewController arraySize];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Setup the cell..
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", [[ViewController returnSortedArray]objectAtIndex:indexPath.row], [[ViewController returnSortedArray]objectAtIndex:indexPath.length]];
    return cell;
}
@end
