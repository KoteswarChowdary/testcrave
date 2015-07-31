//
//  BirthdayGiftcardsTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 26/06/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "BirthdayGiftcardsTableViewController.h"
#import "DetailBirthdayGiftCardTableViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface BirthdayGiftcardsTableViewController ()

@end

@implementation BirthdayGiftcardsTableViewController

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
    // to Set Backgroung Image to View
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    /*
     [self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
     [self.view setBackgroundColor:UIColorFromRGB(0x5BCAFF)];
     */
    
    
    //To set All Table View Delagate Methods
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"BackImg.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
    backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];	backButton.frame = CGRectMake(0, 0, 60, 40);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    btnNext1.frame = CGRectMake(100, 100, 60, 40);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
    
    
    jsonArray = [[NSArray alloc]init];
    allProducts = [[NSMutableArray alloc]init];
    allArrayObjects = [[NSMutableArray alloc]init];
    allArrayObjects = [self getFlavorsByCatID:self.catId];
    
    
    
    
   

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
    NSLog(@"%lu",(unsigned long)[ [allArrayObjects objectAtIndex:1] count]);
       return [ [allArrayObjects objectAtIndex:1] count];
   
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
    }
    UILabel *flavorTypeNames_label = (UILabel *)[cell viewWithTag:200];
    flavorTypeNames_label.text = [[allArrayObjects objectAtIndex:1] objectAtIndex:indexPath.row];
   
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    [recipeImageView setBackgroundColor:[UIColor clearColor]];
    NSData *data2 = [NSData dataWithData:[[allProducts objectAtIndex:0] objectAtIndex:indexPath.row]];
    // cell.imageView.image = [UIImage imageWithData:data1];
    recipeImageView.contentMode = UIViewContentModeScaleAspectFit;
    recipeImageView.image = [UIImage imageWithData:data2];
    
    return cell;
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"BirthdayGift"])
    {
        DetailBirthdayGiftCardTableViewController *detailViewController =[segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        
        NSUserDefaults *BirthdaycardDetails = [NSUserDefaults standardUserDefaults];
        [BirthdaycardDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"GiftName"];
        [BirthdaycardDetails setObject:[[allArrayObjects objectAtIndex:3] objectAtIndex:myIndexPath.row] forKey:@"GiftDesc"];
        [BirthdaycardDetails setObject:[[allArrayObjects objectAtIndex:0] objectAtIndex:myIndexPath.row] forKey:@"GiftImage"];
        
        [BirthdaycardDetails setObject:[[allArrayObjects objectAtIndex:4] objectAtIndex:myIndexPath.row] forKey:@"GiftPrice"];
        [BirthdaycardDetails setObject:[[allArrayObjects objectAtIndex:2] objectAtIndex:myIndexPath.row] forKey:@"GiftID"];
        [BirthdaycardDetails synchronize];
        
        
        
        
    }
}



- (NSMutableArray*)getFlavorsByCatID:(NSString*)idstr
{
    
    NSMutableArray* prdtDescArray=[NSMutableArray array];
    
    NSMutableArray*  prdtPriceArray=[NSMutableArray array];
    NSMutableArray*  prdtIdArray=[NSMutableArray array];
    NSMutableArray* prdtNameArray = [NSMutableArray array];
    NSMutableArray* prdtImgArray = [NSMutableArray array];
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/getpro&path=%@",idstr];
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata.... is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        jsonArray = [myjson objectForKey:@"productLists"];
        NSLog(@"data in jsonarray...... is %@",jsonArray);

    
    for (int i=0 ; i<[jsonArray count] ; i++) {
        [prdtPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
        NSLog(@"data in for looop %@", prdtPriceArray);
        [prdtDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"description"]];
        [prdtNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"name"]];
        //[prdtImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
        [prdtIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"product_id"]];
        NSString *urlImageString = [NSString stringWithFormat:@"%@",[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
        urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSURL *urlone = [NSURL URLWithString:urlImageString];
        NSData *newData = [NSData dataWithContentsOfURL:urlone];
        [prdtImgArray addObject:newData];
        
        
    }
    [allProducts addObject:prdtImgArray];
    [allProducts addObject:prdtNameArray];
    [allProducts addObject:prdtIdArray];
    [allProducts addObject:prdtDescArray];
    [allProducts addObject:prdtPriceArray];
    NSLog(@"data in for looop %@", prdtPriceArray);
    }
    return allProducts;
        
}
  
@end
