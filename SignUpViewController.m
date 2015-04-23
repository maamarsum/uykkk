//
//  SignUpViewController.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 24/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "SignUpViewController.h"
#import "InterfaceManager.h"
#import "ValidationManger.h"

@interface SignUpViewController ()

@end

BOOL valdiated;
NSArray * arrayManditoryFields;
NSArray * arrayCountryList;

CGPoint screenCenterPoint;


@implementation SignUpViewController
@synthesize textFieldAddress,textFieldCity,textFieldConfirmPassword,textFieldCOuntryId,textFieldEmail,textFieldFName,textFieldPassword,textFieldPINCode,textFieldSName,textFieldTelephone,textFieldAddress2,textFieldCompany,textFieldFax,textFieldRefferelName,textFieldZone;

@synthesize scrollViewMain;

@synthesize GPassword,GUsername;

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
    arrayManditoryFields = [[NSArray alloc]initWithObjects:textFieldFName,textFieldSName,textFieldEmail,textFieldTelephone,textFieldAddress,textFieldCity,textFieldPINCode,textFieldCOuntryId,textFieldPassword,textFieldConfirmPassword,textFieldTelephone,nil];
    
    [self.navigationController setNavigationBarHidden:NO];
    self.title=@"Sign up";
    
    textFieldTelephone.delegate=textFieldSName.delegate=textFieldPINCode.delegate=textFieldPassword.delegate=textFieldFName.delegate=textFieldEmail.delegate=textFieldCOuntryId.delegate=textFieldConfirmPassword.delegate=textFieldCity.delegate=textFieldAddress.delegate=textFieldAddress2.delegate=textFieldCompany.delegate=textFieldFax.delegate=textFieldRefferelName.delegate=textFieldZone.delegate=self;
    
    arrayCountryList = [NSArray arrayWithObject:@"kajhfk;asjdhfkajsh"];

    
    scrollViewMain.contentSize = self.view.frame.size;
    scrollViewMain.frame = self.view.frame;
    
    
    UIGestureRecognizer * gester = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:gester];
    
    screenCenterPoint = self.view.center;
    
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField==textFieldCOuntryId) {
        
        [self.view endEditing:YES];
        
        
        
        
    }
    
}

-(void) validateManditoryFields
    {
        
      //  [self RegisterUser];
        
        
        
        for (UIView *subView in arrayManditoryFields) {
            
            if ([subView isKindOfClass:[UITextField class]]) {
                
                UITextField *textField = (UITextField*)subView;
                
                valdiated = [ValidationManger validateTextField:textField];
                
                if (!valdiated) {
                    
                    [textField becomeFirstResponder];
                    break;
                }
                
            }else{
                
                valdiated = false;
            }
            
        }
        
        
       
        // password match
        if (![ValidationManger checkStringsAreEqual:textFieldConfirmPassword.text :textFieldPassword.text]) {
            
            [textFieldConfirmPassword becomeFirstResponder];
            [InterfaceManager DisplayAlertWithMessage:@"Passwords Not matching"];
            valdiated = false;
        }
        

        
        
        if (valdiated) {
            [InterfaceManager DisplayAlertWithMessage:@"Validation Complerte"];
            
            [self RegisterUser];
            
        }
        
        
    }
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
   
    [textField resignFirstResponder];
    
       [self validateManditoryFields];
        
        
    
    return YES;
}
-(void) validateTextField :(UITextField *) textField
{
    // This method is used to validate text fields
    if (!textField) {
        
       // return NO;
        
    }
    
    // empty
//    if (textField.text.length==0) {
//            
//        [InterfaceManager DisplayAlertWithMessage:@"Some manditory Fields are empty"];
//            
//        [textField becomeFirstResponder];
//            
//        return NO;
//    }
    
    //email
    }


#pragma Mark - Server Calls

