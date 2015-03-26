//
//  JSONParser.m
//  Lubna
//
//  Created by Febin Babu Cheloor on 24/05/14.
//  Copyright (c) 2014 Gizmeon Technologies. All rights reserved.
//

#import "JSONParser.h"
#import "NSDictionary+BinSystemsDicitonary.h"
#import "NSArray+BinSystems.h"
#import "ModelUser.h"

//Models

#import "ModelProduct.h"
#import "ModelCustomer.h"
#import "ModelSalesHistory.h"


@implementation JSONParser



+(NSArray*)ParseProducts:(NSDictionary*)JSONData{
    
    NSMutableArray * Buffer;
    NSArray * Products = [JSONData valueForKey:@"products" ifKindOf:[NSArray class] defaultValue:nil];
    
    NSLog(@"Products Parser Count : %i",[Products count]);
    
    if (Products) {
        
        Buffer = [[NSMutableArray alloc]init];
        
        for (NSUInteger indexI = 0; indexI < Products.count;  indexI++) {
            
            
            ModelProduct * Model = [[ModelProduct alloc]init];
            
            Model.ProductBarcode = [Products[indexI]valueForKey:@"Barcode" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductCode = [Products[indexI]valueForKey:@"Code" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductDescription = [Products[indexI]valueForKey:@"Desc" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPackSize = [Products[indexI]valueForKey:@"PackSize" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductStockStatus = [Products[indexI]valueForKey:@"FreeStock" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductTimeStamp = [Products[indexI]valueForKey:@"timestamp" ifKindOf:[NSString class] defaultValue:nil];
            
            //ProductID
            
            Model.ProductID = [Products[indexI]valueForKey:@"id" ifKindOf:[NSString class] defaultValue:nil];
            
            
            //Price Tier PPA - F
            
            Model.ProductPriceTierA = [Products[indexI]valueForKey:@"PPA" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPriceTierB = [Products[indexI]valueForKey:@"PPB" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPriceTierC = [Products[indexI]valueForKey:@"PPC" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPriceTierD = [Products[indexI]valueForKey:@"PPD" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPriceTierE = [Products[indexI]valueForKey:@"PPE" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductPriceTierF = [Products[indexI]valueForKey:@"PPF" ifKindOf:[NSString class] defaultValue:nil];
            
            // EPA -EPF
            
            
            Model.ProductEPA = [Products[indexI]valueForKey:@"EPA" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductEPB = [Products[indexI]valueForKey:@"EPB" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductEPC = [Products[indexI]valueForKey:@"EPC" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductEPD = [Products[indexI]valueForKey:@"EPD" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductEPE = [Products[indexI]valueForKey:@"EPE" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.ProductEPF = [Products[indexI]valueForKey:@"EPF" ifKindOf:[NSString class] defaultValue:nil];
            
            //Special Price and Text
            
            Model.ProductSpecialPrice = @"99";
            Model.ProductSpecialPriceText = @"Give it for free";
            
            
            [Buffer addObject:Model];
            
        }
    }
    
    return Buffer.count > 0 ? Buffer : nil;
}

+(ModelUser*)parseUserLoginJson:(NSDictionary*)JSONDict {
    
    NSError *error = nil;
   
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:JSONDict options:0 error:&error];
    
    
    NSArray * Result1 = [JSONDict valueForKey:@"resultSet"];
    
    ModelUser * User = [ModelUser new];

    if (Result1) {
        

        
        
        User.UserId= [Result1 valueForKey:@"UserId" ifKindOf:[NSString class] defaultValue:nil];
        User.UserName = [Result1 valueForKey:@"UserName" ifKindOf:[NSString class] defaultValue:nil];
        User.DisplayName = [Result1 valueForKey:@"DisplayName" ifKindOf:[NSString class] defaultValue:nil];
        User.Token = [Result1 valueForKey:@"Token" ifKindOf:[NSString class] defaultValue:nil];
        User.Email= [Result1 valueForKey:@"Email" ifKindOf:[NSString class] defaultValue:nil];
      
       
    }
     return User;
}


+(NSArray*)ParseCustomers:(NSDictionary*)JSONData{
    
    NSMutableArray * Buffer;
    
    NSArray * Customers = [JSONData valueForKey:@"customers" ifKindOf:[NSArray class] defaultValue:nil];
    
    NSLog(@"Customers Parser Count : %i",[Customers count]);
    
    if (Customers) {
        
        Buffer = [[NSMutableArray alloc]init];
        
        for (NSUInteger indexI = 0; indexI < Customers.count;  indexI++) {
            
            ModelCustomer * Model = [ModelCustomer new];
            
            Model.CustomerCode = [Customers [indexI]valueForKey:@"Code" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerCreditLimit = [Customers [indexI]valueForKey:@"CredLim" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerCurrentBalance = [Customers [indexI]valueForKey:@"CurrBal" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerAddressLine1 = [Customers [indexI]valueForKey:@"NAD1" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerAddressLine2 = [Customers [indexI]valueForKey:@"NAD2" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerAddressLine3 = [Customers [indexI]valueForKey:@"NAD3" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerAddressLine4 = [Customers [indexI]valueForKey:@"NAD4" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerName = [Customers [indexI]valueForKey:@"Name" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerPhoneNumber= [Customers [indexI]valueForKey:@"TelNo" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerTier= [Customers [indexI]valueForKey:@"Tier" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerStopStatus= [Customers [indexI]valueForKey:@"Stop" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.CustomerTimeStamp = [Customers [indexI]valueForKey:@"unix_timestamp" ifKindOf:[NSString class] defaultValue:nil];
            
            
            
            [Buffer addObject:Model];
            
        }
    }
    
    return Buffer.count > 0 ? Buffer : nil;
}

+(NSArray*)ParseSalesHistory:(NSDictionary*)JSONData{
    
    NSMutableArray * Buffer;
    
    NSArray * SalesHistory = [JSONData valueForKey:@"sales" ifKindOf:[NSArray class] defaultValue:nil];
    
    NSLog(@"SalesHistory Parser Count : %i",[SalesHistory count]);
    
    if (SalesHistory) {
        
        Buffer = [[NSMutableArray alloc]init];
        
        for (NSUInteger indexI = 0; indexI < SalesHistory.count;  indexI++) {
            
            ModelSalesHistory * Model = [ModelSalesHistory new];
            
            Model.SalesHistoryDate = [SalesHistory [indexI]valueForKey:@"Date" ifKindOf:[NSString class] defaultValue:nil];
            
        
            Model.SalesHistoryID= [SalesHistory [indexI]valueForKey:@"ID" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesHistoryProductCode = [SalesHistory [indexI]valueForKey:@"Product" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesHistoryQuantity = [SalesHistory [indexI]valueForKey:@"Qty" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesHistorySplitPack = [SalesHistory [indexI]valueForKey:@"SplitPack" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesHistoryTotalPrice = [SalesHistory [indexI]valueForKey:@"TotalPrice" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesHistoryUnitPrice = [SalesHistory [indexI]valueForKey:@"UnitPrice" ifKindOf:[NSString class] defaultValue:nil];
            
            Model.SalesCustomerID = [SalesHistory [indexI]valueForKey:@"Customer" ifKindOf:[NSString class] defaultValue:nil];
            
            
            
            [Buffer addObject:Model];
            
        }
    }
    
    return Buffer.count > 0 ? Buffer : nil;
}

@end
