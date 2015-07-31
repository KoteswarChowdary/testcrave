//
//  FlavorsTableViewController.h
//  WeCraveProject
//
//  Created by hari on 09/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewFloursTableViewController.h"

@interface FlavorsTableViewController : UITableViewController<NewFloursTableViewControllerDelegate>
{
    NSArray *array_data;
    NSMutableArray *flavorCatId;
    NSMutableArray *flavorSubcatIds;
    NSMutableArray *flavorSubCatNames;
    UIActivityIndicatorView *act;
    NSMutableData *_responseData;
    

}
@property(nonatomic,retain)NSString *catId;
@property(nonatomic,retain)NSString *subCatId;
-(void)startSampleProcess; // Instance method
@end
