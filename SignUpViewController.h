//
//  SignUpViewController.h
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 24/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BinSystemsAppManager.h"
#import "BinSystemsServerConnectionHandler.h"
#import "CredentialManager.h"
#import "InterfaceManager.h"
#import "DefineServerLinks.h"
#import "KLCPopup.h"
#import "ViewSelectCountryNLanguage.h"



@interface SignUpViewController : UIViewController<UITextFieldDelegate,PopupListDelegate>

@property (strong,nonatomic) NSString * GUsername;
@property (strong,nonatomic) NSString * GPassword;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewMain;

@property (strong, nonatomic) IBOutlet UITextField *textFieldFName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldSName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTelephone;
@property (strong, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress2;

@property (strong, nonatomic) IBOutlet UITextField *textFieldCity;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPINCode;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCOuntryId;
@property (weak, nonatomic) IBOutlet UITextField *textFieldZone;

@property (weak, nonatomic) IBOutlet UITextField *textFieldCompany;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRefferelName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFax;


@property (strong, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (strong, nonatomic) IBOutlet UITextField *textFieldConfirmPassword;

- (IBAction)buttonActionCancel:(id)sender;
- (IBAction)buttonActionSignUp:(id)sender;

@end
