//
//  SortAndFilter.h
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 05/03/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProduct.h"
#import "DefineServerLinks.h"

@interface ProductOrganizer : NSObject

+(NSArray*) sortArray :(NSArray*) unsortedArray withKey:(NSString *) key ascending:(BOOL) isAscending;

+(NSArray*) filterArray:(NSArray*) unfilteredArray withKey:(NSString *) key;
+(BOOL) addProductToServerCart :(ModelProduct *) product;
+ (BOOL) addProductToServerWishList:(ModelProduct *)product;
+ (BOOL) addProductToLocalWishList :(ModelProduct *)product;
+(NSMutableArray *)loadArrayFromUserDefaultsWithKey:(NSString*)key;
+(void)saveCustomArrayToUserDefaults:(NSMutableArray*)obj withKey:(NSString *) key;
+(NSArray *) convertServerArrayToModelProductArray :(NSArray *) arrayServerData;
+(void) setThumbImageForProduct:(ModelProduct *) product;
@end
