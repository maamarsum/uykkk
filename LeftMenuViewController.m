//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

#import "BinSystemsServerConnectionHandler.h"
#import "DefineServerLinks.h"
#import "CategoryTableViewCell.h"
#import "AppGlobalVariables.h"
#import "HomeViewController.h"
#import "DealsbycategoryViewController.h"
#import "AppGlobalVariables.h"
#import "TabBarController.h"
#import "LoginViewController.h"
#import "CredentialManager.h"



@implementation LeftMenuViewController
{
    
    
    UIButton * buttonSignIN;
    NSArray * arrayMenu;
}
#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}
-(void) viewWillAppear:(BOOL)animated
{
    
    if ([CredentialManager FetchCredentailsSavedOffline]) {
        
        [buttonSignIN setHidden:YES];
        
    }else{
        
        [buttonSignIN setHidden:NO];
        
    }
    
    
}
- (void)viewDidLoad
{
	[super viewDidLoad];
    
    
    arrayMenu = [AppGlobalVariables sharedInstance].arrayMainMenuItems;
	
    [self.tableView reloadData];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        
//        
//        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//        imageView.image = [UIImage imageNamed:@"logo.png"];
//        imageView.layer.masksToBounds = YES;
//        imageView.layer.cornerRadius = 50.0;
//        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        imageView.layer.borderWidth = 3.0f;
//        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
//        imageView.layer.shouldRasterize = YES;
//        imageView.clipsToBounds = YES;
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
//        label.text = @"QATAR DEALS";
//        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
//        label.backgroundColor = [UIColor clearColor];
//        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
//        
//        [label sizeToFit];
//        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//        
//        [view addSubview:imageView];
//        [view addSubview:label];

         buttonSignIN = [UIButton buttonWithType:UIButtonTypeCustom];
                                   
        buttonSignIN.frame =CGRectMake(20, 40, 200, 50);
        
        buttonSignIN.backgroundColor = [UIColor redColor];
      
       // buttonSignIN.center = view.center;
        
        buttonSignIN.layer.cornerRadius = 10.f;
        
        
        
        [buttonSignIN setTitle:@"SignIn/SignUp" forState:UIControlStateNormal];
        
        [view addSubview:buttonSignIN];
        
        
        [buttonSignIN addTarget:self action:@selector(signInAction) forControlEvents:UIControlEventTouchUpInside];
        
        view;
        
        
    });

    
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return arrayMenu.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryTableViewCell *cellForLastCell= (CategoryTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"lastCell"];
    
    CategoryTableViewCell *cellForcategorylist= (CategoryTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Categorylist"];
    
    //if (cellForHorseList==NULL||cellForLastCell==NULL) {
    
    NSArray *tableCellArray =[[NSBundle mainBundle]loadNibNamed:@"CategoryTableViewCell" owner:self options:nil];
    
    
    if ([indexPath row]<arrayMenu.count) {
        cellForcategorylist=[tableCellArray objectAtIndex:0];
        
        cellForcategorylist.backgroundColor = [UIColor clearColor];
        
        
        
        cellForcategorylist.lbname.text=[[arrayMenu objectAtIndex:indexPath.row]valueForKey:@"name"];
        
        NSLog(@"%@",cellForcategorylist.lbname.text);
        
        
        cellForcategorylist.frame= CGRectMake(cellForcategorylist.frame.origin.x, cellForcategorylist.frame.origin.y, tableView.frame.size.width, cellForcategorylist.frame.size.height);
        
        return cellForcategorylist;
        
        
        
    }
    else
        
    {
        cellForLastCell=[tableCellArray objectAtIndex:1];
        
        cellForLastCell.selectionStyle= UITableViewCellSelectionStyleNone;
        cellForLastCell.userInteractionEnabled=NO;
        
        
        
        cellForLastCell.frame= CGRectMake(cellForLastCell.frame.origin.x, cellForLastCell.frame.origin.y, tableView.frame.size.width, cellForLastCell.frame.size.height);
        
        
        return cellForLastCell;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    TabBarController * tabbarr = [AppGlobalVariables sharedInstance].appTabBar;
                                    
    
    if (tabbarr) {
        
        
        id topVC = tabbarr.viewControllers[0];
        
        if ([topVC isKindOfClass:[UINavigationController class]]) {
            
            topVC = (DealsbycategoryViewController*)((UINavigationController*)topVC).viewControllers[0];
        }
        
        if ([topVC isKindOfClass:[DealsbycategoryViewController class]]) {
            
            
            NSString *category_id = [[arrayMenu objectAtIndex:indexPath.row]valueForKey:@"category_id"] ;
       
            [topVC reloadDealsWithNewCategoryId:category_id];
            
            
            
            [[SlideNavigationController sharedInstance] closeMenuWithCompletion:nil];
            
        }else{
            
            
          UINavigationController * nav =  [AppGlobalVariables sharedInstance].firstTabNavigationController;
            
            
            DealsbycategoryViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"dealsbycategory"];
      
              vc.category_id = [[arrayMenu objectAtIndex:indexPath.row]valueForKey:@"category_id"] ;
            
            
            [nav setViewControllers:[NSArray arrayWithObject:vc] animated:YES];
            
            [tabbarr switchFirstViewTabWithViewController:nav];
           
            tabbarr.selectedIndex=0;
            
            
            [[SlideNavigationController sharedInstance] closeMenuWithCompletion:nil];
            
        }
        
    }

    tabbarr.selectedIndex=0;
    
    [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
    
}
-(void) signInAction
{
    
    
    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:nil];
    
        LoginViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginview"];
        
        [[SlideNavigationController sharedInstance] presentViewController:VC animated:YES completion:nil];

    
    
    
    
}

@end
