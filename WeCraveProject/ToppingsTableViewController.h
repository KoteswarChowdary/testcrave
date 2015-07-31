//
//  ToppingsTableViewController.h
//  WeCraveProject
//
//  Created by hari on 09/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToppingsTableViewController : UITableViewController
{
    NSArray *array_data;
    NSMutableArray *toppingNames;
    NSMutableArray *toppingCatId;
    NSMutableArray *toppingSubCatId;
    
    UIActivityIndicatorView *act;
}
@property(nonatomic,retain)NSString *catId;
@property(nonatomic,retain)NSString *subCatId;

@end
