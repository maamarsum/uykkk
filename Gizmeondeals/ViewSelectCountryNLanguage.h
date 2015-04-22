//
//  ViewSelectCountryNLanguage.h
//  Gizmeondeals
//
//  Created by Maneesh M on 20/04/15.
//  Copyright (c) 2015 Maneesh M. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopupDelegate <NSObject>


-(void) getValueFromList :(NSDictionary*) selectedValue;

@end



@interface ViewSelectCountryNLanguage : UIView<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (strong, nonatomic) NSArray * arrayTableContents;
-(void)reloadTable;
@property (weak, nonatomic) IBOutlet UIView *view;

@property(nonatomic,weak)id<PopupDelegate>delegate;

@property (weak, nonatomic) IBOutlet UILabel *labelTitleForView;

-(void)setTitle :(NSString *)titleString;
@end
