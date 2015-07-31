//
//  BirthdayGiftcardsTableViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 26/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirthdayGiftcardsTableViewController : UITableViewController
{
    // to url data
    NSMutableArray *allProducts;
    NSMutableArray *allArrayObjects;
    NSArray *jsonArray;
    id myjson;
    NSData* myData;
     
}
@property(nonatomic,retain)NSString *catId;

@end
