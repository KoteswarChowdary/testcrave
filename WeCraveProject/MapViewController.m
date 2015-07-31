//
//  MapViewController.m
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "MapViewController.h"
#import "myAnnotation.h"
#import "MapDetailViewController.h"
#import "testViewController.h"
#import "Reachability.h"


#define METERS_PER_MILE 1609.344

@interface MapViewController ()
{
    NSString *str;
    NSString *imgstr;
    double lat;
    double log;
    CLPlacemark *thePlacemark;
    MKRoute *routeDetails;
    NetworkStatus statues;
    NSMutableArray *arraytoStoreSteps;
    NSString *displayDistance;
   

}

@end

@implementation MapViewController
@synthesize mapView,Segment,title,coordinate,arrayTitle,arrayLati,arrayLog,imageView
;


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //1 ,  40.740848 and longitude as -73.991134
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 45.495879;
    zoomLocation.longitude= -122.886887;
    // 2
   // MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
   // [self.mapView setRegion:viewRegion animated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
   
    [super viewDidLoad];
    //********************For Displaying as  OpenStreetMap on iOS 7 *********************
//    
//    NSString *template = @"http://tile.openstreetmap.org/{z}/{x}/{y}.png";         // (1)
//    MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:template]; // (2)
//    overlay.canReplaceMapContent = YES;					       // (3)
//    [self.mapView addOverlay:overlay level:MKOverlayLevelAboveLabels];	       // (4)
    
  //  ************************************************************************************
     self.edgesForExtendedLayout=UIRectEdgeNone;
    self.title = @"Locations";
    self.mapView.delegate = self;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
 
 // Image resize with bourds 
    [self setupImageView];
    
  //  *****************************Back And Home Buttons Code ************************************
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 60, 45);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
    
  
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

   
    self.arrayTitle = [[NSMutableArray alloc]initWithObjects:@"Aloha 20235 SW Tualatin Valley Hwy",@"2000 8th Avenue, West Linn, OR 97068, United States",@"Central Park Dental, 1500 Central Park Blvd, Fredericksburg, VA 22401, United States",@"1435 Stafford Marketplace, Stafford, VA 22554, (540) 808-1188",@"3610F King Street, Alexandria, VA 22302,(571) 490-8989",@"Halstead Square, 2750 Gallows Road Vienna, Virginia 22180,(703) 207-0090",@"West End Richmond, 10452 Ridgefield Parkway, Glenn Allen VA, 23060,(804) 447-0256",@"10160 Fairfax Blvd, Fairfax VA 22030, (703) 865-8253",nil];
    self.arrayLati = [[NSMutableArray alloc]initWithObjects:@"45.495879",@"45.346716",@"38.304251",@"38.479126",@"38.832153",@"38.879009", @"38.619854",@"38.863343",nil];
    self.arrayLog = [[NSMutableArray alloc]initWithObjects:@"-122.886887", @"-122.653599",@"-77.510734",@"-77.409153",@"-77.088404",@"-77.228104",@"-77.611776",@"-77.293954",nil];
    self.arrayPlaceImages = [@[ @"crave_1.jpg", @"crave_2.jpg", @"crave_3.jpg",@"crave_4.jpg",@"crave_5.jpg",@"crave_6.jpg",@"crave_7.jpg",@"crave_8.jpg" ] mutableCopy];
    
     for(int i=0; i<[self.arrayTitle count];i++)
     {
     CLLocationCoordinate2D theCoordinate1;
     myAnnotation* myAnnotation1=[[myAnnotation alloc] init];
         theCoordinate1.latitude = [[arrayLati objectAtIndex:i] doubleValue];
         theCoordinate1.longitude = [[arrayLog objectAtIndex:i] doubleValue];
         myAnnotation1.coordinate=theCoordinate1;
        

     myAnnotation1.title=[self.arrayTitle objectAtIndex:i];
         myAnnotation1.image = [self.arrayPlaceImages objectAtIndex:i];
        
     [self.mapView addAnnotation:myAnnotation1];
         [annotations addObject:myAnnotation1];
         
     }
     [self.mapView addAnnotations:annotations];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//  ***********************Checking the Internet Connections ****************************
    
    arraytoStoreSteps = [[NSMutableArray alloc]init];
    Reachability *reach = [Reachability reachabilityForInternetConnection];
   statues  = [reach currentReachabilityStatus];
    
    
}


-(IBAction) GoBack{
	[self.tabBarController setSelectedIndex:0];
}
-(IBAction)gotoHome
{
    [self.tabBarController setSelectedIndex:0];
}

 - (void)setupImageView {
 imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5f, 12.5f, 50.0f, 47.0f)];
 imageView.layer.cornerRadius = 4.0f;
 imageView.layer.masksToBounds = YES;
 imageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
 imageView.layer.borderWidth = 0.5f;

 }



