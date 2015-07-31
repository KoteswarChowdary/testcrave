//
//  PayViewController.h
//  WeCraveProject
//
//  Created by hari on 28/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipsideViewController.h"
#import "PayPalMobile.h"


@interface PayViewController : UIViewController<PayPalFuturePaymentDelegate,PayPalPaymentDelegate,UIPopoverControllerDelegate>

@property(nonatomic, strong, readwrite) UIPopoverController *flipsidePopoverController;

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, assign, readwrite) BOOL acceptCreditCards;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property(nonatomic,retain) NSMutableDictionary *detailDict;
@property (strong, nonatomic) IBOutlet UILabel *amountDisplayLabel;

@end
