//
//  ProductViewController.m
//  qatardeals
//
//  Created by Roy Leela Electronics on 30/12/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "ProductViewController.h"
#import "DefineServerLinks.h"
#import "InterfaceManager.h"
#import "ContactsViewController.h"
#import "DefineMainValues.h"
#import "ModelProduct.h"
#import "MenuViewController.h"
#import "ReviewViewController.h"
#import "MyordersViewController.h"
#import "CredentialManager.h"
#import "ValidationManger.h"

#import "LoginViewController.h"
#import "SectionHeaderView.h"
#import "Section.h"
#import "AppGlobalVariables.h"



@interface ProductViewController (){
    
    
    UITapGestureRecognizer * resignKeyboard;
    UIAlertView *alrtLogin;
    NSArray *tabledata;
    NSMutableArray *reviewdata;
    NSMutableArray *reviewdetail;
    
    CGRect ScrollviewDefaultFrame;
    CGSize scrollViewDefaultSize;
    CGPoint scrollOffset;
    
    
}

@end
#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 45


@implementation ProductViewController
@synthesize sectionArray;
@synthesize AuthenticationServer,lbprice,lbmanufacturer,lbname,labelDescription,getproduct_id,imageViewProductImage,arrayDealsDetails,JsonArray,textViewQuantity,didTappedBuy,producttable,Scrollview,reviewtable;

