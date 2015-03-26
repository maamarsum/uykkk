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



@implementation LeftMenuViewController
{
    
    
    
    NSArray * arrayMenu;
}
#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
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
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
    
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"logo.png"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"QATAR DEALS";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
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

@end
