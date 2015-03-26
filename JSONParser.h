//
//  JSONParser.h
//  Lubna
//
//  Created by Febin Babu Cheloor on 24/05/14.
//  Copyright (c) 2014 Gizmeon Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+BinSystemsDicitonary.h"
#import "NSArray+BinSystems.h"
#import "ModelUser.h"

// Models



@interface JSONParser : NSObject


+(ModelUser *)parseUserLoginJson:(NSDictionary*)JSONDict;

@end