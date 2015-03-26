//
//  RightmenuView.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 29/01/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightmenuView : UIView<UITableViewDataSource,UITableViewDataSource>


@property(nonatomic,retain)UITableView *menutableview;
@property(nonatomic,retain)NSArray *tabledata;

@end
