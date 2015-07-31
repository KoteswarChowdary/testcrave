//
//  SubGCTypesTableViewController.h
//  WeCraveProject
//
//  Created by hari on 10/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubGCTypesTableViewController : UITableViewController
{
    NSArray *array_data;
    NSMutableArray *giftCatId;
    NSMutableArray *giftSubcatIds;
    NSMutableArray *giftSubCatNames;
    UIActivityIndicatorView *act;
    // to url data
    NSMutableArray *allProducts;
    NSMutableArray *allArrayObjects;
    NSArray *jsonArray;

}
@property(nonatomic,retain)NSString *catId;
@property(nonatomic,retain)NSString *subCatId;


@end
