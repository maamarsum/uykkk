//
//  BinSystemsAppManager.m
//  ProjectForDad
//
//  Created by Febin Babu Cheloor on 19/06/13.
//  Copyright (c) 2013 BinSystems. All rights reserved.
//

// Polling only for iPhone.

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)
#define IS_IPHONE_4_4S (IS_RETINA && IS_IPHONE && [[UIScreen mainScreen] bounds].size.height != 568.0f)
#define IS_IPHONE_5_5S_5C (IS_RETINA && IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)


#import "BinSystemsAppManager.h"
#import "Reachability.h"


@implementation BinSystemsAppManager



+(NSDate *) toLocalDeviceTime :(NSDate*)Date
{
    
    
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate:Date];
    return [NSDate dateWithTimeInterval: seconds sinceDate: Date];
    /*
     
     NSTimeZone *tz = [NSTimeZone defaultTimeZone];
     NSInteger seconds = [tz secondsFromGMTForDate: Date];
     return [NSDate dateWithTimeInterval: seconds sinceDate: Date];
     */
}




+(BOOL)isDeviceDisplayiPhone_5_5C_5S {
    
    return IS_IPHONE_5_5S_5C;
}


+(BOOL)isDeviceDisplayiPhone_4_4S{
    
    return IS_IPHONE_4_4S;
}


