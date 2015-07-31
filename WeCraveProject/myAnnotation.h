//
//  myAnnotation.h
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface myAnnotation : NSObject
@property (strong, nonatomic)  NSString *title;
@property (nonatomic, strong) UIImage *image;
//@property (nonatomic, copy) NSString *address;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

//-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title ;

@end
