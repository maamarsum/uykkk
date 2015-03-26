//
//  DEMOSecondViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BinSystemsServerConnectionHandler.h"
@interface DealsbycategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>




@property (strong,nonatomic) BinSystemsServerConnectionHandler * AuthenticationServer;

//IBObjects
@property (strong, nonatomic) IBOutlet NSString *category_id;
@property (strong, nonatomic) IBOutlet UITableView *tableViewProductList;
@property(nonatomic,retain)IBOutlet NSMutableArray *arraydealsDetailsRecieved;
- (IBAction)showMenu;
- (IBAction)buttonActionSort:(id)sender;

- (IBAction)buttonActionFilter:(id)sender;
- (IBAction)cancelSortView:(id)sender;
-(void)reloadDealsWithNewCategoryId :(NSString*) categoryId;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewGridDetails;
@property (strong, nonatomic) IBOutlet UITableView *tableVIewSortOptions;
@property (strong, nonatomic) IBOutlet UIView *viewSortView;
@property (strong, nonatomic) IBOutlet UIView *viewFilterView;
@property (strong, nonatomic) IBOutlet UITableView *tableFilterCategories;
@property (strong, nonatomic) IBOutlet UITableView *tableFilterFinalSelection;
@property (strong, nonatomic) IBOutlet UIButton *gridbutton1;
@property (strong, nonatomic) IBOutlet UIButton *gridbutton2;





@end
