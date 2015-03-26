//
//  KartViewController.h
//  qatardeals
//
//  Created by MAAMARSUM on 1/11/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BinSystemsServerConnectionHandler.h"
#import "SlideNavigationController.h"

@interface CartViewController : UIViewController<SlideNavigationControllerDelegate>


@property (strong,nonatomic) BinSystemsServerConnectionHandler * AuthenticationServer;
@property (strong, nonatomic) IBOutlet UITableView *tableViewCartList;

@end
