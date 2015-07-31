//
//  MainMenuCollectionViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 13/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "MainMenuCollectionViewController.h"
#import "ToppingsTableViewController.h"
#import "GiftCardTypesViewController.h"
#import "FlavorsTableViewController.h"
#import "MapViewController.h"
#import "HeaderandFooterCollectionReusableView.h"

@interface MainMenuCollectionViewController ()

@end

@implementation MainMenuCollectionViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImg.png"] forBarMetrics:UIBarMetricsDefault];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]];
   
    recipeImages = [NSArray arrayWithObjects:@"Mainflavors.png", @"Maintoppings.png", @"Maingiftcard.png", @"Mainlocations.png", nil];
    
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	//NSString *bckbtn = @"Back";
	//[backButton setTitle:bckbtn forState:UIControlStateNormal];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 60, 45);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
    // [self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
      
    UIButton *btnNext1 =[[UIButton alloc] init];
   // NSString *btntitle = @"Home";
	//[btnNext1 setTitle:btntitle forState:UIControlStateNormal];
    
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(120, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
     self.navigationItem.title = @"MainMenu";
    
// uiview to stop muliple touches and keep Activity indicator
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320 , 480)];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    
    self.activityIndicator.frame = CGRectMake(self.topView.bounds.size.width/2, self.topView.bounds.size.height/2, 120, 120);
    self.activityIndicator.center = CGPointMake(self.topView.bounds.size.width/2, self.topView.bounds.size.height/2);
    
    self.topView.layer.cornerRadius = 8;
    self.topView.layer.borderWidth = 2;
    self.topView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.topView.layer.masksToBounds = YES;
    self.topView.backgroundColor = [UIColor whiteColor];
    self.activityIndicator.backgroundColor = [UIColor grayColor];
    self.activityIndicator.layer.cornerRadius = 8;
    self.activityIndicator.layer.borderWidth = 2;
    self.activityIndicator.layer.borderColor = [UIColor whiteColor].CGColor;
    self.activityIndicator.layer.masksToBounds = YES;
    self.activityIndicator.alpha = 1.0f;
    self.activityIndicator.opaque = YES;
    self.topView.alpha = 0.5f;
    self.topView.opaque = NO;
   // self.activityIndicator.frame = CGRectMake(60, 350, 60, 60);
 //   self.topView.frame = CGRectMake(40, 60, 280, 300);
   [self.topView addSubview:self.activityIndicator];
    [self.view addSubview:self.topView];
    self.activityIndicator.hidden = YES;
    self.topView.hidden = YES;
    
    
    
    

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

#pragma mark - for UICollection View Controller
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        return CGSizeMake(160.f, 160.f);
    }
    return CGSizeMake(160.f, 160.f);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
               return 0.5;
    }
    return 0.5;

}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.collectionView performBatchUpdates:nil completion:nil];
}

-(void)viewWillAppear:(BOOL) animated {
    
    self.activityIndicator.hidden = YES;
     [self.activityIndicator stopAnimating];
    self.topView.hidden = YES;
   
}

-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
    self.topView.hidden = YES;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
     [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;

     self.topView.hidden = YES;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [recipeImages count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
       recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
   // cell.layer.cornerRadius = 10;
   // cell.layer.borderWidth = 1.5f;
    //cell.layer.borderColor = [UIColor greenColor].CGColor;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.topView.hidden = NO;
            
    
    
    if (indexPath.row == 0) {
        [self.activityIndicator startAnimating];

        self.topView.hidden = NO;

       
       

        NSLog(@"indexpath at row 0");
       [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        @try {
            
            NSURL *url = [NSURL URLWithString:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=20"];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [NSURLConnection sendAsynchronousRequest:request
                                               queue:[NSOperationQueue mainQueue]
                                   completionHandler:^(NSURLResponse *response,
                                                       NSData *data, NSError *connectionError)
             {
                 if (data.length > 0 && connectionError == nil)
                 {
                      
                      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                     [self performSelector:@selector(flavorsPushSegue) withObject:nil afterDelay:0];
                     
                 }
             }];          
            
        }
        
        @catch (NSException *exception) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            NSLog(@"no network");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Network" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }

        
        
    }
    if (indexPath.row == 1) {
        NSLog(@"indexpath at row 2");
         [self.activityIndicator startAnimating];
        
        self.topView.hidden = NO;

        [self performSelector:@selector(toppingsPushSegue) withObject:nil afterDelay:0];
    }
    if (indexPath.row == 2) {
        self.topView.hidden = NO;
         [self.activityIndicator startAnimating];
        NSLog(@"indexpath at row 1");
         [self performSelector:@selector(giftcardPushSegue) withObject:nil afterDelay:0];
    }
    
    if (indexPath.row == 3) {
        self.topView.hidden = NO;
         [self.activityIndicator startAnimating];
        
        NSLog(@"indexpath at row 3");
         [self performSelector:@selector(mapPushSegue) withObject:nil afterDelay:0];
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderandFooterCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *flavorName_label = (UILabel *)[headerView viewWithTag:200];
        flavorName_label.text = @"Main Menu";
        flavorName_label.textColor = [UIColor purpleColor];
        headerView.layer.cornerRadius = 10;
      headerView.layer.borderWidth = 1.5f;
       headerView.layer.borderColor = [UIColor redColor].CGColor;
        
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerview.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"logo.jpg"]];
        
        reusableview = footerview;
    }
    
    return reusableview;
}

-(void)flavorsPushSegue
{
    [self performSegueWithIdentifier:@"Flavors" sender:self];
}
-(void)giftcardPushSegue
{
    [self performSegueWithIdentifier:@"GiftCards" sender:self];
}
-(void)toppingsPushSegue
{
    [self performSegueWithIdentifier:@"Toppings" sender:self];
}

-(void)mapPushSegue
{
    [self performSegueWithIdentifier:@"Map" sender:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Change the selected background view of the cell.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];

    if ((self.selectedIndexPath = [self.collectionView indexPathsForSelectedItems]))
    {
    
    if ([segue.identifier isEqualToString:@"Flavors"]) {
               FlavorsTableViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }

    if ([segue.identifier isEqualToString:@"GiftCards"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        GiftCardTypesViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    if ([segue.identifier isEqualToString:@"Toppings"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        ToppingsTableViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    if ([segue.identifier isEqualToString:@"Map"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        MapViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    }
}

@end
