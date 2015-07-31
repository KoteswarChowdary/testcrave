//
//  NewFlourDetailViewController.h
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFlourDetailViewController : UIViewController<UIScrollViewDelegate>
//@property (retain,nonatomic)NSDictionary *getDict;
@property (nonatomic, retain) id getNames,getDesc,getImage,getPrice;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *desc;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UIView *viewOnScroll;
@property (strong, nonatomic) IBOutlet UILabel *price;


@end
