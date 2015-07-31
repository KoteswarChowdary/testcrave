//
//  NewFloursTableViewController.m
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "NewFloursTableViewController.h"
#import "NewFlourDetailViewController.h"
#import "DetailFlavorTableViewController.h"
#import "AsyncImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface NewFloursTableViewController ()

@end

@implementation NewFloursTableViewController;
@synthesize catId,subCatId;

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
    self.navigationItem.title = @"Flavour";

    
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];

    
   // NSLog(@"cat and subcat Id is %@ %@",self.catId,self.subCatId);

    allProducts = [[NSMutableArray alloc]init];
    
 
allArrayObjects =  [[self getFlavorsByCatID:catId andSubCatID:subCatId]mutableCopy];
    
}

-(void)viewWillAppear:(BOOL) animated {
    if ([allArrayObjects isKindOfClass:[NSData class] ]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"no data in it" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
       act.color = [UIColor whiteColor];
    [self.tableView addSubview:act];
    [act stopAnimating];

}

-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [act stopAnimating];
    

    
}

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
     [self.tabBarController setSelectedIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate Methodb Call
-(void)sampleProcessToCallDelegate:(NSString *)cutId andsubcatId:(NSString *)sunCatid{
    allArrayObjects =  [self getFlavorsByCatID:cutId andSubCatID:sunCatid];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[allArrayObjects objectAtIndex:1] count];
    
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"productbg260.png"]];

     // cell.backgroundView.backgroundColor = [UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.backgroundColor = UIColorFromRGB(0x944DFF);

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    // Configure the cell...
    UILabel *flavorName_label = (UILabel *)[cell viewWithTag:200];
    flavorName_label.text =  [[allArrayObjects objectAtIndex:1] objectAtIndex:indexPath.row];
       NSString *urlImageString = [NSString stringWithFormat:@"%@",[[allArrayObjects objectAtIndex:0] objectAtIndex:indexPath.row]];
    urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *urlone = [NSURL URLWithString:urlImageString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone];
    
    
   UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:600];
    [recipeImageView setBackgroundColor:[UIColor whiteColor]];
     recipeImageView.layer.cornerRadius = recipeImageView.frame.size.width / 2;
   recipeImageView.layer.borderWidth = 1.5f;
  recipeImageView.layer.borderColor = [UIColor blackColor].CGColor;
  recipeImageView.clipsToBounds= YES;
       recipeImageView.contentMode = UIViewContentModeScaleAspectFit;
    [recipeImageView setImageWithURL:[NSURL URLWithString:[[allProducts objectAtIndex:0] objectAtIndex:indexPath.row]]  placeholderImage:[UIImage imageNamed:@"Hisoka.jpg"] ];
    
    //**************************** Rating ****************************
    
    UIImageView *ratingImage = (UIImageView *)[cell viewWithTag:700];
    ratingImage.image = [self imageForRating:[[[allArrayObjects objectAtIndex:4] objectAtIndex:indexPath.row] floatValue]];

    cell.layer.cornerRadius = 10;
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    

    
}

-(UIImage *)imageForRating:(int)rating
{
    
            if (rating == 50.0000) {
                return [UIImage imageNamed:@"2StarsSmall.png"];
            }
            if (rating == 80.0000) {
                return [UIImage imageNamed:@"4StarsSmall.png"];
            }
            if (rating == 10.0000) {
                return [UIImage imageNamed:@"1StarSmall.png"];
            }
            if (rating == 70.0000) {
                return [UIImage imageNamed:@"4StarsSmall.png"];
            }
            if (rating == 60.0000) {
                return [UIImage imageNamed:@"3StarsSmall.png"];
            }
           if (rating == 90.0000) {
                return [UIImage imageNamed:@"5StarsSmall.png"];
            }
    
           else
           {
               
           return [UIImage imageNamed:@"1StarSmall.png"];
           }
    
    }


- (NSMutableArray*)getFlavorsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID
{

 NSMutableArray* prdtDescArray=[NSMutableArray array];
    
  NSMutableArray*  prdtPriceArray=[NSMutableArray array];
  NSMutableArray*  prdtIdArray=[NSMutableArray array];
   NSMutableArray* prdtNameArray = [NSMutableArray array];
   NSMutableArray* prdtImgArray = [NSMutableArray array];
    

    // create the URL we'd like to query
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        jsonArray = [myjson objectForKey:@"productLists"];
        if([jsonArray isKindOfClass:[NSArray class]])
        {
            [self.delegate testUrlDataInView:@"koti"];
        NSLog(@"data in array is %@",jsonArray);
        
        for (int i=0 ; i<[jsonArray count] ; i++) {
            [prdtPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
            [prdtDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"desc"]];
            [prdtNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"pname"]];
           // [prdtImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            [prdtIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"proid"]];
            NSString *urlImageString = [NSString stringWithFormat:@"%@",[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            [prdtImgArray addObject:urlImageString];

            
        }
        [allProducts addObject:prdtImgArray];
        [allProducts addObject:prdtNameArray];
        [allProducts addObject:prdtIdArray];
        [allProducts addObject:prdtDescArray];
        [allProducts addObject:prdtPriceArray];
        }
        else
        {
            [self.delegate testUrlDataInView:@"ikoti"];
        }
    }
    else
    {
        [self.delegate testUrlDataInView:@"ikoti"];
    }
    return allProducts;
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"detail"])
    {
       NewFlourDetailViewController *detailViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
             NSUserDefaults *flavorDetails = [NSUserDefaults standardUserDefaults];
        [flavorDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"pname"];
        NSLog(@"data in flavour details is %@",flavorDetails);
        
        [flavorDetails setObject:[[allArrayObjects objectAtIndex:3] objectAtIndex:myIndexPath.row] forKey:@"desc"];
        [flavorDetails setObject:[[allArrayObjects objectAtIndex:0] objectAtIndex:myIndexPath.row] forKey:@"image"];
        
        [flavorDetails setObject:[[allArrayObjects objectAtIndex:4] objectAtIndex:myIndexPath.row] forKey:@"price"];
        [flavorDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"name"];
        [flavorDetails synchronize];
    }
}


@end
