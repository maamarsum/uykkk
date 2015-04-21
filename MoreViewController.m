//
//  MoreViewController.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "MoreViewController.h"


#import "ContactsViewController.h"
#import "LoginViewController.h"
#import "MyordersViewController.h"
#import "KLCPopup.h"
#import "ViewSelectCountryNLanguage.h"
#import "AppGlobalVariables.h"
#import "BinSystemsAppManager.h"
#import "DefineServerLinks.h"
#import "InterfaceManager.h"

@interface MoreViewController ()
{
    
    NSArray * arrayCountryList;
}

@end

@implementation MoreViewController

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
    
  // self.navigationController.navigationBar.hidden=NO;

   
    // Do any additional setup after loading the view.
    
    
    [self fetchCountryLIst];
    
    
    
}





- (IBAction)Buttonmyorders:(id)sender {
    
    MyordersViewController *myordervCobj  =   [self.storyboard instantiateViewControllerWithIdentifier:@"myorderview"];
    
    
    [self presentViewController:myordervCobj animated:YES completion:nil];
    
    
}
-(void) fetchCountryLIst
{
  
    arrayCountryList = [[AppGlobalVariables sharedInstance].arrayCountryList copy];
    
    if (arrayCountryList.count == 0) {
     
        BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getCountryList PostData:nil];
        
        
        [AuthenticationServer StartServerConnectionWithCompletionHandler:@"GET":^(NSDictionary *JSONDict) {
            
            
            
            
            NSString * status = [JSONDict valueForKey:@"status"];
            
            if ([status isEqualToString:@"Success"]) {
                
                arrayCountryList = [JSONDict valueForKey:@"data"];
                
                [AppGlobalVariables sharedInstance].arrayCountryList = arrayCountryList;
                
                
                
            }else{
                
               
                
            }
            
            
            
        } FailBlock:^(NSString *Error) {
            
            NSLog(@"error");
            
            
            
            
        }];
        
        
    }
    
    
}
-(void) fetchLanguageList
{
    
    
    
    
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

- (IBAction)ActionSelectCountry:(id)sender {
    
    
    if (arrayCountryList.count>0) {
        
        ViewSelectCountryNLanguage * viewCountryList = [[ViewSelectCountryNLanguage alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
      //   ViewSelectCountryNLanguage * viewCountryList = [[ViewSelectCountryNLanguage alloc]init];
        
        // Instantiate a referenced view (assuming outlet has hooked up in XIB).
        
        viewCountryList.tableViewMain.delegate=(id)self;
        viewCountryList.tableViewMain.dataSource=(id)self;
        
        
        viewCountryList.arrayTableContents = arrayCountryList;
        NSLog(@"countrytable%@",viewCountryList.arrayTableContents);
        
        
        NSLog(@"countrytablemain%@",viewCountryList.tableViewMain);
        viewCountryList.backgroundColor=[UIColor yellowColor];
        KLCPopup * popupCountry = [KLCPopup popupWithContentView:viewCountryList];
        
        
       popupCountry.backgroundColor=[UIColor redColor];
        
       
        [popupCountry show];
[viewCountryList reloadTable];
        
    }
    
    
    
    
}

- (IBAction)ActionSelectLanguage:(id)sender {
}
@end