@synthesize textview,textfieldreview,textfieldreviewname;
@synthesize expandview;
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
    
    
    [expandview setHidden:YES];
    self.navigationController.tabBarController.tabBar.hidden=NO;
    
    
    Scrollview.frame=CGRectMake(0,150,600,450);
    [Scrollview setContentSize:CGSizeMake(600,1000)];
    tabledata=[[NSArray alloc]initWithObjects:@"maaz",@"karun",nil];
    
    
   // [self.view addSubview:[TopBarView getSharedInstance]];
    self.sectionArray=[[NSMutableArray alloc]init];
    // int i;
    for (int i=0; i<2; i++) {
        Section *section=[[Section alloc]init];
        if (i==0) {
            section.sectionHeader=[NSString stringWithFormat:@"Description"];
        }
        else if (i==1)
        {
            section.sectionHeader=[NSString stringWithFormat:@"Specification"];
        }
        
        
        // section.sectionHeader=[NSString stringWithFormat:@"Name %d",i];
        section.sectionRows=[[NSMutableArray alloc]init];
        
        //for (int i=0; i<=1; i++) {
        [section.sectionRows addObject:[NSString stringWithFormat:@"Details %d",1]];
        //}
        [self.sectionArray addObject:section];
    }
    self.producttable.sectionHeaderHeight = HEADER_HEIGHT;
    self.openSectionIndex = NSNotFound;
    
    
    imageViewProductImage.layer.borderWidth=2;
    imageViewProductImage.layer.cornerRadius=2;
    imageViewProductImage.layer.borderColor=[UIColor whiteColor].CGColor;
    didTappedBuy = false;
    tabledata = [NSArray arrayWithObjects: @"Description", @"Specification",
                 
                 nil];
    
    resignKeyboard = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:resignKeyboard];
    
    textViewQuantity.delegate = self;
    
    [self loadProductDetails];
    
    
}
-(void) loadProductDetails
{
    
    if (![ValidationManger validateProduct:_thisProduct]) {
        
        [InterfaceManager DisplayAlertWithMessage:[NSString stringWithFormat:@"Debugmsg:This product properties contains null values , pId = %@",_thisProduct.productId]];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }else{
        
        tabledata = [NSArray arrayWithObjects: _thisProduct.description, _thisProduct.description,
                     
                     nil];
        
        
        
        ModelProduct * product = [ModelProduct new];
        
        product = _thisProduct;
        
        
        lbprice.text =  product.productPrice;
        lbname.text = product.productName;
        
        textViewQuantity.text=product.productQuantity;
        labelDescription.text =  product.productDescription;
        getproduct_id=product.productId;
        NSLog(@"productis %@",getproduct_id);
        NSLog(@"%@",product.productImageUrl);
        NSLog(@"%@",product.productImage);
        
        if (product.productImage==nil) {
            
            imageViewProductImage.image = [UIImage imageNamed:@"Men_at_work.png"];
            
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                
                // ModelProduct * tempProduct = [JsonArray copy];
                
                
                NSURL * imgUrl =[NSURL URLWithString:[@"http://talenweave.com/qatardeals2/image/" stringByAppendingString:product.productImageUrl]];
                
                NSData *downloadedData = [NSData dataWithContentsOfURL:imgUrl];
                
                product.productImage = [UIImage imageWithData:downloadedData];
                
                
                
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    
                    
                    
                    if (product.productImage != nil) {
                        
                        
                        
                        imageViewProductImage.image = product.productImage
                        ;
                        
                    }
                    
                    
                    
                });
                
                
                
            });
            
            
            
            
        }else{
            
            
            imageViewProductImage.image = product.productImage;
        }
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        
    }
}

    -(void)dismissKeyBoard{
        [textViewQuantity resignFirstResponder];
        [textfieldreview resignFirstResponder];
        [textfieldreviewname resignFirstResponder];
        
        
    }
    
    - (IBAction)showMenu
    {
        // Dismiss keyboard (optional)
        //
        /*   ModelAddHorseGlobalVariable *horseDetails=[ModelAddHorseGlobalVariable getInstance];
         
         horseDetails.isFromRight = NO;
         */
        
        [self.view endEditing:YES];
    //    [self.frostedViewController.view endEditing:YES];
        
        
        
        // Present the view controller
        
        // self.frostedViewController.direction = REFrostedViewControllerDirectionLeft;
        
        //
        // [self.frostedViewController presentMenuViewController];
    }
    
    
    
    
    
    -(void)viewDidAppear:(BOOL)animated
    {
        [super viewDidAppear:YES];
        
        
        
        if ([CredentialManager FetchCredentailsSavedOffline] && didTappedBuy) {
            
            ContactsViewController *contactsCobj  =   [self.storyboard instantiateViewControllerWithIdentifier:@"contactview"];
            
            
            [self presentViewController:contactsCobj animated:YES completion:nil];
            
        }
        
        
        
        
    }
    - (IBAction)addtokartButtonAction:(id)sender{
        
        //    NSDictionary * credentials = [CredentialManager FetchCredentailsSavedOffline];
        //
        //    if (!credentials) {
        //
        //        LoginViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginview"];
        //
        //
        //         [self presentViewController:VC animated:YES completion:nil];
        //
        //
        //
        //    }else{
        
        
        [self addProductToCart];
        
        //}
        
    }
    
    
    - (IBAction)addtowishlistButtonAction:(id)sender{
        
        NSString * wishListArrayKey =@"WishListItems";
        
        NSMutableArray * arrayWishList = [self loadArrayFromUserDefaultsWithKey:wishListArrayKey];
        
        if (arrayWishList) {
            
            
            BOOL found = false;
            
            for (ModelProduct * temp in arrayWishList) {
                
                if ([temp.productId isEqualToString:_thisProduct.productId]) {
                    
                    found=true;
                }
            }
            if (!found) {
                
                [arrayWishList addObject:_thisProduct];
                [self saveCustomArrayToUserDefaults:arrayWishList withKey:wishListArrayKey];
                
            }else{
                
                [InterfaceManager DisplayAlertWithMessage:@"Product is already in WishList"];
            }
            
            
        }else{
            
            arrayWishList = [NSMutableArray arrayWithObject:_thisProduct];
            [self saveCustomArrayToUserDefaults:arrayWishList withKey:wishListArrayKey];
            
            
        }
        
        
        //   NSString *customer=@"33";
        //
        //    NSString * PostData = [NSString stringWithFormat:@"{\"customerid\":\"%@\",\"wishlist\":\"%@\",}",customer,getproduct_id];
        //    NSLog(@"request:%@",PostData);
        //
        //    AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_addtowishlist PostData:PostData];
        //
        //
        //
        //
        //
        //
        //    // specify method in first argument
        //
        //
        //    [AuthenticationServer StartServerConnectionWithCompletionHandler :@"POST":^(NSDictionary *JSONDict) {
        //
        //
        //
        //        NSMutableArray * Result1 = [JSONDict valueForKey:@""];
        //
        //
        //        if (Result1) {
        //
        //            //  [self ShowAlertView:[NSString stringWithFormat:@"Items added to wishlist"]];
        //
        //
        //            NSString * ErroCode;
        //
        //            if ([ErroCode isEqualToString:@"403"] ) {
        //
        //
        //            }else
        //            {
        //
        //
        //                [self ShowAlertView:[NSString stringWithFormat:@"Items added to Cart"]];
        //
        //
        //                }
        //
        //
        //        }
        //
        //
        //    } FailBlock:^(NSString *Error) {
        //
        //        [InterfaceManager DisplayAlertWithMessage:ServerConnectioError];
        //
        //
        //    }];
        
        
    }
    
    
    
    
    - (IBAction)Buttonbuynow:(id)sender {
        
        UIButton *button=sender;
        if (button.tag == 0) {
            [expandview setHidden:NO];
            button.tag=1;
        }else if (button.tag == 1){
            
            [expandview setHidden:YES];
            button.tag=0;
        }
        
        
        /*
        
         
         
        if ([CredentialManager FetchCredentailsSavedOffline]) {
            
            
            ContactsViewController *contactsCobj  =   [self.storyboard instantiateViewControllerWithIdentifier:@"contactview"];
            
            
            [self presentViewController:contactsCobj animated:YES completion:nil];
            
        }else{
            
            LoginViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginview"];
            
            
            
            [self.navigationController presentViewController:VC animated:YES completion:nil];
            
            didTappedBuy=true;
            
        }
        
        
        */
        
        
        // [self performSegueWithIdentifier:@"HomeToGeneralAccountInfoSegue" sender:nil];
    }
         
    
    - (IBAction)Buttonaddreview:(id)sender {
        
        
        if ([textfieldreviewname.text length] == 0){
            
            [self ShowAlertView:@"Name field is empty"];
            
            [self.textfieldreviewname becomeFirstResponder];
            
            
            
            
        }else if ([textfieldreview.text length] == 0){
            
            [self ShowAlertView:@"review field is empty"];
            
            [self.textfieldreview becomeFirstResponder];
            
        }
        
        
        
        
        
        else
            
        {
            
            NSString *customerid = @"11";
            
            NSString *rating = @"5";
            NSLog(@"%@",getproduct_id);
            
            
            
            
            NSString *PostData= [NSString stringWithFormat:@"customer_id=%@&product_id=%@&name=%@&review=%@&rating=%@",customerid,getproduct_id,textfieldreviewname.text,textfieldreview.text,rating];
            NSLog(@"request:%@",PostData);
            
            
            
            
            
            AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_addreview PostData:PostData];
            
            
            
            //     {"UserId": "12","Name": "Test","Breed":"Testbreed","BirthYear": "2009","Gender": "1","Color": "White"}
            
            
            // specify method in first argument
            [AuthenticationServer StartServerConnectionWithCompletionHandler :@"POST":^(NSDictionary *JSONDict) {
                
                
                
                NSMutableDictionary * Result1 = [JSONDict valueForKey:@""];
                
                
                
                if (Result1) {
                    
                    NSString * ErroCode = [Result1 valueForKey:@"status"];
                    
                    if (ErroCode.length!=0)
                    {
                        
                        [InterfaceManager DisplayAlertWithMessage:[NSString stringWithFormat:@"Error:%@",[Result1  valueForKey:@"ErrDescription"]]];
                    }else
                    {
                        
                        [InterfaceManager DisplayAlertWithMessage:@"review Saving Complete"];
                        
                        
                        /* UIViewController * viewController = [self.navigationController.viewControllers objectAtIndex:[self.navigationController viewControllers].count-2];
                         [self.navigationController popToViewController:viewController animated:YES];
                         */
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
            } FailBlock:^(NSString *Error) {
                
                [InterfaceManager DisplayAlertWithMessage:@"Internet connection  is not available connection"];
                
                
            }];
        }
        [self loaddatatotable];
    }
    
    
    
    -(void)loaddatatotable
    {
        
        
        NSString *PostData= [NSString stringWithFormat:@"productid=%@",getproduct_id];
        NSLog(@"request:%@",PostData);
        
        
        
        
        
        AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getreviewforproduct PostData:PostData];
        
        
        
        //     {"UserId": "12","Name": "Test","Breed":"Testbreed","BirthYear": "2009","Gender": "1","Color": "White"}
        
        
        // specify method in first argument
        [AuthenticationServer StartServerConnectionWithCompletionHandler :@"POST":^(NSDictionary *JSONDict) {
            
            
            
            NSMutableDictionary * Result1 = [JSONDict valueForKey:@"productdetails"];
            reviewdata = [JSONDict valueForKey:@"productdetails"];
            NSLog(@"%@",reviewdata);
            
            
            if (Result1) {
                
                NSString * ErroCode;
                
                if ([ErroCode isEqualToString:@"403"]) {
                    
                    
                    
                }else{
                    
                    
                    reviewdata = [JSONDict valueForKey:@"productdetails"];
                    
                    
                    for (NSDictionary *categorydetails in reviewdata) {
                        
                        
                        ModelProduct * product = [ModelProduct new];
                        product.productId= [categorydetails valueForKey:@"productid"];
                        product.productAuthor= [categorydetails valueForKey:@"author"];
                        product.productDateAndTime= [categorydetails valueForKey:@"date_added"];
                        product.productReviewText= [categorydetails valueForKey:@"text"];
                        product.productRating= [categorydetails valueForKey:@"rating"];
                        
                        [reviewdetail addObject:product];
                        
                        
                        
                    }
                    [reviewtable reloadData];
                }
            }
            
        } FailBlock:^(NSString *Error) {
            
            [InterfaceManager DisplayAlertWithMessage:@"Internet connection  is not available connection"];
            
            
        }];
        
        
    }
    
    
    
    
    -(void)ShowAlertView:(NSString*)Message{
        
        UIAlertView * Alert = [[UIAlertView alloc]initWithTitle:kApplicationName message:[NSString stringWithFormat:@"\n%@\n",Message] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        
        [Alert show];
        
        
    }
    
-(BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    
    return YES;
}
-(BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    
    return NO;
}
    
#pragma mark -
#pragma mark UITableView Datasource
    
    
    
    
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        
        Section *aSection=[sectionArray objectAtIndex:section];
        // Return the number of rows in the section.
        return aSection.open ? [aSection.sectionRows count]:0;
        return reviewdetail.count;
    }
    
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        
        return 2;
    }
    /*
     
     - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
     {
     
     
     
     
     if (indexPath.section == 2)  {
     
     
     ReviewViewController *reviewVCobj = [self.storyboard instantiateViewControllerWithIdentifier:@"reviewview"];
     
     
     
     
     
     
     
     
     
     
     
     [self.navigationController pushViewController:reviewVCobj animated:YES];
     
     
     }else
     {
     
     NSString *error=@"error in selection";
     
     NSLog(@"%@",error);
     }
     
     
     
     
     }
     
     */
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *CellIdentifier = @"mycell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            if (tableView==producttable) {
                
                
                [[NSBundle mainBundle]loadNibNamed:@"hrcellview" owner:self options:nil];
                cell=_hrcell;
            }
        }
        if (tableView==producttable && reviewtable) {
            NSLog(@"%ld",(long)indexPath.section);
            // cell.textLabel.text=@"abcd";
            ModelProduct *product=[ModelProduct new];
            product = _thisProduct;
            if (product.productAuthor==nil) {
              
                //textview.text =  textnil;
                NSLog(@"Nothing to display");
            }else{
                
                cell.textLabel.text=product.productAuthor;
                NSLog(@"%@",product.productAuthor);
            }
            if (indexPath.section==0) {
                
                
                if (product.productDescription==nil) {
                    
                    
                    //textview.text =  textnil;
                    NSLog(@"Nothing to display");
                }else{
                    textview.text =  product.productDescription;
                }
            }
            else if (indexPath.section==1){
                NSString *specification=@"specification is waiting to receive";
                textview.text=specification;
            }
            
        }
        
        
        
        return cell;
    }
