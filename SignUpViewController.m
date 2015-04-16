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
DropDownView *dropCountry,*dropRegion;


@implementation SignUpViewController
@synthesize textFieldAddress,textFieldCity,textFieldConfirmPassword,textFieldCOuntryId,textFieldEmail,textFieldFName,textFieldPassword,textFieldPINCode,textFieldSName,textFieldTelephone;

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
    
    textFieldTelephone.delegate=textFieldSName.delegate=textFieldPINCode.delegate=textFieldPassword.delegate=textFieldFName.delegate=textFieldEmail.delegate=textFieldCOuntryId.delegate=textFieldConfirmPassword.delegate=textFieldCity.delegate=textFieldAddress.delegate=self;
    
    arrayCountryList = [NSArray arrayWithObject:@"kajhfk;asjdhfkajsh"];
    
    dropCountry = [[DropDownView alloc]initWithArrayData:arrayCountryList cellHeight:50 heightTableView:300 paddingTop:10 paddingLeft:10 paddingRight:10 refView:textFieldCOuntryId animation:BLENDIN openAnimationDuration:1 closeAnimationDuration:1];
    
    dropCountry.delegate=self;
    //[dropCountry openAnimation];
    
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField==textFieldCOuntryId) {
        
        [self.view endEditing:YES];
        
        [dropCountry openAnimation];
        
        
        
    }
    
}

-(void) validateManditoryFields
    {
        
        [self RegisterUser];
        
        /*
        
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
        
        */
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
        NSString * fName = @"dummy";
        NSString * lName = @"dummy";
        NSString * email = @"kk@kk.com";
        NSString * address = @"dummy";
        NSString * telephone = @"1234567890";
        NSString * countryid = @"1";
        NSString * password = @"dummy";
        NSString * postCode = @"670502";
        NSString * city = @"dummy";
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
                GUsername=@"kk@kk.com";
                GPassword=@"dummy";
                
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
#pragma Mark - button Actions
- (IBAction)buttonActionCancel:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonActionSignUp:(id)sender {
    
    [self validateManditoryFields];
    
}
@end
