//
//  NewFloursTableViewController.h
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceClass.h"

@protocol NewFloursTableViewControllerDelegate <NSObject>

@required
-(void)testUrlDataInView:(NSString*)str;

@end

@interface NewFloursTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
     NSArray *array_data;
    NSMutableArray *modal_data;
    NSMutableArray *imagesArray;
    NSMutableArray *priceArray;
    NSString *catId;
    NSString *subCatId;
    NSString *getCatId;
    NSString *getSubcatId;
    ServiceClass *service;
    UIActivityIndicatorView *act;
    
    // NSMutable Array's used to Strore data fromgetting URL
    NSMutableArray *allProducts;
    NSMutableArray *allArrayObjects;
    // for URL JsonArray
    NSArray *jsonArray;

}
@property (weak, nonatomic) id <NewFloursTableViewControllerDelegate> delegate;
@property(nonatomic,retain) NSString *catId;
@property(nonatomic,retain) NSString *subCatId;
@property(nonatomic,retain)  NSMutableArray *allArrayObjects;
-(NSMutableDictionary*)getFlavorsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;
-(void)sampleProcessToCallDelegate:(NSString*)cutId andsubcatId:(NSString*)sunCatid;




@end
