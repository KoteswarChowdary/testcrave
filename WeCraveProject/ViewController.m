//
//  ViewController.m
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "ViewController.h"
#import "FlavorsTableViewController.h"
#import "ToppingsTableViewController.h"
#import "TabBarViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     self.edgesForExtendedLayout = UIRectEdgeNone;
 
     self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    [self.scoller setScrollEnabled:YES];
    [self.scoller addSubview:self.activityIndicator];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"logoImg.png"];
    
    [self.view addSubview:headerView];

    

    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    }

-(void)viewWillDisappear:(BOOL) animated {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [super viewWillDisappear:animated];


}


-(void)viewDidLayoutSubviews
{
    self.scoller.contentSize = CGSizeMake(320, 700);
}


//---------> THIS METHOD IS USED TO COME BACK TO HOME PAGE FROM ANY VIEW CONTROLLER.
- (IBAction)unwindToHomeController:(UIStoryboardSegue*)sender
{
    NSLog(@"Home View Controller is Called");
}


- (IBAction)newOfferBtn:(id)sender {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
       [self.tabBarController setSelectedIndex:1];
}

- (IBAction)flavourBtn:(id)sender {
     [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
    
    [self.tabBarController setSelectedIndex:2];

    
  }

- (IBAction)giftsBtn:(id)sender {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];

     [self.tabBarController setSelectedIndex:3];
    
}

- (IBAction)findBtn:(id)sender {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];

    
    [self.tabBarController setSelectedIndex:4];
}



@end
