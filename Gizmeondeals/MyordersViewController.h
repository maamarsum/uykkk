//
//  MyordersViewController.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyordersViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)ActionBack:(id)sender;
- (IBAction)ActionOreders:(id)sender;
- (IBAction)ActionCancelledOrders:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOrders;

@end
