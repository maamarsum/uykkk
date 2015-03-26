//
//  ModelAddHorseGlobalVariable.h
//  Stablemate
//
//  Created by Gizmeon Technologies on 22/10/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelAddHorseGlobalVariable : NSObject
{
    BOOL addHorseFlag;
  NSString * horseId;
  NSString * horseName;
  NSString * horseBreed;
  NSString * horseBirthYear;
  NSString * horseGender;
  NSString * horseColor;
    NSString *coverPictureDocId;
   NSMutableArray *horsePhots;
   NSMutableArray *horseGeneralNotesDocumemnts;
   NSMutableArray *horseFeedAndCareDoucuments;
   NSMutableArray *horseRecorsAndFormsDocuments;
   NSDictionary *dictionaryHorseDetails;
    NSString * AccessType;
    long HorseCount;
    BOOL isFromRight;

}
@property BOOL addHorseFlag;
@property(nonatomic,strong) NSString * horseId;
@property(nonatomic,strong) NSString * horseName;
@property(nonatomic,strong) NSString * horseBreed;
@property(nonatomic,strong) NSString * horseBirthYear;
@property(nonatomic,strong) NSString * horseGender;
@property(nonatomic,strong) NSString * horseColor;
@property(nonatomic,strong) NSString *coverPictureDocId;
@property(nonatomic,strong) NSMutableArray *horsePhots;
@property(nonatomic,strong) NSMutableArray *horseGeneralNotesDocumemnts;
@property(nonatomic,strong) NSMutableArray *horseFeedAndCareDoucuments;
@property(nonatomic,strong) NSMutableArray *horseRecorsAndFormsDocuments;
@property(nonatomic,strong)NSDictionary *dictionaryHorseDetails;

@property long HorseCount;
@property(nonatomic,strong)NSString * AccessType;
@property BOOL isFromRight;



+(ModelAddHorseGlobalVariable *)getInstance;

+(ModelAddHorseGlobalVariable *)initiate;
@end
