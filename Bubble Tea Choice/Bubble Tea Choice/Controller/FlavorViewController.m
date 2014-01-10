//
//  FlavorViewController.m
//  Bubble Tea Choice
//
//  Created by David Aghassi on 1/7/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import "FlavorViewController.h"
#import "UserDecisions.h"

@implementation FlavorViewController
- (IBAction)userDidFinishChoice:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[UserDecisions returnFlavorsOptions] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Setup the cell..
    cell.textLabel.text = [[UserDecisions returnFlavorsOptions]objectAtIndex:indexPath.row];
    
    return cell;
}
@end
