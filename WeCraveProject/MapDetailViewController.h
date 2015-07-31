//
//  MapDetailViewController.h
//  WeCraveProject
//
//  Created by hari on 21/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapDetailViewController : UIViewController <UIScrollViewDelegate,MKMapViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (strong, nonatomic) NSArray *getArrayData;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UITableView *tableViewToDisplayDirections;
@property (strong, nonatomic) MKRoute *route;
@property (strong, nonatomic) IBOutlet UILabel *displayDistanceLabel;



@end
