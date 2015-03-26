//
//  MyordersViewController.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "MyordersViewController.h"
#import "BinSystemsServerConnectionHandler.h"
#import "DefineServerLinks.h"
#import "InterfaceManager.h"
#import "CredentialManager.h"
@interface MyordersViewController ()



@end

NSArray *arrayMyOreders,*arrayMyCancelledOrders,*arrayPopulateTable;

@implementation MyordersViewController
@synthesize tableViewOrders;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayMyOreders = [[NSArray alloc]init];
    arrayMyCancelledOrders = [[NSArray alloc]init];
    
    
    [self loadMyoreders];
    
    
}
-(void) loadMyoreders
{
    
    
    NSString * u_id = [CredentialManager FetchCredentailsSavedOffline][@"UserId"];
    
    
    NSString *PostData = [NSString stringWithFormat:@"customer_id=%@",@"33"];
    NSLog(@"Request: %@", PostData);
    
    
  BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getOrders PostData:PostData];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        
        NSString * status = [JSONDict valueForKey:@"status"];
        
        
        if ([status isEqualToString:@"Success"]) {
            
            
            
            
            
            
            arrayMyOreders = [JSONDict valueForKey:@"data"];
            
            
            arrayPopulateTable = arrayMyOreders;
            
            [tableViewOrders reloadData];
            
        }
            
        
        
        
        
    } FailBlock:^(NSString *Error) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Invalid Response, Entered into Fail Block"];
        
        
    }];
    
    
    
    
    
    
    
}
-(void) loadMyCancelledOreders
{
    
    
    NSString * u_id = [CredentialManager FetchCredentailsSavedOffline][@"UserId"];
    
    
    NSString *PostData = [NSString stringWithFormat:@"customer_id=%@",@"33"];
    NSLog(@"Request: %@", PostData);
    
    
    BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getCanceledOrders PostData:PostData];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        
        
        NSString * status = [JSONDict valueForKey:@"status"];
        
        
        if ([status isEqualToString:@"Success"]) {
            
            
            
            
            
        
       arrayMyCancelledOrders = [JSONDict valueForKey:@"data"];
        
        
            arrayPopulateTable = arrayMyCancelledOrders;
            
            [tableViewOrders reloadData];
            
        }
        
    } FailBlock:^(NSString *Error) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Invalid Response, Entered into Fail Block"];
        
        
    }];
    
    
    
    
    
    
    
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cellOrders = [tableView dequeueReusableCellWithIdentifier:@"ordersCell" forIndexPath:indexPath];
    
    
    UILabel * labelOrderId = (UILabel*)[cellOrders viewWithTag:101];
    
    UILabel * labelDateAdded = (UILabel*)[cellOrders viewWithTag:102];
    
    UILabel * labelCustomer = (UILabel*)[cellOrders viewWithTag:103];
    
    UILabel * labelStatus = (UILabel*)[cellOrders viewWithTag:104];
    
    UILabel * labelTotal = (UILabel*)[cellOrders viewWithTag:105];
    
    NSDictionary *dic = [arrayPopulateTable objectAtIndex:indexPath.row];
    
    labelOrderId.text = [dic valueForKey:@"order_id"];
    labelDateAdded.text = [dic valueForKey:@"date_added"];
    labelCustomer.text = [dic valueForKey:@"firstname"];
    labelStatus.text = [dic valueForKey:@"order_status_id"];
    labelTotal.text = [dic valueForKey:@"total"];
    
    
    
    
    return cellOrders;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return arrayPopulateTable.count;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ActionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)ActionOreders:(id)sender {
    
    [self loadMyoreders];
    
    [tableViewOrders reloadData];
    
}

- (IBAction)ActionCancelledOrders:(id)sender {
    
    [self loadMyCancelledOreders];
    
    [tableViewOrders reloadData];
}
@end
