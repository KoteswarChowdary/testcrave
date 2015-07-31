//
//  SubCatToppingsTableViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 01/07/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCatToppingsTableViewController : UITableViewController
{
    // NSMutable Array's used to Strore data fromgetting URL
    NSMutableArray *allProducts;
    NSMutableArray *allArrayObjects;
    // for URL JsonArray
    NSArray *jsonArray;
    UIActivityIndicatorView *act;

}
@property(nonatomic,retain) NSString *catId;
@property(nonatomic,retain) NSString *subCatId;
@property(nonatomic,retain)  NSMutableArray *allArrayObjects;
-(NSMutableDictionary*)getFlavorsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;
@end
