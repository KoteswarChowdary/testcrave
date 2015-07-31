//
//  MainMenuCollectionViewController.h
//  WeCraveProject
//
//  Created by Koteswar on 13/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuCollectionViewController : UICollectionViewController
{
    NSArray* recipeImages;
    

}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@end
