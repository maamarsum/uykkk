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
#import "DropDownView.h"
#import "CountryListDropDownTableViewCell.h"

@interface SignUpViewController : UIViewController<UITextFieldDelegate,DropDownViewDelegate>

@property (strong,nonatomic) NSString * GUsername;
@property (strong,nonatomic) NSString * GPassword;

@property (strong, nonatomic) IBOutlet UITextField *textFieldFName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldSName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (strong, nonatomic) IBOutlet UITextField *textFieldTelephone;
@property (strong, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCity;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPINCode;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCOuntryId;
@property (strong, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (strong, nonatomic) IBOutlet UITextField *textFieldConfirmPassword;

- (IBAction)buttonActionCancel:(id)sender;
- (IBAction)buttonActionSignUp:(id)sender;

@end
