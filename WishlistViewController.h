//
//  WishlistViewController.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceManager.h"

@interface WishlistViewController : UIViewController<UITableViewDataSource,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableViewWishList;
@end
