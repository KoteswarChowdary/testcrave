//
//  GiftCardTypesTableViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 20/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftCardTypesTableViewController : UITableViewController
{
    NSArray *flavorsTypesArray;
    UIActivityIndicatorView *activityIndicator;
}
@property(nonatomic,retain) NSString *catId;

@end
