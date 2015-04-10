//
//  ContactsViewController.h
//  qatardeals
//
//  Created by MAAMARSUM on 1/11/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController
- (IBAction)buttonActionBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textLocationType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNumber;
- (IBAction)ActionNext:(id)sender;

@end
