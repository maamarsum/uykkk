//
//  ReviewViewController.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 28/01/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CredentialManager.h"
#import "BinSystemsServerConnectionHandler.h"
#import "ProductViewController.h"
@interface ReviewViewController : UIViewController




@property (strong, nonatomic) IBOutlet UITextField *textfieldreviewname;
@property (strong, nonatomic) IBOutlet UITableView *reviewtable;

@property (strong, nonatomic) IBOutlet UITextView *textviewreview;


@property(strong,nonatomic)NSString *productId;

@property (strong,nonatomic) BinSystemsServerConnectionHandler * AuthenticationServer;

@end