-(void) RegisterUser
{
    
    
    if([BinSystemsAppManager internetCheck])
    {
        NSString * fName = textFieldFName.text;
        NSString * lName = textFieldSName.text;
        NSString * email = textFieldEmail.text;
        NSString * address = textFieldAddress.text;
        NSString * telephone = textFieldTelephone.text;
        NSString * countryid = @"1";
        NSString * password = textFieldPassword.text;
        NSString * postCode = textFieldPINCode.text;
        NSString * city = textFieldCity.text;
        NSString * fax =@"1";
        NSString * referalName =@"1";
        NSString * company =@"1";
        NSString * customerGroupId =@"1";
        NSString * companyid =@"1";
        NSString * taxid =@"1";
        NSString * address2 =@"dummy";
        NSString * confirm =@"dummy";
        NSString * newsletter =@"1";
        NSString * zoneid =@"1";
        
#warning change hard code values later

        
        NSString * PostData = [NSString stringWithFormat:@"firstname=%@&lastname=%@&email=%@&telephone=%@&city=%@&postcode=%@&country_id=%@&password=%@&confirm=%@&address_1=%@&fax=%@&referral_name=%@&company=%@&customer_group_id=%@&company_id=%@&tax_id=%@&address_2=%@&zone_id=%@&newsletter=%@&agree=%@",fName,lName,email,telephone,city,postCode,countryid,password,confirm ,address,fax,referalName,company,customerGroupId,companyid,taxid,address2,zoneid,newsletter,@""];
        
        BinSystemsServerConnectionHandler *AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_SignUp PostData:PostData];
        
        
        
        
        //specify method in first argument
        [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
            
            
            
            
            NSString * status = [JSONDict valueForKey:@"status"];
            
            
            
            if ([status isEqualToString:@"Failed"]) {
                
                
                [InterfaceManager DisplayAlertWithMessage:[JSONDict valueForKey:@"message"]];
                
                
                
            }else{
                
#warning change hard coded values
                GUsername=textFieldEmail.text;
                GPassword=textFieldPassword.text;
                
                [self AuthenticateCredentialsWithServer];
                
                
                
                
            }
            
            
            
            
        }
         
         
         
                                                               FailBlock:^(NSString *Error) {
                                                                   
                                                                   [InterfaceManager DisplayAlertWithMessage:@"Invalid Response, Entered into Fail Block"];
                                                                   
                                                                   
                                                               }];
        
    }
    
   
}
-(void)AuthenticateCredentialsWithServer{
    
    if (GPassword && GUsername) {
        
        if([BinSystemsAppManager internetCheck])
        {
            
            NSString * PostData = [NSString stringWithFormat:@"email=%@&password=%@",GUsername,GPassword];
            
            BinSystemsServerConnectionHandler *AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_Login PostData:PostData];
            
            
            
            
            //specify method in first argument
            [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
                
                
                
                
                NSString * status = [JSONDict valueForKey:@"status"];
                
                
                
                if ([status isEqualToString:@"Failed"]) {
                    
                    
                    [InterfaceManager DisplayAlertWithMessage:[JSONDict valueForKey:@"message"]];
                    
                    
                    
                    
                    
                    
                    
                }else{
                    
                    NSUserDefaults * isAppRunFirsttime = [NSUserDefaults standardUserDefaults];
                    
                    [isAppRunFirsttime setObject:@"NO" forKey:@"isFirstTime"];
                    
                    [isAppRunFirsttime synchronize];

                    
                    NSString * uid = [[JSONDict valueForKey:@"data"] valueForKey:@"customer_id"];
                    NSString * token = [[JSONDict valueForKey:@"data"] valueForKey:@""];
                    
                    [CredentialManager
                     SaveCredentialsOffline:@{@"username":GUsername,@"password":GPassword,@"UserId":uid,@"Token":@"temptoken"}];
                    
                    
                    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                    
                     [InterfaceManager DisplayAlertWithMessage:@"Registration Success"];
                    
                    
                }
                
                
                
                
            }
             
             
             
                                                                   FailBlock:^(NSString *Error) {
                                                                       
                                                                       [InterfaceManager DisplayAlertWithMessage:@"Invalid Response, Login Failed"];
                                                                       
                                                                       
                                                                   }];
            
        }
        
        
    }
    
    
    
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}




-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:1 animations:^{
        
        self.view.center = screenCenterPoint;
        
    }];
}
-(void) dismissKeyboard
{
    
    [self.view endEditing:YES];
    
}
- (NSInteger)getKeyBoardHeight:(NSNotification *)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    NSInteger keyboardHeight = keyboardFrameBeginRect.size.height;
    return keyboardHeight;
}

-(void) keyboardWillShow:(NSNotification*) notification
{
    NSInteger keyboardHeight;
    keyboardHeight = [self getKeyBoardHeight:notification];
    
    [UIView animateWithDuration:1 animations:^{
    
    self.view.center = CGPointMake(screenCenterPoint.x,screenCenterPoint.y - keyboardHeight+20);
    
    }];
    
}

#pragma Mark - button Actions
- (IBAction)buttonActionCancel:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonActionSignUp:(id)sender {
    
    [self validateManditoryFields];
    
}
@end
