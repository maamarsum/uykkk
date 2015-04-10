//
//  ContactsViewController.m
//  qatardeals
//
//  Created by MAAMARSUM on 1/11/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "ContactsViewController.h"
#import "ProductViewController.h"


@interface ContactsViewController ()

@end

@implementation ContactsViewController
@synthesize textFieldCity,textFieldFirstName,textFieldLastName,textFieldNumber,textLocationType;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonActionBack:(id)sender {
    
    
    UINavigationController * nav = (UINavigationController*)self.presentingViewController;
    
    if ([nav.topViewController isKindOfClass:[ProductViewController class]]) {
        
        
        ProductViewController *VC = (ProductViewController*)nav.topViewController;
        
        
        VC.didTappedBuy= NO;
        
    }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)ActionNext:(id)sender {
    
    
    
    
}
@end
