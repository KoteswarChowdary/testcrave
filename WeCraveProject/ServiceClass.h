//
//  ServiceClass.h
//  WeCraveProject
//
//  Created by hari on 26/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceClass : NSObject
{
    NSArray *jsonArray;
}

-(NSMutableDictionary*)getProductsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;
-(NSMutableDictionary*)getGiftcardByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;


@end
