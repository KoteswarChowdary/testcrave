//
//  GiftCardTypesViewController.h
//  WeCraveProject
//
//  Created by hari on 10/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftCardTypesViewController : UIViewController
{
    NSArray *array_data;
   }
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
- (IBAction)birthdayGC:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)businessGiftCard:(id)sender;
@end
