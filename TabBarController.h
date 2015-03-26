//
//  TabBarController.h
//  Stablemate
//
//  Created by Gizmeon Technologies on 11/11/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController<UITabBarControllerDelegate>


@property int index;

-(void) switchFirstViewTabWithViewController:(UIViewController*) vc ;

@end
















