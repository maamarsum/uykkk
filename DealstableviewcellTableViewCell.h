//
//  DealstableviewcellTableViewCell.h
//  Stablefax
//
//  Created by Roy Leela Electronics on 12/12/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealstableviewcellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *productid;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *model;
@property (strong, nonatomic) IBOutlet UILabel *price;

@end
