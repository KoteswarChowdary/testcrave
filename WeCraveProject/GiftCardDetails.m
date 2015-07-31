//
//  GiftCardDetails.m
//  WeCraveProject
//
//  Created by hari on 26/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "GiftCardDetails.h"
#import "ServiceClass.h"
#import "FriendDetailsViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface GiftCardDetails ()

@end

@implementation GiftCardDetails
@synthesize giftImages,getDict,descView,priceLabel;

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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
//    UIImage *backgroundImage = [UIImage imageNamed:@"appbackground.png"];
//    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
//[self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
    //[self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
   // [self.view setBackgroundColor:UIColorFromRGB(0x90EE90)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift_head.png"]];
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navi.png"] forBarMetrics:UIBarMetricsDefault];
   //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg@2x.png"] forBarMetrics: UIBarMetricsLandscapePhone];
 /*   //imagesArray1 = [[NSMutableArray alloc]init];
    //imagesArray1 = [self.imagesFromGiftCard valueForKey:@"image"];
    NSString *urlString = [NSString stringWithFormat:@"%@",[getDict valueForKey:@"image"]];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *urlone = [NSURL URLWithString:urlString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone];
    
    self.giftImages.image = [UIImage imageWithData:newData];
    self.quality.text = [self.getDict objectForKey:@"model"];
    self.descView.text = [self.getDict objectForKey:@"desc"];
    self.priceLabel.text = [self.getDict objectForKey:@"price"];
    
    [self.viewOnScroller setBackgroundColor:backgroundPattern ]; */
  
    NSString *urlString = [NSString stringWithFormat:@"%@",self.giftImage];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *urlone = [NSURL URLWithString:urlString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone]
    ;
   // self.image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"imageBackground.png"]];
   // self.image.image = [UIImage imageWithData:newData];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"back.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	NSString *bckbtn = @"Back";
	[backButton setTitle:bckbtn forState:UIControlStateNormal];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 50, 30);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    NSString *btntitle = @"Home";
	[btnNext1 setTitle:btntitle forState:UIControlStateNormal];
    
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 50, 30);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

    NSUserDefaults *giftCardDetailsToDB = [NSUserDefaults standardUserDefaults];
   //[giftCardDetailsToDB setObject:self.giftDesc forKey:@"Desc"];
    [giftCardDetailsToDB setObject:self.giftPrice forKey:@"Price"];
    [giftCardDetailsToDB setObject:self.giftId forKey:@"GiftId"];
    
    [giftCardDetailsToDB synchronize];
    
    self.giftImages.image = [UIImage imageWithData:newData];
    self.descView.text = self.giftDesc;
    self.priceLabel.text = self.giftPrice;

}
-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewDidLayoutSubviews
{
     self.scroller.contentSize = CGSizeMake(320, 560);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"frienddetail"])
    {
        FriendDetailsViewController *detailViewController =[segue destinationViewController];
        detailViewController.productPrice = self.giftPrice;
        
        
        //  NSArray *dataFromGift = (NSArray*)(self.responseDict);
        //detailViewController.getDict = [dataFromGift objectAtIndex:myIndexPath.row];
        
        // NSLog(@"data in detailViewController.getDict is %@",detailViewController.getDict);
       
        
        
    }}


@end
