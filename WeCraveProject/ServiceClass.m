//
//  ServiceClass.m
//  WeCraveProject
//
//  Created by hari on 26/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "ServiceClass.h"

@implementation ServiceClass

-(NSMutableDictionary*)getProductsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSMutableArray * prdtDescArray=[NSMutableArray array];
    NSMutableArray* prdtPriceArray=[NSMutableArray array];
    NSMutableArray* prdtIdArray=[NSMutableArray array];
    NSMutableArray *prdtNameArray = [NSMutableArray array];
    NSMutableArray *prdtImgArray = [NSMutableArray array];
    
    
    // create the URL we'd like to query
    NSString *urlStr = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
       // NSArray *jsonArray = (NSArray *)myJSON;
       jsonArray = [myjson objectForKey:@"productLists"];
        NSLog(@"data in array is %@",jsonArray);

        for (int i=0 ; i<[jsonArray count] ; i++) {
            
            [prdtPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
            [prdtDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"desc"]];
            [prdtNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"pname"]];
            [prdtImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            [prdtIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"proid"]];
            //[urlString appendString:[[jsonArray objectAtIndex:i]objectForKey:@"imageurl"]];
           // UIImage *imageObj = [self getImageFromUrl:urlString];
            //urlString = nil;
           // [imagesArray addObject:imageObj];
        }
        [dict setValue:prdtPriceArray forKey:@"price"];
        [dict setValue:prdtDescArray forKey:@"desc"];
        [dict setValue:prdtIdArray forKey:@"pid"];
        [dict setValue:prdtNameArray forKey:@"pname"];
        [dict setValue:prdtImgArray forKey:@"image"];
        
    }
    return dict;
}


-(NSMutableDictionary*)getGiftcardByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSMutableArray * giftCardDescArray=[NSMutableArray array];
    NSMutableArray* giftCardPriceArray=[NSMutableArray array];
    NSMutableArray* giftCardIdArray=[NSMutableArray array];
    NSMutableArray *giftCardNameArray = [NSMutableArray array];
    NSMutableArray *giftCardImgArray = [NSMutableArray array];
    NSMutableArray *giftCardtotviewArray = [NSMutableArray array];
    
    
    
    
    
    // create the URL we'd like to query
    NSString *urlStr = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
    
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata.... is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        // NSArray *jsonArray = (NSArray *)myJSON;
        jsonArray = [myjson objectForKey:@"productLists"];
        NSLog(@"data in jsonarray...... is %@",jsonArray);
        //NSLog(@"data in jsonarray...... is %i",jsonArray.count);

        for (int i=0 ; i<[jsonArray count] ; i++)
        {
            [giftCardPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
            [giftCardDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"desc"]];
            [giftCardNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"pname"]];
            [giftCardImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            [giftCardIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"proid"]];
            [giftCardtotviewArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"totview"]];
            
        }
        [dict setValue:giftCardPriceArray forKey:@"price"];
        [dict setValue:giftCardDescArray forKey:@"desc"];
        [dict setValue:giftCardIdArray forKey:@"id"];
        [dict setValue:giftCardNameArray forKey:@"name"];
        [dict setValue:giftCardImgArray forKey:@"image"];
        [dict setValue:giftCardtotviewArray forKey:@"totview"];
        
        
    }
    return dict;

}

 


@end
