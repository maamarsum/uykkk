//
//  ModelProduct.m
//  qatardeals
//
//  Created by Gizmeon Technologies on 14/01/15.
//  Copyright (c) 2015 Roman Efimov. All rights reserved.
//

#import "ModelProduct.h"

@implementation ModelProduct

@synthesize productId,productImage,productModel,productName,productPrice,productImageUrl,productDescription,productManufacturer,productQuantity,productThumbImage,productFeatures,productCartNumberOfItems,productAuthor,productRating,productReviewText,productDateAndTime,productReviewId,productSpecilaprice,productAvailability;
- (id)initWithCoder:(NSCoder *)decoder {
    
    //Here encoder and decoder are used to store this class in userdefaults
    if (self = [super init]) {
        productId = [decoder decodeObjectForKey:@"id"];
        productImage = [decoder decodeObjectForKey:@"image"];
        productModel = [decoder decodeObjectForKey:@"model"];
        productName = [decoder decodeObjectForKey:@"name"];
        productPrice = [decoder decodeObjectForKey:@"price"];
        productImageUrl = [decoder decodeObjectForKey:@"imageurl"];
        productDescription = [decoder decodeObjectForKey:@"description"];
        productManufacturer = [decoder decodeObjectForKey:@"manufacturer"];
        productQuantity = [decoder decodeObjectForKey:@"quantity"];
        productThumbImage = [decoder decodeObjectForKey:@"thumbimage"];
        productAuthor= [decoder decodeObjectForKey:@"author"];
        productDateAndTime = [decoder decodeObjectForKey:@"date_added"];
        productReviewText = [decoder decodeObjectForKey:@"text"];
        productRating = [decoder decodeObjectForKey:@"rating"];
        productFeatures = [decoder decodeObjectForKey:@"features"];
        productCartNumberOfItems = [decoder decodeObjectForKey:@"numberOfSelection"];
        productSpecilaprice = [decoder decodeObjectForKey:@"special"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:productId forKey:@"id"];
    [encoder encodeObject:productImage forKey:@"image"];
    [encoder encodeObject:productModel forKey:@"model"];
    [encoder encodeObject:productName forKey:@"name"];
    [encoder encodeObject:productPrice forKey:@"price"];
    [encoder encodeObject:productImageUrl forKey:@"imageurl"];
    [encoder encodeObject:productDescription forKey:@"description"];
    [encoder encodeObject:productManufacturer forKey:@"manufacturer"];
    [encoder encodeObject:productQuantity forKey:@"quantity"];
    [encoder encodeObject:productThumbImage forKey:@"thumbimage"];
    [encoder encodeObject:productAuthor forKey:@"author"];
    [encoder encodeObject:productDateAndTime forKey:@"date_added"];
    [encoder encodeObject:productReviewText forKey:@"text"];
    [encoder encodeObject:productRating forKey:@"rating"];
    [encoder encodeObject:productFeatures forKey:@"features"];
    [encoder encodeObject:productCartNumberOfItems forKey:@"numberOfSelection"];
    [encoder encodeObject:productCartNumberOfItems forKey:@"special"];
}
@end
