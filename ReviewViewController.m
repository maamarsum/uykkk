//
//  ReviewViewController.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 28/01/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "ReviewViewController.h"
#import "ModelProduct.h"
#import "DefineServerLinks.h"
#import "DefineMainValues.h"
#import "InterfaceManager.h"
#import "ReviewTableViewCell.h"

@interface ReviewViewController (){
    
    NSMutableArray *reviewtabledata;
    NSArray *arrayreviewProducts;
}

@end

@implementation ReviewViewController
@synthesize textviewreview,textfieldreviewname,AuthenticationServer,reviewtable,productId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)buttonActionBack:(id)sender {
    
    
//    UINavigationController * nav = (UINavigationController*)self.presentingViewController;
//    
//    if ([nav.topViewController isKindOfClass:[ProductViewController class]]) {
//        
//        
//        ProductViewController *VC = (ProductViewController*)nav.topViewController;
//        
//        
//        VC.didTappedBuy= NO;
//        
//    }
   [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loaddatatotable];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Buttonaddreview:(id)sender {
    
    
    if ([textfieldreviewname.text length] == 0){
        
        [self ShowAlertView:@"Name field is empty"];
        
        [self.textfieldreviewname becomeFirstResponder];
        
        
        
        
    }else if ([textviewreview.text length] == 0){
        
        [self ShowAlertView:@"review field is empty"];
        
        [self.textviewreview becomeFirstResponder];
        
    }
    
    
    
    
    
    else
        
    {
        
        
        NSDictionary * userDetails = [CredentialManager FetchCredentailsSavedOffline];
        
        NSString * customerId = [userDetails valueForKey:@"UserId"];
        
        if (!userDetails) {
            
            
            
        }
        // NSString *customerid = @"11";
        
        NSString *rating = @"5";
        
        NSString *reviewname=textfieldreviewname.text;
        NSString *reviewtext=textviewreview.text;
        
        NSString *value=productId;
        NSLog(@"request:%@",value);

        NSString *PostData= [NSString stringWithFormat:@"customer_id=%@&product_id=%@&name=%@&review=%@&rating=%@",customerId,productId,reviewname,reviewtext,rating];
        NSLog(@"request:%@",PostData);
        
        
        
        
        
        AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_addreview PostData:PostData];
        
        
        
        
        
        // specify method in first argument
        [AuthenticationServer StartServerConnectionWithCompletionHandler :@"POST":^(NSDictionary *JSONDict) {
            
            
            
            NSMutableArray * Result1 = [JSONDict valueForKey:@"status"];
            NSLog(@"status %@",Result1);
            
            
            
            if ([Result1 valueForKey:@"status"]) {
                
                
                NSLog(@"result %@",Result1);
                
                
                
                
                
                
                
            }else{
                
                
                
                
                
                [InterfaceManager DisplayAlertWithMessage:@"error in saving"];
                
                
            }
            
            
            
            
            
            
            
            
            
        } FailBlock:^(NSString *Error) {
            
            [InterfaceManager DisplayAlertWithMessage:@"Your net connection is too slow"];
            
            
        }];
    }
    
}



-(void)loaddatatotable
{
    
    
    
    NSString *PostData= [NSString stringWithFormat:@"product_id=%@",productId];
    NSLog(@"request:%@",PostData);
    
    
    reviewtabledata=[[NSMutableArray alloc]init];
    
    
    AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getreviewforproduct PostData:PostData];
    
    
    
    
    
    // specify method in first argument
    [AuthenticationServer StartServerConnectionWithCompletionHandler :@"POST":^(NSDictionary *JSONDict) {
        
        
        
        
        
        
        
        
        NSString * status = [JSONDict valueForKey:@"status"];
        
        
        if ([status isEqualToString:@"success"]) {
            
            // reviewtabledata = [JSONDict valueForKey:@"productdetails"];
            
            
            arrayreviewProducts = [JSONDict valueForKey:@"productdetails"];
            
            for (NSDictionary *categorydetails in arrayreviewProducts) {
                
                
                ModelProduct * product = [ModelProduct new];
                
                product.productReviewId= [categorydetails valueForKey:@"review_id"];
                product.productReviewName=[categorydetails valueForKey:@"author"];
                product.productReviewDateAndTime=[categorydetails valueForKey:@"date_added"];
                product.productReviewRating=[categorydetails valueForKey:@"rating"];
                product.productReviewText=[categorydetails valueForKey:@"text"];
                NSLog(@"rating %@",product.productReviewRating);
                [reviewtabledata addObject:product];
                
                // reviewtabledata =  [ProductOrganizer convertServerArrayToModelProductArray:arrayreviewProducts];
                
                
                
            }
            
            [reviewtable reloadData];
            
        }
        
        
    } FailBlock:^(NSString *Error) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Your net connection is too slow"];
        
        
    }];
    
    
    
}







-(void)ShowAlertView:(NSString*)Message{
    
    UIAlertView * Alert = [[UIAlertView alloc]initWithTitle:kApplicationName message:[NSString stringWithFormat:@"\n%@\n",Message] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    
    [Alert show];
    
    
}



#pragma mark -
#pragma mark UITableView Datasource





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return [reviewtabledata count];
    NSLog(@"count: %@",reviewtabledata);
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    ReviewTableViewCell * cellForReviewList= (ReviewTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ReviewList"];
    
    if (tableView==reviewtable) {
        
        
        
        
        
        
        
        
        NSArray *tableCellArray =[[NSBundle mainBundle]loadNibNamed:@"ReviewTableViewCell" owner:self options:nil];
        
        
        
        
        if ([indexPath row]<reviewtabledata.count) {
            
            cellForReviewList=[tableCellArray objectAtIndex:0];
            
            
            cellForReviewList.contentView.layer.cornerRadius = 10;
            cellForReviewList.contentView.layer.masksToBounds = YES;
            
            
            
            ModelProduct * productdetails = [ModelProduct new];
            productdetails=[reviewtabledata objectAtIndex:indexPath.row];
            
            
            
            cellForReviewList.reviewName.text =  productdetails.productReviewName;
            NSLog(@"name %@",productdetails.productReviewName);
            
            cellForReviewList.reviewDate.text = productdetails.productReviewDateAndTime;
            cellForReviewList.reviewRating.text = productdetails.productReviewRating;
            cellForReviewList.reviewText.text = productdetails.productReviewText;
            
        }
    }
    
    return cellForReviewList;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView== reviewtable) {
        return 80;
    }else
        return 30;
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
