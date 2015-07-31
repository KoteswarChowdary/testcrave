//
//  GiftCardViewController.h
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceClass.h"

@interface GiftCardViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    NSArray *array_data;
    NSMutableArray *id_data;
    NSMutableArray *gettingdata;
    NSMutableArray *modal_data;
    NSMutableArray *price_data ;
    NSMutableArray *quantity_data;
    NSMutableArray *imagesArray;
     ServiceClass *service;
    // for data from URl
    NSMutableArray *allProducts;
    NSMutableArray *allArrayObjects;
    NSArray *jsonArray;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) NSString *catId;
@property(nonatomic,retain) NSString *subCatId;
@property(nonatomic,retain)  NSMutableDictionary* responseDict;

-(NSMutableDictionary*)getGiftcardByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;

@end
