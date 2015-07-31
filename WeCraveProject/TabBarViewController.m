//
//  TabBarViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 01/07/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
@synthesize strNum;

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
     self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.title = @"Crave";
    // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImg.png"] forBarMetrics:UIBarMetricsDefault];
    
     // self.selectedIndex = 1;
  // self.tabBar.tintColor = [UIColor redColor];
  //  self.selectedIndex = self.strNum.intValue;
  //  self.tabBarController.tabBar.barTintColor = [UIColor redColor];
    
    UITabBar *tabBar = self.tabBar;
   
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    [[self tabBar] setTintColor:[UIColor redColor]];
    
    tabBarItem1.title = @"Home";

    tabBarItem2.title = @"Toppings";
    tabBarItem3.title = @"Flavors";
    tabBarItem4.title = @"GiftCards";
    tabBarItem5.title = @"Locations";

    [tabBarItem1 setImage:[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem1 setSelectedImage:[[UIImage imageNamed:@"home_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [tabBarItem2 setImage:[[UIImage imageNamed:@"myplan.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem2 setSelectedImage:[[UIImage imageNamed:@"myplan_elected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setImage:[[UIImage imageNamed:@"flavors1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setSelectedImage:[[UIImage imageNamed:@"flavors2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setImage:[[UIImage imageNamed:@"settings.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setSelectedImage:[[UIImage imageNamed:@"settings_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem5 setImage:[[UIImage imageNamed:@"maps.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem5 setSelectedImage:[[UIImage imageNamed:@"maps_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
   

    // Change the tab bar background
  UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
  [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    NSLog(@"%f",self.tabBar.frame.size.height);
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];

    // Change the title color of tab bar items
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateHighlighted];
    


}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController: (UIViewController *)viewController
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
