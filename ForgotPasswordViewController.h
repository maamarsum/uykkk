//
//  ForgotPasswordViewController.h
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 25/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BinSystemsAppManager.h"
#import "BinSystemsServerConnectionHandler.h"
#import "InterfaceManager.h"
#import "DefineServerLinks.h"
#import "CredentialManager.h"

@interface ForgotPasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonSubmit;

@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
@property (weak, nonatomic) IBOutlet UIView *viewSubview;

- (IBAction)buttonActionBack:(id)sender;
- (IBAction)ActionSubmit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;

@end
