//
//  SubCatToppingsTableViewController.m
//  WeCraveProject
//
//  Created by Koteswar on 01/07/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "SubCatToppingsTableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ToppingDetailsTableViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SubCatToppingsTableViewController ()

@end

@implementation SubCatToppingsTableViewController

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
    self.navigationItem.title = @"Toppings";
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
    

    NSLog(@"cat and subcat Id is %@ %@",self.catId,self.subCatId);
    
    allProducts = [[NSMutableArray alloc]init];
    allArrayObjects =  [self getFlavorsByCatID:self.catId andSubCatID:self.subCatId];
    
    
}
-(void)viewWillAppear:(BOOL) animated {
    act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    // act.center = CGPointMake(160, 240);
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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[allArrayObjects objectAtIndex:1]count];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"productbg260.png"]];
    
    // cell.backgroundView.backgroundColor = [UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0];
    self.tableView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = UIColorFromRGB(0x944DFF);
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    UILabel *flavorName_label = (UILabel *)[cell viewWithTag:200];
    flavorName_label.text =  [[allArrayObjects objectAtIndex:1] objectAtIndex:indexPath.row];
    
    // NSLog(@"data in flavor_label is %@",flavorName_label.text);
    NSString *urlImageString = [NSString stringWithFormat:@"%@",[[allArrayObjects objectAtIndex:0] objectAtIndex:indexPath.row]];
    urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL *urlone = [NSURL URLWithString:urlImageString];
    NSData *newData = [NSData dataWithContentsOfURL:urlone];
    
    // Display recipe in the table cell
    // UIImageView *imageBackGround = (UIImageView *)[cell viewWithTag:500];
    //imageBackGround.image = [UIImage imageNamed:@"imageBackground.png"];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    // recipeImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"photo-frame.png"]];
    [recipeImageView setBackgroundColor:[UIColor whiteColor]];
    recipeImageView.layer.cornerRadius = 15;
    recipeImageView.layer.borderWidth = 1.5f;
    recipeImageView.layer.borderColor = [UIColor blackColor].CGColor;
    recipeImageView.clipsToBounds= YES;
    // NSData *data1 = [NSData dataWithData:[[allProducts objectAtIndex:0] objectAtIndex:indexPath.row]];
    // cell.imageView.image = [UIImage imageWithData:data1];
    recipeImageView.contentMode = UIViewContentModeScaleAspectFit;
    [recipeImageView setImageWithURL:[NSURL URLWithString:[[allProducts objectAtIndex:0] objectAtIndex:indexPath.row]]  placeholderImage:[UIImage imageNamed:@"Hisoka.jpg"] ];
    //  recipeImageView.image = [UIImage imageWithData:newData];
    
    //  [cell.imageView setImageWithURL:[NSURL URLWithString:[[allProducts objectAtIndex:0] objectAtIndex:indexPath.row]]  placeholderImage:[UIImage imageNamed:@"Hisoka.jpg"]];
    //    AsyncImageView *async = [[AsyncImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    //    async.layer.cornerRadius =async.frame.size.width / 2;
    //    async.layer.borderWidth = 0.5f;
    //    async.layer.shadowColor = [UIColor whiteColor].CGColor;
    //    async.layer.borderColor = [UIColor redColor].CGColor;
    //    [async setTintColor:[UIColor whiteColor]];
    //    async.clipsToBounds= YES;
    //    [async loadImageFromURL :[NSURL URLWithString:urlImageString]];
    //    [recipeImageView addSubview:async];
    // [cell addSubview:recipeImageView];
    
    /*  cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2;
     cell.imageView.clipsToBounds = YES;
     
     cell.imageView.image = [UIImage imageWithData:newData]; */
    
    
    // recipeImageView.image = [UIImage imageWithData:newData];
    
    UIImageView *ratingImage = (UIImageView *)[cell viewWithTag:700];
    //ratingImage.image = [self imageForRating:[[priceArray objectAtIndex:indexPath.row]floatValue]];
    ratingImage.image = [self imageForRating:[[[allArrayObjects objectAtIndex:4] objectAtIndex:indexPath.row] floatValue]];
    //    if (indexPath.row % 2 == 0) {
    //       // [cell setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
    //        [cell setBackgroundColor:UIColorFromRGB(0x66FF66)];
    //        cell.userInteractionEnabled = YES;
    //
    //      //  cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBgnd.png"]];
    //
    //    }
    //    else {
    //        [cell setBackgroundColor:UIColorFromRGB(0x9a33cc)];
    //    }
    // ---- To seperate each cell on table view -------->  tableView.separatorColor = [UIColor blueColor];
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
-(NSMutableArray*)getFlavorsByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID
{
    
    NSMutableArray* prdtDescArray=[NSMutableArray array];
    
    NSMutableArray*  prdtPriceArray=[NSMutableArray array];
    NSMutableArray*  prdtIdArray=[NSMutableArray array];
    NSMutableArray* prdtNameArray = [NSMutableArray array];
    NSMutableArray* prdtImgArray = [NSMutableArray array];
    
    
    // create the URL we'd like to query
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084//devteam//craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        jsonArray = [myjson objectForKey:@"productLists"];
        NSLog(@"data in array is %@",jsonArray);
        
        for (int i=0 ; i<[jsonArray count] ; i++) {
            [prdtPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
            [prdtDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"desc"]];
            [prdtNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"pname"]];
            // [prdtImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            [prdtIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"proid"]];
            NSString *urlImageString = [NSString stringWithFormat:@"%@",[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            // NSURL *urlone = [NSURL URLWithString:urlImageString];
            //            NSData *newData = [NSData dataWithContentsOfURL:urlone];
            [prdtImgArray addObject:urlImageString];
            
            
        }
        [allProducts addObject:prdtImgArray];
        [allProducts addObject:prdtNameArray];
        [allProducts addObject:prdtIdArray];
        [allProducts addObject:prdtDescArray];
        [allProducts addObject:prdtPriceArray];
    }
    return allProducts;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"detailToppings"])
    {
        ToppingDetailsTableViewController *detailViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        //  detailViewController.getNames = [[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row];
        //        detailViewController.getDesc = [[self.responseDict valueForKey:@"desc"]objectAtIndex:myIndexPath.row];
        //  detailViewController.getImage = [[allArrayObjects objectAtIndex:0] objectAtIndex:myIndexPath.row]
        ;//         detailViewController.getPrice = [[self.responseDict valueForKey:@"price"]objectAtIndex:myIndexPath.row];
        NSUserDefaults *toppingsDetails = [NSUserDefaults standardUserDefaults];
        [toppingsDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"tname"];
        NSLog(@"data in flavour details is %@",[toppingsDetails objectForKey:@"tname"]);
        
        [toppingsDetails setObject:[[allArrayObjects objectAtIndex:3] objectAtIndex:myIndexPath.row] forKey:@"tdesc"];
        [toppingsDetails setObject:[[allArrayObjects objectAtIndex:0] objectAtIndex:myIndexPath.row] forKey:@"timage"];
        
        [toppingsDetails setObject:[[allArrayObjects objectAtIndex:4] objectAtIndex:myIndexPath.row] forKey:@"tprice"];
        [toppingsDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"tname"];
        [toppingsDetails synchronize];
    }
}




@end
