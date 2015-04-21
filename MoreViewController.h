//
//  MoreViewController.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 02/02/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelSelectedCountry;
@property (weak, nonatomic) IBOutlet UILabel *labelSelectedLanguage;
- (IBAction)ActionSelectCountry:(id)sender;
- (IBAction)ActionSelectLanguage:(id)sender;

@end