-(IBAction)changeSeg{
	if(Segment.selectedSegmentIndex == 0){
        self.mapView.mapType = MKMapTypeStandard;
    
	}
	if(Segment.selectedSegmentIndex == 1){
         [self.mapView removeOverlay:routeDetails.polyline];
        self.mapView.mapType = MKMapTypeSatellite;
	}
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
   
    
    if([annotation isKindOfClass:[MKUserLocation class]])
        return annotation;

    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorGreen;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5, 5);
        annotationView.image = [UIImage imageNamed:@"appIcon.png"];
        
    }
    else {
        annotationView.annotation = annotation;
    }
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5f, 12.5f, 50.0f, 47.0f)];
    imageView.layer.cornerRadius = 4.0f;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    imageView.layer.borderWidth = 0.5f;
    imageView.image = [UIImage imageNamed:((myAnnotation *)annotation).image]   ;

    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.leftCalloutAccessoryView = imageView;
    
 //   UIImageView *leftCalloutView = [[UIImageView alloc]initWithImage:((AddressAnnotation *)annotation).image];
      return annotationView;
    
}


// this method is used to move to another detail view when we click on the decoluser button on map view
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
   
    
    NSLog(@"accessory button tapped for annotation %@", view.annotation);
    
  myAnnotation *annView = view.annotation;
    str = [[NSString alloc]initWithFormat:@"%@",annView.title];
    imgstr = [NSString stringWithFormat:@"%@",annView.image];
    lat = annView.coordinate.latitude;
    log = annView.coordinate.longitude;
    
    
    [self performSegueWithIdentifier:@"details" sender:view];
    
}
// this is called when we click on the pin  in map view

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
     [self.mapView removeOverlay:routeDetails.polyline];

  NSLog(@"did select pin accessory button tapped for annotation %@", view.annotation);
    myAnnotation *annView = view.annotation;
    str = [[NSString alloc]initWithFormat:@"%@",annView.title];
    NSLog(@"str is %@",str);
    imgstr = [NSString stringWithFormat:@"%@",annView.image];
     NSLog(@"name is %@",annView.title);
    if(statues != NotReachable)
    {
        
         [self addressSearch:annView.title];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Internet Connected" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        self.allSteps = @"No Internet Connection";
        //exit(0);
    }

   
   
    
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"details"])
    {
    
     MapDetailViewController *destViewController = segue.destinationViewController;
        NSArray *arraydata = @[str,imgstr,displayDistance];
        destViewController.getArrayData = arraydata;
        destViewController.route = routeDetails;
        }
}


#pragma -to Implement the Directions and Distance Of Store

- (void)addressSearch:(NSString *)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:sender completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            thePlacemark = [placemarks lastObject];
            float spanX = 20.00725;
            float spanY = 20.00725;
            MKCoordinateRegion region;
            region.center.latitude = thePlacemark.location.coordinate.latitude;
            region.center.longitude = thePlacemark.location.coordinate.longitude;
            region.span = MKCoordinateSpanMake(spanX, spanY);
            [self.mapView setRegion:region animated:YES];
            [self routeButtonPressed];
           // [self addAnnotation:thePlacemark];
        }
    }];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer  * routeLineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:routeDetails.polyline];
    routeLineRenderer.strokeColor = [UIColor greenColor];
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

- (void)routeButtonPressed {
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:thePlacemark];
    
    
    
    CLLocationCoordinate2D destinationCoords = CLLocationCoordinate2DMake(38.8977, -77.0365);
    MKPlacemark *sourcePlacemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem *source = [[MKMapItem alloc] initWithPlacemark:sourcePlacemark];
    [directionsRequest setSource:source];
    

    
    
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else
        {
            routeDetails = response.routes.lastObject;
            [self.mapView addOverlay:routeDetails.polyline];
           NSLog(@"Street is %@",[placemark.addressDictionary objectForKey:@"Street"]);
           NSLog(@"Miles is %@", [NSString stringWithFormat:@"%0.1f Miles", routeDetails.distance/1609.344]);
            displayDistance = [NSString stringWithFormat:@"%0.1f Miles",routeDetails.distance/1609.344];
            NSLog(@"Transport is %@",[NSString stringWithFormat:@"%u" ,routeDetails.transportType]);
            self.allSteps = @"";
            for (int i = 0; i < routeDetails.steps.count; i++) {
                MKRouteStep *step = [routeDetails.steps objectAtIndex:i];
                NSString *newStep = step.instructions;
                [arraytoStoreSteps addObject:newStep];
                self.allSteps = [self.allSteps stringByAppendingString:newStep];
                self.allSteps = [self.allSteps stringByAppendingString:@"\n\n"];
             
               

            }
                   }
    }];
  //  return self.allSteps;
}


@end
