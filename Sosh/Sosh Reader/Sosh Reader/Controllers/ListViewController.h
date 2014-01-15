//
//  ListViewController.h
//  Sosh Reader
//
//  Created by David Aghassi on 1/13/14.
//  Copyright (c) 2014 Aghassi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListViewControllerDelegate <NSObject>



@end

@interface ListViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *textView;
}

@property(nonatomic, weak) id<ListViewControllerDelegate> delegate;

@end
