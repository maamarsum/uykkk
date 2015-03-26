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

@interface MoreViewController (){
    
   
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
}


- (IBAction)Buttonback:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
 


- (IBAction)Buttonmyorders:(id)sender {
    
    MyordersViewController *myordervCobj  =   [self.storyboard instantiateViewControllerWithIdentifier:@"myorderview"];
    
    
    [self presentViewController:myordervCobj animated:YES completion:nil];
    
    
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
