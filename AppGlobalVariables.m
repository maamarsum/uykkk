//
//  AppGlobalVariables.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 24/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "AppGlobalVariables.h"

@implementation AppGlobalVariables
@synthesize arrayMainMenuItems,appTabBar,firstTabNavigationController;
static AppGlobalVariables *instance=nil;

-(id)init
{
    self =[super init];
    
    if (self) {
        
        //appTabBar = [TabBarController new];
        arrayMainMenuItems = [NSArray new];
        
    }
    return self;
}
+(AppGlobalVariables *)sharedInstance
{
    @synchronized(self)
    {
        if (instance==nil) {
            instance=[AppGlobalVariables new];
            
        }
    }
    
    return instance;
}

@end