+(NSString*)TimeStampSystemCore{
    
    NSDateFormatter * TimeStampStyleFormat= [[NSDateFormatter alloc] init];//setting the formatt
    [TimeStampStyleFormat setTimeZone: [NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [TimeStampStyleFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
    NSDate *currentTime = [[NSDate alloc] init];
    NSString *formattedTimeStamp = [TimeStampStyleFormat stringFromDate:currentTime];
    return formattedTimeStamp;
    
}

+(int)TimeStampDifferenceValidatorWithDateString:(NSString *)LastUpdatedDate{
    
    //Converting String to Date obj
    NSDate *_voidSocket= nil;
    NSDate *_voidSocketCurrent= nil;
    
    NSDateFormatter *_gh = [[NSDateFormatter alloc] init];
    [_gh setTimeZone: [NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [_gh setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZ"];
    
    _voidSocket = [_gh dateFromString:LastUpdatedDate];
    _voidSocketCurrent = [_gh dateFromString:[self TimeStampSystemCore]];
    
    //Creating current TimeStamp with Coustom Init Method
    float diffSecs  = [_voidSocketCurrent timeIntervalSinceDate:_voidSocket];// time in float
    int roundedTimeDiffInSecs = (int)roundf(diffSecs);// rounded time in INT
    return roundedTimeDiffInSecs;
    
}


-(int)DaysDifferenceCalculate:(NSString*)DateString{
    
    
    NSDateFormatter * formatter;
    NSString * dateNowString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    dateNowString = [formatter stringFromDate:[NSDate date]];
    
    NSDateFormatter *f1 = [[NSDateFormatter alloc] init];
    [f1 setDateFormat:@"dd-MM-yyyy"];
    
    
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    
    // Server Date Fromat
    [f2 setDateFormat:@"d LLL yyyy"];
    
    
    NSDate *startDate = [f1 dateFromString:dateNowString];
    NSDate *endDate = [f2 dateFromString:DateString];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    NSLog(@"%ld",(long)components.day);
    
    
    return components.day;
    
    
}

+(BOOL)isDeviceiPad{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        
        // NSLog(@"Device is iPad Family");
        return YES;
    }
    else
    {
        // NSLog(@"Device is iPhone/iPod Family");
        return NO;
    }
    
}

-(NSArray*)GradientColorArray{
    
    /* ORIGINAL
     
     UIColor * blueRof = [UIColor colorWithRed:210.0f/255.0 green:100.0f/255.0 blue:10.0f/255 alpha:0.6];
     UIColor * redRof = [UIColor colorWithRed:190.0f/255.0 green:20.0f/255.0 blue:1.0f/255 alpha:0.7];
     
     
     UIColor * iPad1 = [UIColor colorWithRed:10.0f/255.0 green:180.0f/255.0 blue:240.0f/255 alpha:0.6];
     UIColor * iPad2 = [UIColor colorWithRed:10.0f/255.0 green:0.0f/255.0 blue:100.0f/255 alpha:0.7];
     */
    
    NSArray * ColorArray;
    
    // iPhone
    UIColor * iPhone1 = [UIColor colorWithRed:0.0f/255.0 green:20.0f/255.0 blue:140.0f/255 alpha:0.6];
    UIColor * iPhone2 = [UIColor colorWithRed:0.0f/255.0 green:120.0f/255.0 blue:20.0f/255 alpha:0.7];
    //iPad
    
    UIColor * iPad1 = [UIColor colorWithRed:0.0f/255.0 green:20.0f/255.0 blue:140.0f/255 alpha:0.6];
    UIColor * iPad2 = [UIColor colorWithRed:0.0f/255.0 green:120.0f/255.0 blue:20.0f/255 alpha:0.7];
    
    
    if ( [BinSystemsAppManager isDeviceiPad]) {
        
        ColorArray = [NSArray arrayWithObjects:(id)[iPad1 CGColor],(id)[iPad2 CGColor], nil];
        
    }else{
        
        ColorArray = [NSArray arrayWithObjects:(id)[iPhone1 CGColor],(id)[iPhone2 CGColor], nil];
        
    }
    
    return ColorArray;
    
}


/*
 -(BOOL)AddURLToSafariReadingListWithTitle:(NSString*)Title SubTitile:(NSString*)SubTitile WebURL:(NSString*)WebURL{
 
 BOOL AddStatus;
 
 SSReadingList * readList = [SSReadingList defaultReadingList];
 NSError * error = [NSError new];
 
 AddStatus =[readList addReadingListItemWithURL:[NSURL URLWithString:WebURL] title:Title previewText:SubTitile error:&error];
 
 if(AddStatus)
 {
 NSLog(@"Added URL Succesfully to Safari Reading List.");
 
 }
 else  {
 NSLog(@"Failed to add URL to Safari Reading List.");
 
 }
 
 return AddStatus;
 
 }
 */

// Notifications

-(void)PostLocalNotificationWithNotifierTitle:(NSString*)MainTitle
                                WithDataTitle:(NSString*)DataTitle
                                     DataBody:(NSString*)DataBody

{
    
    NSDate *alertTime = [[NSDate date]
                         dateByAddingTimeInterval:5.0];
    UIApplication* Application = [UIApplication sharedApplication];
    UILocalNotification* localNotifier = [[UILocalNotification alloc]
                                          init];
    if (localNotifier)
    {
        localNotifier.fireDate = alertTime;
        localNotifier.timeZone = [NSTimeZone defaultTimeZone];
        localNotifier.alertAction = @"View";
        localNotifier.repeatInterval = 0;
        localNotifier.soundName = @"bell_tree.mp3";
        localNotifier.alertBody =MainTitle;
        localNotifier.applicationIconBadgeNumber = Application.applicationIconBadgeNumber++;
        
        
        NSDictionary * UserInfo =[NSDictionary dictionaryWithObjectsAndKeys:DataTitle,@"title",DataBody,@"body", nil];
        
        
        localNotifier.userInfo = UserInfo;
        [Application scheduleLocalNotification:localNotifier];
        
        
        NSLog(@"Local Notification Scheduled at %@",alertTime);
    }
}


-(void)ActiveDiagonostics{
    
    NSString *platform = [UIDevice currentDevice].model;
    
    NSLog(@"[UIDevice currentDevice].model: %@",platform);
    NSLog(@"[UIDevice currentDevice].description: %@",[UIDevice currentDevice].description);
    NSLog(@"[UIDevice currentDevice].localizedModel: %@",[UIDevice currentDevice].localizedModel);
    NSLog(@"[UIDevice currentDevice].name: %@",[UIDevice currentDevice].name);
    NSLog(@"[UIDevice currentDevice].systemVersion: %@",[UIDevice currentDevice].systemVersion);
    NSLog(@"[UIDevice currentDevice].systemName: %@",[UIDevice currentDevice].systemName);
}


+(NSString*)GetUnixTimestamp:(NSDate*)date{
    
    NSTimeInterval UnixTime = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f", UnixTime];
    
}


+(NSString*)GenerateUnixTimeStampWithLocaleInfo:(NSDate*)DateInfo{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate * dateX = [formatter dateFromString:[formatter stringFromDate:DateInfo]];
    
    NSTimeInterval UnixTime = [dateX timeIntervalSince1970];
    NSString * _TS = [NSString stringWithFormat:@"%f", UnixTime];
    
    return _TS;
}

+(BOOL)CheckStringWhiteSpaceOnly:(NSString*)String{
    
    
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([[String stringByTrimmingCharactersInSet: set] length] == 0)
    {
        // String contains only whitespace.
        return YES;
    }else{
        
        [InterfaceManager DisplayAlertWithMessage:@"No internet"];
        return NO;
    }
    
    
    
}

+(BOOL)internetCheck
{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        
        return NO;
    }
    else
    {
        return YES;
    }
}


@end
