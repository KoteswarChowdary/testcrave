//
//  SampleViewViewController.h
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleViewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate>
{

    NSDictionary *flickrDictionary;
    
    NSMutableArray *cFRAIPArray;
    NSMutableData *myData;
    NSArray *array1;
   //UIImageView *imageView;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageOne;


@end
