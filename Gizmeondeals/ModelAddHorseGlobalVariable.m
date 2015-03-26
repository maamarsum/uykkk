//
//  ModelAddHorseGlobalVariable.m
//  Stablemate
//
//  Created by Gizmeon Technologies on 22/10/14.
//  Copyright (c) 2014 Gizmeon Terchnologies. All rights reserved.
//

#import "ModelAddHorseGlobalVariable.h"

@implementation ModelAddHorseGlobalVariable
@synthesize horseId,horseName,horseBreed,horseBirthYear,horseGender,horseColor,horsePhots,horseGeneralNotesDocumemnts,horseFeedAndCareDoucuments,horseRecorsAndFormsDocuments,coverPictureDocId,addHorseFlag,dictionaryHorseDetails,HorseCount,AccessType,isFromRight;


static ModelAddHorseGlobalVariable *instance=nil;

-(id)init
{
    self =[super init];
    
    if (self) {
    
    horseGeneralNotesDocumemnts=[NSMutableArray new];
    horsePhots=[NSMutableArray new];
    horseGeneralNotesDocumemnts=[NSMutableArray new];
    horseFeedAndCareDoucuments=[NSMutableArray new];
    horseRecorsAndFormsDocuments=[NSMutableArray new];
        dictionaryHorseDetails = [ NSDictionary new];
        HorseCount = 0;
        
      coverPictureDocId  = @"@";
        
           
    }
    return self;
}
+(ModelAddHorseGlobalVariable*)getInstance
{
    @synchronized(self)
    {
        if (instance==nil) {
            instance=[ModelAddHorseGlobalVariable new];
            
        }
    }
    
    return instance;
}

+(ModelAddHorseGlobalVariable*)initiate
{
    
            instance=[ModelAddHorseGlobalVariable new];
          
    
    return instance;
}
@end

