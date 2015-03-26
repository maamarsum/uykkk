//
//  DEMOHomeViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BinSystemsServerConnectionHandler.h"
#import "ModelUser.h"
#import "SlideNavigationController.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,SlideNavigationControllerDelegate>

@property (strong,nonatomic) BinSystemsServerConnectionHandler * AuthenticationServer;


@property (strong,nonatomic) ModelUser* FeederUserObject;



@property (strong, nonatomic) IBOutlet UIScrollView *Scrollview;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewRecentDeals;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewMyDeals;
@property (strong, nonatomic) IBOutlet UIView *bgview;





- (IBAction)showMenu;

@end










