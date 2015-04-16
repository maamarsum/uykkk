//
//  ForgotPasswordViewController.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 25/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "DefineServerLinks.h"
#import "ValidationManger.h"
#import "InterfaceManager.h"


@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController



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
    
    _viewSubview.layer.cornerRadius= 10.0f;
    
    _buttonCancel.layer.cornerRadius=_buttonSubmit.layer.cornerRadius=10.0f;
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    
    
    [self.view addGestureRecognizer:tap];

    
    
    
    
    
    
    
    
    
}

-(void)dismissKeyBoard{
    [_textFieldEmail resignFirstResponder];
 }
- (IBAction)buttonActionBack:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ActionSubmit:(id)sender {
    
    
    [self dismissKeyBoard];
    [_buttonSubmit setEnabled:NO];
    
    if (![ValidationManger validateEmail:_textFieldEmail.text]) {
        
        
        [_textFieldEmail becomeFirstResponder];
        
        [InterfaceManager DisplayAlertWithMessage:@"Enter a valid Email"];
        
    }else{
    
    NSString *PostData = [NSString stringWithFormat:@"email=%@",_textFieldEmail.text];
    NSLog(@"Request: %@", PostData);
    
    
    BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_ForgetPassword PostData:PostData];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        
        
        NSString * Result1 = [JSONDict valueForKey:@"status"];
        
        
        
        if ([Result1 isEqualToString:@"Success"]) {
            
        
           
            [InterfaceManager DisplayAlertWithMessage:[JSONDict valueForKey:@"message"]];
            
            
            
        }else{
          
             [InterfaceManager DisplayAlertWithMessage:[JSONDict valueForKey:@"message"]];
            
        }
        
        [_buttonSubmit setEnabled:YES];
        
    } FailBlock:^(NSString *Error) {
        
        NSLog(@"error");
        
        [_buttonSubmit setEnabled:YES];
        
        
    }];
    
    

    
    }
    
    
    
}
@end
