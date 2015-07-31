//
//  FlipsideViewController.h
//  WeCraveProject
//
//  Created by hari on 28/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"
@class FlipsideViewController;

@protocol ZZFlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
- (BOOL)acceptCreditCards;
- (void)setAcceptCreditCards:(BOOL)processCreditCards;

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, strong, readwrite) NSString *resultText;

@end

#pragma mark -

@interface FlipsideViewController : UIViewController
@property(weak, nonatomic) id <ZZFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
