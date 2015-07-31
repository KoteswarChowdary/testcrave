//
//  DetailFlavorTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 09/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "DetailFlavorTableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DetailFlavorTableViewController ()
{
    NSUserDefaults *flavorDetailsRetrieve;
}

@end

@implementation DetailFlavorTableViewController
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
    
    
    
    _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(110, 210, 130, 30)
                                                 numberOfStar:5];
    _starRatingView.delegate = self;

    
    
    
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	////NSString *bckbtn = @"Back";
	//[backButton setTitle:bckbtn forState:UIControlStateNormal];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 60, 45);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
  //  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flavors_head.png"]];
    self.navigationItem.title = @"Flavour";

    
    
    UIButton *btnNext1 =[[UIButton alloc] init];
   // NSString *btntitle = @"Home";
	//[btnNext1 setTitle:btntitle forState:UIControlStateNormal];
    
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    
    
  flavorDetailsRetrieve = [NSUserDefaults standardUserDefaults];
    NSLog(@".......... image %@",[flavorDetailsRetrieve valueForKey:@"image"]);
     NSLog(@"for desc %@",[flavorDetailsRetrieve valueForKey:@"desc"]);
     NSLog(@" for price   %@",[flavorDetailsRetrieve valueForKey:@"price"]);
    
   
}

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
   //[self.navigationController popToRootViewControllerAnimated:YES];
     [self.tabBarController setSelectedIndex:0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //  return [[allProducts objectAtIndex:0] count];
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
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(Zoomme:)];
    [cell addGestureRecognizer:pinchGesture];
    

//    cell.layer.cornerRadius = 05;
//    cell.layer.borderWidth = 0.5f;
//    cell.layer.borderColor = [UIColor greenColor].CGColor;
//   cell.clipsToBounds= YES;

    
    
    if (indexPath.section==0) {
        tableView.separatorColor = [UIColor clearColor];
   
       // cell.imageView.image = [flavorDetailsRetrieve valueForKey:@"image"];
//        NSString *urlString = [NSString stringWithFormat:@"%@",[flavorDetailsRetrieve valueForKey:@"image"]];
//        urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//        NSURL *urlone = [NSURL URLWithString:urlString];
//        NSData *newData = [NSData dataWithContentsOfURL:urlone];
        // self.image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"photo-frame.png"]];
      //  cell.imageView.image = [UIImage imageWithData:newData];
      //  UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:200];
        // recipeImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"photo-frame.png"]];
       // recipeImageView.layer.cornerRadius = 12;
       // recipeImageView.layer.borderWidth = 0.5f;
       // recipeImageView.layer.borderColor = [UIColor redColor].CGColor;
       // recipeImageView.clipsToBounds= YES;
        
        //recipeImageView.image = [UIImage imageWithData:newData];
      // cell.imageView.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2);
        
//        cell.imageView.layer.cornerRadius = 15;
//        cell.imageView.layer.borderWidth = 1.5f;
//        cell.imageView.layer.borderColor = [UIColor blueColor].CGColor;
//        cell.imageView.clipsToBounds= YES;
//        cell.imageView.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2);
        
        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@"\t\t\t%@",[flavorDetailsRetrieve valueForKey:@"name"]];
            NSLog(@"dsata in string 1%@",string);
           // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:16.0];
           cell.textLabel.textColor = [UIColor purpleColor];
            cell.textLabel.text = string;
            
            
        }
        
       if (indexPath.row == 1)
        {
        
//            cell.imageView.frame =CGRectMake(60,0, 160, 160);
//        cell.imageView.image = [UIImage imageWithData:[flavorDetailsRetrieve valueForKey:@"image"]];
//        
//
//         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60,0, 160, 160)];
//        imgView.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2);
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,280)];
               CAGradientLayer *gradient = [CAGradientLayer layer];
                gradient.frame = view.bounds;
                gradient.colors = [NSArray arrayWithObjects:UIColorFromRGB(0x87FC70).CGColor,UIColorFromRGB(0x0BD318).CGColor, nil];
                [view.layer insertSublayer:gradient atIndex:0];
                [cell.contentView addSubview:view];
           // cell.backgroundColor = [UIColor grayColor]; #5856D6
            UIImageView *photo = [[UIImageView alloc]init];
            photo.frame = CGRectMake(0, 20, 250, 250);
            
            [photo setBackgroundColor:[UIColor whiteColor]];
            photo.layer.cornerRadius = 15;
            photo.layer.borderWidth = 5.5f;
            photo.layer.borderColor = [UIColor whiteColor].CGColor;
            photo.clipsToBounds= NO;
           // photo.image = [UIImage imageWithData:[flavorDetailsRetrieve valueForKey:@"image"]];
            [photo setImageWithURL:[flavorDetailsRetrieve valueForKey:@"image"] placeholderImage:[UIImage imageNamed:@"Hisoka.jpg"]];
            photo.contentMode = UIViewContentModeScaleAspectFill;
            photo.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2+25);
            
            
            [photo addSubview:_starRatingView];
            photo.userInteractionEnabled = YES;
            
            
            [cell.contentView addSubview:photo];


        }
       if (indexPath.row == 2)        {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Cost: %@$",[flavorDetailsRetrieve valueForKey:@"price"]];
              NSLog(@"dsata in string  2 %@",string);
           // cell.textLabel.textAlignment = NSTextAlignmentCenter;
           cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
           cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
 
        }
        if (indexPath.row == 3)
        {
            
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Descrption/n%@",[flavorDetailsRetrieve valueForKey:@"desc"]];
            NSLog(@"dsata in string  2 %@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:14.0];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
            
        }
            
        
       // imgView.image = [UIImage imageWithData:newData];
        // [cell.contentView addSubview:imgView];
        


       /*
        
        UIImageView *photo = [[UIImageView alloc]init];
        photo.frame = CGRectMake(0, 0, 140, 140);
        photo.layer.cornerRadius = 10;
        photo.layer.borderWidth = 1.5f;
        photo.layer.borderColor = [UIColor clearColor].CGColor;
        photo.clipsToBounds= NO;

        photo.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2);
               [cell.contentView addSubview:photo];
        
        cell.backgroundColor = [UIColor brownColor];
        NSLog(@"size of cell %f",cell.contentView.bounds.size.width/2);
              photo.image = [UIImage imageWithData:newData]; */
        
        
    }
    
    if (indexPath.section==1) {
       // cell.textLabel.lineBreakMode = 2;
        [[cell textLabel] setNumberOfLines:0]; // unlimited number of lines
      //  [[cell textLabel] setLineBreakMode:UILineBreakModeWordWrap];
        if (indexPath.row ==0) {
            NSLog(@"data in indexpath.row %ld",(long)indexPath.row);
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
            NSString *string = [NSString stringWithFormat:@"Desc:  %@",[flavorDetailsRetrieve valueForKey:@"desc"]];
//            CGRect frame = cell.textLabel.frame;
//            frame.size.width = CGRectGetWidth(frame);
//            frame.origin.x = 0.0;
         //  cell.textLabel.frame = frame;
            cell.textLabel.textColor = [UIColor blueColor];
            cell.detailTextLabel.text = string;
        }
        else
        {
        
            
            NSString *string = [NSString stringWithFormat:@"Price:  %@",[flavorDetailsRetrieve valueForKey:@"price"]];
            
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
   
    
}
-(IBAction)Zoomme:(UIPinchGestureRecognizer*)reconginzer
{
    reconginzer.view.transform = CGAffineTransformScale(reconginzer.view.transform, reconginzer.scale, reconginzer.scale);
    reconginzer.scale = 1;
}


@end