#pragma mark - Table View
    -(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
        
        Section *aSection;
        // if (tableView==_employeestable) {
        
        
        /*
         Create the section header views lazily.
         */
        if (tableView==producttable) {
            
            
            aSection=[sectionArray objectAtIndex:section];
            if (!aSection.sectionHeaderView) {
                aSection.sectionHeaderView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.producttable.bounds.size.width, HEADER_HEIGHT) title:aSection.sectionHeader section:section delegate:self];
                NSLog(@"sectn%ld",(long)section);
                //            Empdetails*empdetls2=(Empdetails *)[_empnameArray objectAtIndex:section];
                //            NSLog(@"sectn%@",empdetls2.Inproceesstatus);
                //            if ([empdetls2.Inproceesstatus isEqualToString:@"true"]) {
                //
                //                // aSection.sectionHeaderView.animatedview.userInteractionEnabled=NO;
                //                CAGradientLayer *gradient = [CAGradientLayer layer];
                //                gradient.frame =  aSection.sectionHeaderView.bounds;
                //                gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0f green:174.0/255.0f blue:185.0/255.0f alpha:1.0f] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
                //                [ aSection.sectionHeaderView.layer insertSublayer:gradient atIndex:0];
                //
                //            }
                //            else{
                //                // aSection.sectionHeaderView.animatedview.userInteractionEnabled=YES;
                //                CAGradientLayer *gradient = [CAGradientLayer layer];
                //                gradient.frame =  aSection.sectionHeaderView.bounds;
                //                gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
                //                [ aSection.sectionHeaderView.layer insertSublayer:gradient atIndex:0];
                //
                //
                //            }
                
            }
            
        }
        
        
        
        return aSection.sectionHeaderView;
        
        
        
    }
    -(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
        
        
        Section *aSection=[sectionArray objectAtIndex:sectionOpened];
        aSection.open=YES;
        
        /*
         Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
         */
        NSInteger countOfRowsToInsert = [aSection.sectionRows count];
        NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
            [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
        }
        
        /*
         Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
         */
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        
        NSInteger previousOpenSectionIndex = self.openSectionIndex;
        if (previousOpenSectionIndex != NSNotFound) {
            Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenSectionIndex];
            previousOpenSection.open=NO;
            [previousOpenSection.sectionHeaderView toggleOpenWithUserAction:NO];
            NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
            for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
                [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
            }
            
            
        }
        
        // Style the animation so that there's a smooth flow in either direction.
        UITableViewRowAnimation insertAnimation;
        UITableViewRowAnimation deleteAnimation;
        if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
            insertAnimation = UITableViewRowAnimationTop;
            deleteAnimation = UITableViewRowAnimationBottom;
        }
        else {
            insertAnimation = UITableViewRowAnimationBottom;
            deleteAnimation = UITableViewRowAnimationTop;
        }
        
        // Apply the updates.
        [self.producttable beginUpdates];
        [self.producttable insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
        [self.producttable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
        [self.producttable endUpdates];
        self.openSectionIndex = sectionOpened;
        
        
        
    }
    -(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
        
        /*
         Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
         */
        Section *aSection = [self.sectionArray objectAtIndex:sectionClosed];
        
        aSection.open = NO;
        
        NSInteger countOfRowsToDelete = [self.producttable numberOfRowsInSection:sectionClosed];
        
        if (countOfRowsToDelete > 0) {
            NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
            for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
                [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
            }
            [self.producttable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
        }
        self.openSectionIndex = NSNotFound;
    }
    
    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    
    
    -(void) addProductToCart
    {
        NSString * cartArrayKey =@"CartItems";
        
        NSMutableArray * arrayCart = [self loadArrayFromUserDefaultsWithKey:cartArrayKey];
        
        if (arrayCart) {
            
            
            BOOL found = false;
            
            for (ModelProduct * temp in arrayCart) {
                
                if ([temp.productId isEqualToString:_thisProduct.productId]) {
                    
                    found=true;
                }
            }
            if (!found) {
                
                [arrayCart addObject:_thisProduct];
                [self saveCustomArrayToUserDefaults:arrayCart withKey:cartArrayKey];
                
            }else{
                
                [InterfaceManager DisplayAlertWithMessage:@"Product is already in Cart"];
            }
            
            
        }else{
            
            arrayCart = [NSMutableArray arrayWithObject:_thisProduct];
            [self saveCustomArrayToUserDefaults:arrayCart withKey:cartArrayKey];
            
            
        }
        
        
        
        
        
        
    }
    -(void)saveCustomArrayToUserDefaults:(NSMutableArray*)obj withKey:(NSString *) key
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
        
        
        [defaults setObject:myEncodedObject forKey:key];
    }
    
    -(NSMutableArray *)loadArrayFromUserDefaultsWithKey:(NSString*)key
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *myEncodedObject = [defaults objectForKey: key];
        NSMutableArray* obj = (NSMutableArray*)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
        return obj;
    }
    - (IBAction)buttonActionBack:(id)sender {
        
        [self.navigationController popViewControllerAnimated:NO];
    }
    

    @end
