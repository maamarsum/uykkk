//
//  ForgotPasswordViewController.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 25/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "ForgotPasswordViewController.h"


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
}


- (IBAction)buttonActionBack:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
