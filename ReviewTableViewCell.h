//
//  ReviewTableViewCell.h
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 30/03/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewTableViewCell : UITableViewCell



@property (strong, nonatomic) IBOutlet UILabel *reviewName;
@property (strong, nonatomic) IBOutlet UILabel *reviewDate;
@property (strong, nonatomic) IBOutlet UILabel *reviewRating;
@property (strong, nonatomic) IBOutlet UILabel *reviewText;

@end
