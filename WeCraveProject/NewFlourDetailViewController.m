//
//  NewFlourDetailViewController.m
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "NewFlourDetailViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NewFlourDetailViewController ()

@end

@implementation NewFlourDetailViewController
//@synthesize getDict;

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
    
    self.title = self.getNames;
    [self.view setBackgroundColor:UIColorFromRGB(0x66FF66)];
    
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
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flavors_head.png"]];

    
    UIButton *btnNext1 =[[UIButton alloc] init];
    NSString *btntitle = @"Home";
	[btnNext1 setTitle:btntitle forState:UIControlStateNormal];
    
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 50, 30);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

    

    
    NSString *urlString = [NSString stringWithFormat:@"%@",self.getImage];
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *urlone = [NSURL URLWithString:urlString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone];
   // self.image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"photo-frame.png"]];
    self.image.image = [UIImage imageWithData:newData];
    
    self.label1.text = self.getNames;
    self.desc.text = self.getDesc;
    self.price.text = self.getPrice;
    // Do any additional setup after loading the view.
    [self.viewOnScroll setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0] ];
    
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



@end
