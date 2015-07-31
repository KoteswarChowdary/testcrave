//
//  GiftCardDetailTableViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 12/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"

@interface GiftCardDetailTableViewController : UITableViewController<StarRatingViewDelegate>
@property (nonatomic, retain) id giftNames,giftDesc,giftImage,giftPrice,giftId;
@property (nonatomic,strong)TQStarRatingView *starRatingView;


@end
