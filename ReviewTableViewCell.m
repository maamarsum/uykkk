//
//  ReviewTableViewCell.m
//  Gizmeondeals
//
//  Created by Roy Leela Electronics on 30/03/15.
//  Copyright (c) 2015 Roy Leela Electronics. All rights reserved.
//

#import "ReviewTableViewCell.h"

@implementation ReviewTableViewCell
@synthesize reviewDate,reviewName,reviewRating,reviewText;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
