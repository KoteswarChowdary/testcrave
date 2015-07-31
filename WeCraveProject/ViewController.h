//
//  ViewController.h
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) NSString *str;
@property (strong, nonatomic) IBOutlet UIScrollView *scoller;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)newOfferBtn:(id)sender;

- (IBAction)flavourBtn:(id)sender;
- (IBAction)giftsBtn:(id)sender;
- (IBAction)findBtn:(id)sender;



@end
