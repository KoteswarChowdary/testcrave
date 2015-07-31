//
//  ToppingDetailsTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 01/07/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "ToppingDetailsTableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ToppingDetailsTableViewController ()
{
    NSUserDefaults *toppingsDetailsRetrieve;
}

@end

@implementation ToppingDetailsTableViewController
@synthesize tableData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"logoImg.png"];
    
    self.tableView.tableHeaderView = headerView;
    
    
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
    self.navigationItem.title = @"Toppings";
    
    
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    
    toppingsDetailsRetrieve = [NSUserDefaults standardUserDefaults];
    
}

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section==0)
    {
        return 4;
    }
    if (section==1) {
        return 0;
    }
    else{
        return 0;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if (indexPath.row ==0) {
            return 40;
        }
        if (indexPath.row ==1) {
            return 280;
        }
        if (indexPath.row ==2) {
            return 50;
        }
        
        return 80;
    }
    else
        //  if (indexPath.section ==1) {
        return 60;
    //    }
    //    if (indexPath.section ==2) {
    //        return 25;
    //    }
    // return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    tableView.separatorColor = [UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section==0) {
        tableView.separatorColor = [UIColor clearColor];
        
                if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@"\t\t\t%@",[toppingsDetailsRetrieve valueForKey:@"tname"]];
            NSLog(@"dsata in string 1%@",string);
             cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:16.0];
            cell.textLabel.textColor = [UIColor purpleColor];
            cell.textLabel.text = string;
            
        }
        
        if (indexPath.row == 1)
        {
            
           
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,280)];
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = view.bounds;
            gradient.colors = [NSArray arrayWithObjects:UIColorFromRGB(0x87FC70).CGColor,UIColorFromRGB(0x0BD318).CGColor, nil];
            [view.layer insertSublayer:gradient atIndex:0];
            [cell.contentView addSubview:view];
            // cell.backgroundColor = [UIColor grayColor]; #5856D6
            UIImageView *photo = [[UIImageView alloc]init];
            photo.frame = CGRectMake(0, 0, 250, 250);
            
            [photo setBackgroundColor:[UIColor whiteColor]];
            photo.layer.cornerRadius = 15;
            photo.layer.borderWidth = 5.5f;
            photo.layer.borderColor = [UIColor whiteColor].CGColor;
            photo.clipsToBounds= YES;
            // photo.image = [UIImage imageWithData:[flavorDetailsRetrieve valueForKey:@"image"]];
            [photo setImageWithURL:[toppingsDetailsRetrieve valueForKey:@"timage"] placeholderImage:[UIImage imageNamed:@"Hisoka.jpg"]];
                        photo.contentMode = UIViewContentModeScaleAspectFill;
            photo.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2+18);
            [cell.contentView addSubview:photo];
            
            
        }
        if (indexPath.row == 2)        {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Cost: %@$",[toppingsDetailsRetrieve valueForKey:@"tprice"]];
            NSLog(@"data in string  2 %@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
            
        }
        if (indexPath.row == 3)
        {
            
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Descrption/n%@",[toppingsDetailsRetrieve valueForKey:@"tdesc"]];
            NSLog(@"dsata in string  2 %@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:14.0];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
            
        }
    }
    
    if (indexPath.section==1) {
        // cell.textLabel.lineBreakMode = 2;
        [[cell textLabel] setNumberOfLines:0]; // unlimited number of lines
        //  [[cell textLabel] setLineBreakMode:UILineBreakModeWordWrap];
        if (indexPath.row ==0) {
            NSLog(@"data in indexpath.row %ld",(long)indexPath.row);
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
            NSString *string = [NSString stringWithFormat:@"Desc:  %@",[toppingsDetailsRetrieve valueForKey:@"tdesc"]];
            //            CGRect frame = cell.textLabel.frame;
            //            frame.size.width = CGRectGetWidth(frame);
            //            frame.origin.x = 0.0;
            //  cell.textLabel.frame = frame;
            cell.textLabel.textColor = [UIColor blueColor];
            cell.detailTextLabel.text = string;
        }
        else
        {
            
            
            NSString *string = [NSString stringWithFormat:@"Price:  %@",[toppingsDetailsRetrieve valueForKey:@"tprice"]];
            
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
            cell.textLabel.text = [string description];
        }
        //    if (indexPath.section==2)
        //    
        //    {
        //        cell.textLabel.text = [flavorDetailsRetrieve valueForKey:@"price"];
        //    }
    }
    
    return cell;
}



@end
