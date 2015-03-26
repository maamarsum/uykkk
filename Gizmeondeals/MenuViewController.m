//
//  DEMOMenuViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "DealsbycategoryViewController.h"


#import "DealsbycategoryViewController.h"
#import "DefineServerLinks.h"
#import "ProductViewController.h"
#import "ModelAddHorseGlobalVariable.h"
#import "ModelProduct.h"
#import "CategoryTableViewCell.h"



@interface MenuViewController (){
    NSMutableArray *titles;
    NSMutableArray *images;
    NSMutableArray *expand;
    
     
   
    
}

@end

@implementation MenuViewController
@synthesize category_id,AuthenticationServer,arraycategory;
- (void)viewDidLoad
{
    
  
        
  //  [super viewDidLoad];
   
   
    
   
    
    }




-(void)viewWillAppear:(BOOL)animated
{
    
   
    
}
#pragma mark -
#pragma mark UITableView Delegate

/*- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}*/


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryTableViewCell *cellForLastCell= (CategoryTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"lastCell"];
    
    CategoryTableViewCell *cellForcategorylist= (CategoryTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Categorylist"];
    
    //if (cellForHorseList==NULL||cellForLastCell==NULL) {
    NSArray *tableCellArray =[[NSBundle mainBundle]loadNibNamed:@"CategoryTableViewCell" owner:self options:nil];
    
    
    if ([indexPath row]<arraycategory.count) {
        cellForcategorylist=[tableCellArray objectAtIndex:0];
        
        
        
        
        
        cellForcategorylist.lbname.text=[[arraycategory objectAtIndex:indexPath.row]valueForKey:@"name"];
        
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






#pragma mark -
#pragma mark UITableView Datasource





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return arraycategory.count;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    
    
    DealsbycategoryViewController *viewdeals = [self.storyboard instantiateViewControllerWithIdentifier:@"dealsbycategory"];
    
    viewdeals.category_id = [[arraycategory objectAtIndex:indexPath.row]valueForKey:@"category_id"];
    
 
    navigationController.viewControllers = @[viewdeals];
    
    
    
    
   
    
    
    
    
}



@end
