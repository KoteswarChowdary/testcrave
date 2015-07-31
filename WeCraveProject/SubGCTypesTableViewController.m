//
//  SubGCTypesTableViewController.m
//  WeCraveProject
//
//  Created by hari on 10/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "SubGCTypesTableViewController.h"
#import "GiftCardViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SubGCTypesTableViewController ()

@end

@implementation SubGCTypesTableViewController

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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
  //  [self.view setBackgroundColor:UIColorFromRGB(0x90EE90)];
//[self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
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
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 40);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

    
    
    allProducts = [[NSMutableArray alloc]init];
    allArrayObjects =  [self getGiftcardByCatID:self.catId ];

    
    
    
    
    
    
    
    
    
    @try {

    NSString *urlString = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/gpcategory&path=%@",self.catId];
  //  NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=71"];
   // [self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *raw_data = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:raw_data options:kNilOptions error:&error];
    array_data = [json objectForKey:@"subcatlist"];
    giftCatId = [NSMutableArray array];
    giftSubcatIds = [NSMutableArray array];
    giftSubCatNames = [NSMutableArray array];
    for (int i=0 ; i<[array_data count] ; i++ ) {
        [giftCatId addObject:[[array_data objectAtIndex:i]objectForKey:@"catid"]];
        [giftSubcatIds addObject:[[array_data objectAtIndex:i]objectForKey:@"subcatid"]];
        [giftSubCatNames addObject:[[array_data objectAtIndex:i] objectForKey:@"subcatname"]];
        
    }
    }
    @catch (NSException *exception) {

        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Network" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }

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
-(void)viewWillAppear:(BOOL) animated {
    act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    act.center = CGPointMake(160, 240);
    
    [self.tableView addSubview:act];
}
-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [act stopAnimating];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [giftCatId count];

}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"productbg260.png"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.layer.cornerRadius = 10;
    cell.layer.borderWidth = 2.5f;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    if (indexPath.row % 2 == 0) {
        [cell setBackgroundColor:UIColorFromRGB(0x00CC00)];
        
        //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBgnd.png"]];
        
    }
    else {
        [cell setBackgroundColor:UIColorFromRGB(0x9a33cc)]; //E0EFB2 //D1FFA3
    }

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       

    }
    UILabel *flavorTypeNames_label = (UILabel *)[cell viewWithTag:100];
    flavorTypeNames_label.text = [giftSubCatNames objectAtIndex:indexPath.row];
    
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    act.color = [UIColor whiteColor];
    cell.accessoryView = act;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
    self.catId = [giftCatId objectAtIndex:indexPath.row];
    NSLog(@"data in self.catId id %@",self.catId);
    self.subCatId = [giftSubcatIds objectAtIndex:indexPath.row];
     NSLog(@"data in self.subCatId  id %@",self.subCatId);
    
    [act startAnimating];
    [self performSelector:@selector(callingPushSegue) withObject:nil afterDelay:0];
    
}
-(void)callingPushSegue
{
    [self performSegueWithIdentifier:@"giftcardDetails" sender:self];
}
    




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    GiftCardViewController *gift = segue.destinationViewController;
    gift.catId = self.catId;
    gift.subCatId = self.subCatId;
    NSLog(@"data in gift.catId is %@",self.catId);
    
    NSLog(@"data in gift.subCatId  is %@",self.subCatId);

    
}

-(NSMutableArray*)getGiftcardByCatID:(NSString*)idStr;
{
    
    NSMutableArray * giftCardDescArray=[NSMutableArray array];
    NSMutableArray* giftCardPriceArray=[NSMutableArray array];
    NSMutableArray* giftCardIdArray=[NSMutableArray array];
    NSMutableArray *giftCardNameArray = [NSMutableArray array];
    NSMutableArray *giftCardImgArray = [NSMutableArray array];
    NSMutableArray *giftCardtotviewArray = [NSMutableArray array];
    
    
    
    // create the URL we'd like to query
    
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/gpcategory&path=%@",idStr];
    //  NSString *urlStr = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
    
    NSURL *myURL = [[NSURL alloc]initWithString:urlStr];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    NSLog(@"data in mydata.... is %@",myData);
    
    // now we'll parse our data using NSJSONSerialization
    if ([myData length]>0) {
        id myjson = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
        jsonArray = [myjson objectForKey:@"productLists"];
        NSLog(@"data in jsonarray...... is %@",jsonArray);
        
        for (int i=0 ; i<[jsonArray count] ; i++)
        {
            [giftCardPriceArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"price"]];
            [giftCardDescArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"desc"]];
            [giftCardNameArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"pname"]];
            //[giftCardImgArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            [giftCardIdArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"proid"]];
            [giftCardtotviewArray addObject:[[jsonArray objectAtIndex:i]objectForKey:@"totview"]];
            NSString *urlImageString = [NSString stringWithFormat:@"%@",[[jsonArray objectAtIndex:i]objectForKey:@"image"]];
            urlImageString = [urlImageString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            NSURL *urlone = [NSURL URLWithString:urlImageString];
            NSData *newData = [NSData dataWithContentsOfURL:urlone];
            [giftCardImgArray addObject:newData];
            
            
        }
        [allProducts addObject:giftCardDescArray];
        [allProducts addObject:giftCardIdArray];
        [allProducts addObject:giftCardImgArray];
        [allProducts addObject:giftCardNameArray];
        [allProducts addObject:giftCardPriceArray];
        [allProducts addObject:giftCardtotviewArray];
        
        
    }
    return allProducts;
    
}



@end
