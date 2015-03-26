//
//  LoginViewController.h
//  Stablemate
//
//  Created by Gizmeon Technologies on 27/09/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BinSystemsServerConnectionHandler.h"
#import "ModelUser.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate,UIScrollViewDelegate>

@property (strong,nonatomic) BinSystemsServerConnectionHandler * AuthenticationServer;
@property (strong,nonatomic) NSString * GUsername;
@property (strong,nonatomic) NSString * GPassword;
@property BOOL isInFirstScreen;





//IB Objects

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIButton *OutletButtonLogin;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *buttonSkip;

//IB Actions
- (IBAction)skipLoginAction:(id)sender;
- (IBAction)clickToLogin:(id)sender;
- (IBAction)forgotPasswordButtonAction:(id)sender;
- (IBAction)createButtonAction:(id)sender;
- (IBAction)buttonActionCancel:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *butonForgotPassword;

@property (strong, nonatomic) IBOutlet UIButton *buttonCreateAccount;



@end
