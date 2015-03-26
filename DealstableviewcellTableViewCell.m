//
//  DealstableviewcellTableViewCell.m
//  Stablefax
//
//  Created by Roy Leela Electronics on 12/12/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import "DealstableviewcellTableViewCell.h"

@implementation DealstableviewcellTableViewCell
@synthesize productid,name,model,price,image;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
