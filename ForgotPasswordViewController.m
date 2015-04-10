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
    
    _viewSubview.layer.cornerRadius= 10.0f;
    
    _buttonCancel.layer.cornerRadius=_buttonSubmit.layer.cornerRadius=10.0f;
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (IBAction)buttonActionBack:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)ActionSubmit:(id)sender {
    
    
    
    
    
    
    
}
@end
