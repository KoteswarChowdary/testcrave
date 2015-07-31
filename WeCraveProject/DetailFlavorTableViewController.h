//
//  DetailFlavorTableViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 09/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"

@interface DetailFlavorTableViewController : UITableViewController<StarRatingViewDelegate>
@property (nonatomic, retain) NSMutableArray *tableData;
-(IBAction)Zoomme:(UIPinchGestureRecognizer*)reconginzer;
@property (nonatomic,strong)TQStarRatingView *starRatingView;

@end
