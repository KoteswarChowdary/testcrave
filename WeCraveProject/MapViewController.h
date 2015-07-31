//
//  MapViewController.h
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate,MKAnnotation>
{
    IBOutlet UISegmentedControl *Segment;
    NSMutableArray *arrayTitle;
    NSMutableArray *annotations;
    NSMutableArray *arrayLog;
    NSMutableArray *arrayLati;
    NSMutableArray *arrayPlaceImages;
    
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *Segment;
@property (strong, nonatomic) NSMutableArray *arrayTitle;
@property (strong, nonatomic) NSMutableArray *arrayLog;
@property (strong, nonatomic) NSMutableArray *arrayPlaceImages;
@property (strong, nonatomic) NSMutableArray *arrayLati;
@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) NSString *allSteps;

-(IBAction)changeSeg;


@end
