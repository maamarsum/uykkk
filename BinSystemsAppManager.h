//
//  BinSystemsAppManager.h
//  ProjectForDad
//
//  Created by Febin Babu Cheloor on 19/06/13.
//  Copyright (c) 2013 BinSystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterfaceManager.h"

@interface BinSystemsAppManager : NSObject {
    
    
    
}

-(void)ActiveDiagonostics;

+(NSDate *) toLocalDeviceTime :(NSDate*)Date;

+(NSString*)GetUnixTimestamp:(NSDate*)date;

+(BOOL)isDeviceDisplayiPhone_5_5C_5S;

+(BOOL)isDeviceDisplayiPhone_4_4S;

+(int)TimeStampDifferenceValidatorWithDateString:(NSString *)LastUpdatedDate;

+(NSString*)TimeStampSystemCore;

-(int)DaysDifferenceCalculate:(NSString*)DateString;

-(NSArray*)GradientColorArray;

+(BOOL)isDeviceiPad;

+(BOOL)CheckStringWhiteSpaceOnly:(NSString*)String;


//-(BOOL)AddURLToSafariReadingListWithTitle:(NSString*)Title SubTitile:(NSString*)SubTitile WebURL:(NSString*)WebURL;




-(void)PostLocalNotificationWithNotifierTitle:(NSString*)MainTitle
                                WithDataTitle:(NSString*)DataTitle
                                     DataBody:(NSString*)DataBody;



+(NSString*)GenerateUnixTimeStampWithLocaleInfo:(NSDate*)DateInfo;

+(BOOL)internetCheck;

@end
