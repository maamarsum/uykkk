//
//  ViewSelectCountryNLanguage.h
//  Gizmeondeals
//
//  Created by Maneesh M on 20/04/15.
//  Copyright (c) 2015 Maneesh M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSelectCountryNLanguage : UIView<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (strong, nonatomic) NSArray * arrayTableContents;
-(void)reloadTable;
@property (weak, nonatomic) IBOutlet UITableView *view;

@end
