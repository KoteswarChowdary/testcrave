//
//  GiftCardTypesTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 20/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "GiftCardTypesTableViewController.h"
#import "SubGCTypesTableViewController.h"
#import "BirthdayGiftcardsTableViewController.h"

@interface GiftCardTypesTableViewController ()

@end

@implementation GiftCardTypesTableViewController

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
    
    self.navigationItem.title = @"GiftCards";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    

    
    
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"logoImg.png"];
    self.tableView.tableHeaderView = headerView;
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"70", @"CatId",
                           @"Birthday GiftCards",@"CatName", nil];
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"71", @"CatId",
                           @"Business GiftCards",@"CatName", nil];
  flavorsTypesArray = [[NSArray alloc]initWithObjects:dict1,dict2, nil];

    
    
    
}

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL) animated {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   
    
    [self.tableView addSubview:activityIndicator];
  
    
}
-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    
    [self.tableView reloadData];
   // [activityIndicator stopAnimating];

    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
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
    
    return [flavorsTypesArray count];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        
    }
    
    
    cell.textLabel.textAlignment =  NSTextAlignmentCenter;
    cell.textLabel.text = [[flavorsTypesArray objectAtIndex:indexPath.row]valueForKey:@"CatName"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
  //  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  // [tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   cell.accessoryView = activityIndicator;
    [activityIndicator startAnimating];
     activityIndicator.hidesWhenStopped = YES;
    
   //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSLog(@"data fron index path in didselect is %@",indexPath);
    self.catId = [[flavorsTypesArray objectAtIndex:indexPath.row] valueForKey:@"CatId"];
    NSLog(@"data in self.catId id %@",self.catId);
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row) {
            case 0: [self performSelector:@selector(birthdayMethod) withObject:nil afterDelay:0];
                break;
            case 1: [self performSelector:@selector(businessMethod) withObject:nil afterDelay:0];                break;
            default:
                NSLog(@"nothing");
                break;
        }
        [self.tableView reloadData];
    }

     [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}
-(void)birthdayMethod
{
    
    [self performSegueWithIdentifier:@"ToBirthdayCards" sender:self];
}
-(void)businessMethod
{
    
    [self performSegueWithIdentifier:@"BusinessCards" sender:self];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"ToBirthdayCards"])
    {
        BirthdayGiftcardsTableViewController *detailViewController =
        [segue destinationViewController];
        detailViewController.catId = self.catId;
        
    }
    else
    {
        
    
    SubGCTypesTableViewController *gift = segue.destinationViewController;
    gift.catId = self.catId;
    }
    
    
    
}


@end
