//
//  MapDetailViewController.m
//  WeCraveProject
//
//  Created by hari on 21/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "MapDetailViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface MapDetailViewController ()

@end

@implementation MapDetailViewController
@synthesize scroller,descLabel,addressLabel,imgView;

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
    self.tableViewToDisplayDirections.delegate= self;
    self.tableViewToDisplayDirections.dataSource= self;
    // ****************to over come the navigation bar*************************
    
     self.edgesForExtendedLayout=UIRectEdgeNone;
    [self.view addSubview:scroller];
    [self.scroller setScrollEnabled:YES];
    
  // **************** For loading and Displing the View *************************
    
    [scroller addSubview:imgView];
    [scroller addSubview:descLabel];
    [scroller addSubview:addressLabel];
    self.descLabel.text = [self.getArrayData objectAtIndex:0];
    self.imgView.image = [UIImage imageNamed:[self.getArrayData objectAtIndex:1] ];
    self.displayDistanceLabel.text = [NSString stringWithFormat:@"(%@)",[self.getArrayData objectAtIndex:2]];
    
    
  // **************** Buttons back nad Home *************************
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
    backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
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


   }
-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.tabBarController setSelectedIndex:0];
}
-(void)viewDidLayoutSubviews
{
    self.scroller.contentSize = CGSizeMake(320, 560);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   }

#pragma Table View to Display Directions Table Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.route.steps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Pull out the correct step
    
    // Configure the cell...
    UIColor *color = [UIColor redColor];
    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 12.0 ];
    cell.textLabel.textColor = color;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = myFont;
   // cell.textLabel.text = [NSString stringWithFormat:@"%02d)  %@ ", indexPath.row, [[self.getArrayData objectAtIndex:2] objectAtIndex:indexPath.row]];
    
     MKRouteStep *step = self.route.steps[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%02d)  %@ %0.1fkm", indexPath.row,step.instructions, step.distance / 1000.0];
    cell.detailTextLabel.text = step.notice;
    
    return cell;
}



@end
