//
//  AppDelegate.h
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     UIImageView *loadingView;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UIImageView *loadingView;

@end
