//
//  DEMOMenuViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BinSystemsServerConnectionHandler.h"

@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
     NSMutableIndexSet *expandedSections;
}

extern BOOL lisFromRight;
@property(nonatomic,retain)BinSystemsServerConnectionHandler *AuthenticationServer;
@property(nonatomic,retain)NSString * category_id;

@property(nonatomic,retain)NSMutableArray *arraycategory;
@end
