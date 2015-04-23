//
//  ValidationManger.h
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 25/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfaceManager.h"
#import "ModelProduct.h"

@interface ValidationManger : NSObject
+(BOOL) validateTextField :(UITextField *) textField;
+(BOOL) checkStringsAreEqual :(NSString *) string1 :(NSString *) string2;
+(BOOL) validateProduct :(ModelProduct *) product;
+(BOOL) validateEmail :(NSString *) emailString;
+(BOOL) validateMobileNumber :(NSString *) mobileNumber;
@end
