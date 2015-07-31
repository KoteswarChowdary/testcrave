//
//  AppDelegate.m
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "AppDelegate.h"
#import "PayPalMobile.h"

@implementation AppDelegate
@synthesize loadingView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // UITabBarController *tabBarController  = (UITabBarController *)self.window.rootViewController;
         
    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction : @"YOUR_CLIENT_ID_FOR_PRODUCTION",
                                                           PayPalEnvironmentSandbox : @"AWn8sRD_lvDf1QifbnAifL54N7F6AZAzQWgJ7a7fV7MDuijPm6uSgoJcuBW2"}];
    

    
    
    [self performSelector:@selector(loadingViewFade) withObject:nil];
  
    // Override point for customization after application launch.
   // [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    // Uncomment to assign a custom backgroung image
 [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navImg.png"] forBarMetrics:UIBarMetricsDefault];
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg@2x.png"] forBarMetrics: UIBarMetricsLandscapePhone];
    
    // Uncomment to change the back indicator image
    
//    UIImage * backButtonImage = [UIImage imageNamed: @"back-button.png"];
    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage: backButtonImage forState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
//    backButtonImage = [backButtonImage stretchableImageWithLeftCapWidth: 16 topCapHeight: 16];

    
    //-----------> to set backgroung color to view with image
//  [self.window setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]];
    
  //  UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"appbackground.png"]];
    //self.window.backgroundColor = [UIColor purpleColor];
    
   // [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back-button.png"]];
   // [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back-button.png"]];
    // Uncomment to change the font style of the title
   [self.window setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    
        return YES;
}

- (void) loadingViewFade
{
    loadingView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    loadingView.image = [UIImage imageNamed:@"Default.png"];
    [_window addSubview:loadingView];
    [_window bringSubviewToFront:loadingView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelay:3.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:_window cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
    loadingView.alpha = 0.0;
    [UIView commitAnimations];
    
    //Create and add the Activity Indicator to loadingView
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 430);
    activityIndicator.hidesWhenStopped = NO;
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(140, 435, 160, 30)];
    text.backgroundColor = [UIColor clearColor];
    text.textColor       = [UIColor whiteColor];
    text.font = [UIFont systemFontOfSize:14];
    text.text = @"Loading...";
    [loadingView addSubview:text];
    [loadingView addSubview:activityIndicator];
    [loadingView addSubview:activityIndicator];
    [activityIndicator startAnimating];
}

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    [loadingView removeFromSuperview];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
