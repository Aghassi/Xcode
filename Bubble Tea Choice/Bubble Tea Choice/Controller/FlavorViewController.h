//
//  FlavorViewController.h
//  Bubble Tea Choice
//
//  Created by David Aghassi on 1/7/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlavorViewControllerDelegate <NSObject>

@end

@interface FlavorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *flavors;
}

@property(nonatomic, weak)id<FlavorViewControllerDelegate> delegate;

@end
