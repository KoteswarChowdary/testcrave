//
//  GiftCardDetails.h
//  WeCraveProject
//
//  Created by hari on 26/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceClass.h"

@interface GiftCardDetails : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic, retain) id giftNames,giftDesc,giftImage,giftPrice,giftId;
@property (strong, nonatomic) IBOutlet UIImageView *giftImages;
@property (strong, nonatomic) IBOutlet UILabel *quality;
@property (strong, nonatomic) IBOutlet UILabel *descView;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;

@property(nonatomic,retain) NSDictionary *getDict;
@property (strong, nonatomic) IBOutlet UIView *viewOnScroller;
@end
