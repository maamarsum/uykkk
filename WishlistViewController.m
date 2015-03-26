//
//  WishlistViewController.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "WishlistViewController.h"
#import "ModelProduct.h"
#import "ProductViewController.h"
#import "CredentialManager.h"
#import "BinSystemsServerConnectionHandler.h"
#import "DefineServerLinks.h"
#import "ProductOrganizer.h"

@interface WishlistViewController ()
{
    
    NSArray *arrayPopultateTable;
}
@end
@implementation WishlistViewController
@synthesize tableViewWishList;
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
        
        [self loadCartOnline];
        
    }else{
        [self loadCartOffline];
        
        
    }

    
}
-(void) loadCartOnline
{
    NSDictionary * userDetails = [CredentialManager FetchCredentailsSavedOffline];
    
    NSString * userId = [userDetails valueForKey:@"UserId"];

    
    NSString * PostString = [NSString stringWithFormat:@"customer_id=%@&lan=%@",userId,@"1"];
    
    
    
    BinSystemsServerConnectionHandler *AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getWishList PostData:PostString];
    
    
    
    //specify method in first argument
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST" :^(NSDictionary *JSONDict) {
        
        
        
        NSDictionary *data = JSONDict;
        
        NSString * status = [data valueForKey:@"status"];
        if ([status isEqualToString:@"Success"]) {
            
            NSArray * arrayProducts = [data valueForKey:@"data"];
            
            
          arrayPopultateTable =  [ProductOrganizer convertServerArrayToModelProductArray:arrayProducts];
                      
            [tableViewWishList reloadData];
        }
        
        
        
        
        
        
    } FailBlock:^(NSString *Error) {
        
        
        
        [InterfaceManager DisplayAlertWithMessage:@"Failed to load"];
        
        
        
        
        
    }];
    

    
    
}
-(void) loadCartOffline
{
     NSString * key =@"WishListItems";
    
    arrayPopultateTable = [self loadArrayFromUserDefaultsWithKey:key];
    
    if (arrayPopultateTable) {
        
        
        //ANythig????
        
        
        [tableViewWishList reloadData];
        
        
    }else{
        
        
        tableViewWishList.hidden=YES;
        
        [InterfaceManager DisplayAlertWithMessage:@"No items to display"];
        
    }
    
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
    
    ModelProduct * productObj =  [arrayPopultateTable objectAtIndex:indexPath.row];
    if ([indexPath row]<arrayPopultateTable.count) {
        
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayPopultateTable.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<arrayPopultateTable.count) {
        return 80;
    }else
        return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductViewController *viewproductVCobj = [self.storyboard instantiateViewControllerWithIdentifier:@"productview"];
    
    
    viewproductVCobj.thisProduct = [arrayPopultateTable objectAtIndex:indexPath.item];
    
    
    [self.navigationController pushViewController:viewproductVCobj animated:NO];
    
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

@end
