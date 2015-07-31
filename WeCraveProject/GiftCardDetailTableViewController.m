//
//  GiftCardDetailTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 12/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "GiftCardDetailTableViewController.h"
#import "FriendDetailsViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface GiftCardDetailTableViewController ()
{
    NSUserDefaults *giftCardDetailsRetrieve;

}

@end

@implementation GiftCardDetailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // BackGround Img to View
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    
    
    _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(110, 210, 130, 30)
                                                 numberOfStar:5];
    _starRatingView.delegate = self;
    

    
    
    
    // Heading for Tableview
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"logoImg.png"];
    self.tableView.tableHeaderView = headerView;

    // BackButton and Image for It
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 60, 40);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
    
    // HomeButton and Image for It
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    btnNext1.frame = CGRectMake(100, 100, 60, 40);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
    
    
    
    giftCardDetailsRetrieve = [NSUserDefaults standardUserDefaults];

    NSUserDefaults *giftCardDetailsToDB = [NSUserDefaults standardUserDefaults];
    //[giftCardDetailsToDB setObject:self.giftDesc forKey:@"Desc"];
    [giftCardDetailsToDB setObject:[giftCardDetailsRetrieve objectForKey:@"price"] forKey:@"GiftCardPrice"];
    [giftCardDetailsToDB setObject:[giftCardDetailsRetrieve objectForKey:@"pId"] forKey:@"GiftCardId"];
    [giftCardDetailsToDB setObject:[giftCardDetailsRetrieve objectForKey:@"pname"] forKey:@"GiftCardName"];

    
    
    [giftCardDetailsToDB synchronize];

    
    
    
}
// Method for BackButton

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}

// Method for Goto HomeButton
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
        return 5;
    }
    else
        return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if (indexPath.section ==0)
   {
    
    if(indexPath.row == 0)
    {
        return 40;
    }
    if (indexPath.row == 1) {
        return 280;
    }
       if (indexPath.row == 2) {
        return 50;
    }
       if (indexPath.row == 3) {
           return 100;
       }
       if (indexPath.row == 4) {
           return 100;
       }
       else
           return 80;
       
   }
    
    
    else
        return 80;
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
     tableView.separatorColor = [UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    if (indexPath.section==0) {


        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@"\t\t\t%@",[giftCardDetailsRetrieve valueForKey:@"pname"]];
            NSLog(@"dsata in string 1%@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
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

            UIImageView *photo = [[UIImageView alloc]init];
            photo.frame = CGRectMake(0, 0, 250, 250);
            [photo setBackgroundColor:[UIColor clearColor]];
            photo.contentMode = UIViewContentModeScaleAspectFill;
            
            photo.layer.cornerRadius = 15;
            photo.layer.borderWidth = 0.0f;
            photo.layer.borderColor = [UIColor clearColor].CGColor;
            photo.clipsToBounds= NO;
            
            [photo addSubview:_starRatingView];
            [self.starRatingView setScore:0.5f withAnimation:YES];
            photo.userInteractionEnabled = YES;
            
            
            photo.image = [UIImage imageWithData:[giftCardDetailsRetrieve valueForKey:@"image"]];
            photo.center = CGPointMake(cell.contentView.bounds.size.width/2,cell.contentView.bounds.size.height/2+25);
            [cell.contentView addSubview:photo];
            
            
        }
        
        
        if (indexPath.row == 2)        {
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Cost: %@$",[giftCardDetailsRetrieve valueForKey:@"price"]];
            NSLog(@"dsata in string  2 %@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
            
        }
        
        if (indexPath.row == 3)
        {
            
            cell.backgroundColor = [UIColor clearColor];
            NSString *string = [NSString stringWithFormat:@ "                   Descrption /n%@",[giftCardDetailsRetrieve valueForKey:@"desc"]];
            NSLog(@"dsata in string  2 %@",string);
            // cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:16.0];
            cell.textLabel.numberOfLines = 0;
            cell.textLabel.text = string ;
            
        }


        if (indexPath.row==4)
            
        {
            cell.backgroundColor = [UIColor brownColor];
            cell.textLabel.text = @"Gift To A Friend";
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:24];
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
        }

        
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if (indexPath.section == 0) {
        if (indexPath.row == 4) {
            [self performSelector:@selector(callingPushSegue) withObject:nil afterDelay:0];
        }
        
        
       // [self performSelector:@selector(callingPushSegue) withObject:nil afterDelay:0];
    }
    
    // you can see selected row number in your console;
}

-(void)callingPushSegue
{
    [self performSegueWithIdentifier:@"gift" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([[segue identifier] isEqualToString:@"gift"])
    {
        FriendDetailsViewController *gift = segue.destinationViewController;
    }
    
}


@end
