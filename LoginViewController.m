//
//  LoginViewController.m
//  Stablemate
//
//  Created by Gizmeon Technologies on 27/09/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import "LoginViewController.h"
#import "InterfaceManager.h"
#import "DefineServerLinks.h"
#import "HomeViewController.h"
#import "CredentialManager.h"



#import "InterfaceManager.h"

#import "ModelUser.h"
#import "DefineMainValues.h"





#import  "Reachability.h"
#import "BinSystemsAppManager.h"
#import "SignUpViewController.h"

#import "ProductViewController.h"
#import "ProductOrganizer.h"


@interface LoginViewController ()
{
    
    
    CGRect scrollViewDefaultFrame;
    UIAlertView *alrtLogin;
    
    
}
@end

@implementation LoginViewController
@synthesize textFieldPassword,textFieldUserName;
@synthesize OutletButtonLogin,scrollView;
@synthesize GPassword,GUsername;
@synthesize AuthenticationServer,butonForgotPassword,buttonCreateAccount;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    
    
    if (!_isInFirstScreen) {
        
        
        _buttonSkip.hidden=YES;
        
    }
    
    
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
    
  
   // self.hidesBottomBarWhenPushed = YES;
   
    //temp auto login code starts here
    
}

-(void)dismissKeyBoard{
    [textFieldPassword resignFirstResponder];
    [textFieldUserName resignFirstResponder];
}



- (IBAction)skipLoginAction:(id)sender {
    
    NSUserDefaults * isAppRunFirsttime = [NSUserDefaults standardUserDefaults];
    
    [isAppRunFirsttime setObject:@"NO" forKey:@"isFirstTime"];
    
    [isAppRunFirsttime synchronize];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickToLogin:(id)sender {
    
    
    [self.view endEditing:YES];
    
    if ([textFieldUserName.text length]==0) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Enter Username"];
        [self.textFieldUserName becomeFirstResponder];
        
    }
    else if ([textFieldPassword.text length]==0) {
        
        [InterfaceManager DisplayAlertWithMessage:@"Enter Password"];
        [self.textFieldPassword becomeFirstResponder];
        
    }else{
        
        
        self.GUsername = self.textFieldUserName.text;
        self.GPassword = self.textFieldPassword.text;
        [self AuthenticateCredentialsWithServer];
        
        
    }
}


-(void)AuthenticateCredentialsWithServer{
    
    GUsername=@"mmm@g.com";
    GPassword=@"mmmm";
    
    if (GPassword && GUsername) {
        
        if([BinSystemsAppManager internetCheck])
        {
            //        [indicatorSignIn startAnimating];
            
            //      NSString * PostData = [NSString stringWithFormat:@"LoginForm[username]=%@&LoginForm[password]=%@",GUsername,GPassword];
            
            //  NSString * PostData = [NSString stringWithFormat:@"{\"UserName\":\"rasheed\",\"Password\":\"1234\"}";
            
          //  NSString * PostData = [NSString stringWithFormat:@"{\"email\":\"%@\",\"password\":\"%@\"}",GUsername,GPassword];
            
             NSString * PostData = [NSString stringWithFormat:@"email=%@&password=%@",GUsername,GPassword];
            
            AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_Login PostData:PostData];
            
            
            
            
            //specify method in first argument
            [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
                
                
                
                //               NSError *error = nil;
                //             NSData *jsonData = [NSJSONSerialization dataWithJSONObject:JSONDict options:0 error:&error];
                
               // ModelUser  * User  =   [JSONParser parseUserLoginJson:JSONDict];
                
                
                NSString * status = [JSONDict valueForKey:@"status"];
                
               
                
                if ([status isEqualToString:@"Failed"]) {
                    
                   
                    [InterfaceManager DisplayAlertWithMessage:[JSONDict valueForKey:@"message"]];
                    
                    
                        
                       
                        
                
                        
                }else{
                    
                    NSString * uid = [[JSONDict valueForKey:@"data"] valueForKey:@"customer_id"];
                    NSString * token = [[JSONDict valueForKey:@"data"] valueForKey:@""];
                    [CredentialManager
                     SaveCredentialsOffline:@{@"username":GUsername,@"password":GPassword,@"UserId":uid,@"Token":@"fsg"}];
                    
                    
                    
                    if (_isInFirstScreen) {
                        
                               HomeViewController * HomeView  =   [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
                        
                        
                        [self presentViewController:HomeView animated:YES completion:nil];
                        
                    }else {
                        
                        //all add to carrt and favourate items are moved to online cart from offline cart
                        
                        NSString * keyCart =@"CartItems";
                        NSMutableArray * addToCartItems = [ProductOrganizer loadArrayFromUserDefaultsWithKey:keyCart];
                        
                        
                        do{
                            
                            if (addToCartItems.count) {
                                
                                
                                for (int i = 0;i<addToCartItems.count;i++) {
                                    
                                    ModelProduct * product = [addToCartItems objectAtIndex:i];
                                    if ([ProductOrganizer addProductToServerCart:product]) {
                                        
                                        
                                        [addToCartItems removeObjectAtIndex:i];
                                        
                                        
                                        
                                    }else{
                                        
                                        
                                        break;
                                        
                                    }
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                            
                        }while (addToCartItems.count);
                            
                        
                        [ProductOrganizer saveCustomArrayToUserDefaults:addToCartItems withKey:keyCart];
                       
                        
                        NSString * keyWishList =@"WishListItems";
                        NSMutableArray * wishListitems = [ProductOrganizer loadArrayFromUserDefaultsWithKey:keyWishList];
                        
                        //move offline wish list to server
                        do{
                            
                            if (wishListitems.count) {
                                
                                
                                for (int i = 0;i<wishListitems.count;i++) {
                                    
                                    ModelProduct * product = [wishListitems objectAtIndex:i];
                                    if ([ProductOrganizer addProductToServerWishList:product]) {
                                        
                                        
                                        [wishListitems removeObjectAtIndex:i];
                                        
                                        
                                        
                                    }else{
                                        
                                        
                                        break;
                                        
                                    }
                                    
                                    
                                }
                                
                                
                            }
                            
                            
                            
                        }while (wishListitems.count);
                        
                        
                        [ProductOrganizer saveCustomArrayToUserDefaults:wishListitems withKey:keyWishList];

                        
                        
                        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                    
                    
                
                            
            }
             
             
             
        FailBlock:^(NSString *Error) {
                                                                       
                     [InterfaceManager DisplayAlertWithMessage:@"Invalid Response, Entered into Fail Block"];
                                                                       
                                                                       
                                                                   }];
            
        }
             
            
    }
    
             
      
    
}

- (IBAction)forgotPasswordButtonAction:(id)sender{
    
}
- (IBAction)createButtonAction:(id)sender {
    
//  //  [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
//        
//        SignUpViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"signup"];
//        
//        [self.navigationController presentViewController:VC animated:YES completion:nil];
//   // }];
    
     
}

- (IBAction)buttonActionCancel:(id)sender {
    

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end