//
//  KartViewController.m
//  qatardeals
//
//  Created by MAAMARSUM on 1/11/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "CartViewController.h"
#import "DefineMainValues.h"
#import "DefineServerLinks.h"

#import "ModelProduct.h"
#import "InterfaceManager.h"

#import "ProductViewController.h"
#import "ProductOrganizer.h"
#import "CredentialManager.h"

@interface CartViewController (){
    
   
    NSArray *arrayPopulateTable;
    
    
}

@end

@implementation CartViewController
@synthesize AuthenticationServer,tableViewCartList;


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
    
    
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    
    if ([CredentialManager FetchCredentailsSavedOffline]) {
        
        
        [self loadCartFromServer];
    }else{
    
    [self loadCartOffline];
    }
}
-(void) loadCartOffline
{
    NSString * key =@"CartItems";
    
    arrayPopulateTable = [self loadArrayFromUserDefaultsWithKey:key];
    
    if (arrayPopulateTable) {
        
        
        
        
        
        [tableViewCartList reloadData];
        
        
    }else{
        
        
        tableViewCartList.hidden=YES;
        
        [InterfaceManager DisplayAlertWithMessage:@"No items to display"];
        
    }
    
}
-(void) loadCartFromServer
{
    
    
    
    arrayPopulateTable = [[NSMutableArray alloc]init];
    
    
    NSDictionary * userDetails = [CredentialManager FetchCredentailsSavedOffline];
    
    NSString * userId = [userDetails valueForKey:@"UserId"];
    
    
    NSString * PostString = [NSString stringWithFormat:@"customer_id=%@&lan=%@",userId,@"1"];
    
    
    AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getcustomerkart PostData:PostString];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        NSDictionary * Result1 = JSONDict;
        
        
        
        if (Result1) {
            
            NSString * status = [Result1 valueForKey:@"status"];
            
            
            if ([status isEqualToString:@"Success"]) {
                
                
            
            
                NSArray * jsonArray = [JSONDict valueForKey:@"data"];
                
                
                arrayPopulateTable    =   [ProductOrganizer convertServerArrayToModelProductArray:jsonArray];
                
                
                [tableViewCartList reloadData];
                
                
                
                NSLog(@"%@",[JSONDict valueForKey:@"Name"]);
                
                
            
            
            }
            
            
        }
        
        
        
    } FailBlock:^(NSString *Error) {
        
        
        [InterfaceManager DisplayAlertWithMessage:Error];
        
    }];

    
    
}
-(NSMutableArray *)loadArrayFromUserDefaultsWithKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey: key];
    NSMutableArray* obj = (NSMutableArray*)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}


//***************************************  Delegates   *************************************************//


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
  //  mykartTableViewCell *cellForLastCell= (mykartTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"lastCell"];
    
    UITableViewCell *cellForHorseList= [tableView dequeueReusableCellWithIdentifier:@"HorseList" forIndexPath:indexPath];
    
    
    
   // NSArray *tableCellArray =[[NSBundle mainBundle]loadNibNamed:@"mykartTableViewCell" owner:self options:nil];
    
    ModelProduct * productObj =  [arrayPopulateTable objectAtIndex:indexPath.row];
    if ([indexPath row]<arrayPopulateTable.count) {
        
        UILabel * labelName = (UILabel*) [cellForHorseList viewWithTag:101];
        UILabel * labelPrice = (UILabel*) [cellForHorseList viewWithTag:102];
        UIImageView * imageViewPreview = (UIImageView*) [cellForHorseList viewWithTag:103];
        
        labelName.text= productObj.productName;
        labelPrice.text = productObj.productPrice;
        
        imageViewPreview.image = productObj.productImage;
        
        return cellForHorseList;
        
        
    }
    else
        
    {
     //   cellForLastCell=[tableCellArray objectAtIndex:1];
        
     //   cellForLastCell.selectionStyle= UITableViewCellSelectionStyleNone;
     //   cellForLastCell.userInteractionEnabled=NO;
        
        
        
     //   cellForLastCell.frame= CGRectMake(cellForLastCell.frame.origin.x, cellForLastCell.frame.origin.y, tableView.frame.size.width, cellForLastCell.frame.size.height);
        
        
     //   return cellForLastCell;
        
    }
    
    
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductViewController *viewproductVCobj = [self.storyboard instantiateViewControllerWithIdentifier:@"productview"];
    
    
    viewproductVCobj.thisProduct = [arrayPopulateTable objectAtIndex:indexPath.item];
    
    
    [self.navigationController pushViewController:viewproductVCobj animated:NO];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayPopulateTable.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<arrayPopulateTable.count) {
        return 80;
    }else
        return 40;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
   return YES;
}
-(BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
@end
