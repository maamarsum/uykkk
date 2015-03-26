//
//  InterfaceManager.h
//  Lubna Foods
//
//  Created by Febin Babu Cheloor on 25/02/14.
//  Copyright (c) 2014 Gizmeon Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "TopBarView.h"


@interface InterfaceManager : NSObject
{
    UIAlertView * alertLoading;
    
}
@property (retain,nonatomic) UIImage * backgroundImage;

@property (nonatomic,strong) UIAlertView * alertLoading;



+(void)DisplayAlertWithMessage:(NSString*)Message;

+ (id)sharedInterfaceManager;


@end
