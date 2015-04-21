//
//  AccountViewController.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

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
    
    _labelFirstName.text=_labelLastName.text=_labelEmail.text=_labelTelephone.text=_labelFax.text=@"";
    
    [self fetchUserData];
    
}
-(void) fetchUserData
{
    
    NSString *PostData = [NSString stringWithFormat:@"customer_id=%@",@"1"];
    NSLog(@"Request: %@", PostData);
    
    
    BinSystemsServerConnectionHandler * AuthenticationServer  = [[BinSystemsServerConnectionHandler alloc]initWithURL:kServerLink_getUserDetails PostData:PostData];
    
    
    [AuthenticationServer StartServerConnectionWithCompletionHandler:@"POST":^(NSDictionary *JSONDict) {
        
        
        
        
        NSString * Result1 = [JSONDict valueForKey:@"status"];
        
        if ([Result1 isEqualToString:@"Success"]) {
            
            NSDictionary * dicUdetails = [[JSONDict valueForKey:@"data"] objectAtIndex:0];
            
            
            
            
            _labelFirstName.text = [dicUdetails valueForKey:@"addressfirstname"];
            _labelLastName.text = [dicUdetails valueForKey:@"addresslastname"];
            _labelEmail.text = [dicUdetails valueForKey:@"email"];
            _labelTelephone.text = [dicUdetails valueForKey:@"telephone"];
            _labelFax.text = [dicUdetails valueForKey:@"fax"];
            
            
            
            
            
            
        }else{
            
            
            
            [InterfaceManager DisplayAlertWithMessage:@"Invalid data recieved"];
        }
        
        
        
    } FailBlock:^(NSString *Error) {
        
        NSLog(@"error");
        
        
        
        
    }];
    
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
