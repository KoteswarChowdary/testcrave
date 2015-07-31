//
//  GiftCardViewController.m
//  WeCraveProject
//
//  Created by hari on 20/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "GiftCardViewController.h"
#import "GiftCardDetails.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface GiftCardViewController ()

@end

@implementation GiftCardViewController
@synthesize imageView;

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
   // to Set Backgroung Image to View
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    /*
     [self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
     [self.view setBackgroundColor:UIColorFromRGB(0x5BCAFF)];
     */
    
    
    //To set All Table View Delagate Methods
    self.tableView.delegate = self;
   

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
    
    allProducts = [[NSMutableArray alloc]init];
    allArrayObjects =  [[self getGiftcardByCatID:self.catId andSubCatID:self.subCatId]copy];
    



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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[allArrayObjects objectAtIndex:2] count];
}

- (CGFloat)heightForRowAtIndex:(NSUInteger)index
{
    return 60;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"productbg260.png"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
   // if (indexPath.row % 2 == 0) {
       // [cell setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
        
        [cell setBackgroundColor:UIColorFromRGB(0x90EE90)];

   // }
   // else {
     //   [cell setBackgroundColor:[UIColor whiteColor]];
    //}
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    

    //cell.textLabel.text = [array objectAtIndex:indexPath.row];
     UILabel *modal_label = (UILabel *)[cell viewWithTag:101];
    modal_label.text = [[allArrayObjects objectAtIndex:3]objectAtIndex:indexPath.row];
//    
//    NSString *urlString = [NSString stringWithFormat:@"%@",[[allArrayObjects objectAtIndex:2] objectAtIndex:indexPath.row]];
//    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSURL *urlone = [NSURL URLWithString:urlString];
//    NSData *newData = [NSData dataWithContentsOfURL:urlone];
    
    // Display recipe in the table cell
    
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
//     //recipeImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"imageBackground.png"]];
//    recipeImageView.layer.cornerRadius = 5.0;
//    recipeImageView.layer.borderWidth = 1.5f;
//    recipeImageView.layer.borderColor = [UIColor blackColor].CGColor;
//    recipeImageView.clipsToBounds= YES;
//    
//   // recipeImageView.image = [UIImage imageWithData:newData];
    
    NSData *data1 = [NSData dataWithData:[[allProducts objectAtIndex:2] objectAtIndex:indexPath.row]];
    
    cell.imageView.image = [UIImage imageWithData:data1];
    

     UIImageView *ratingImage = (UIImageView *)[cell viewWithTag:102];
    ratingImage.image = [self imageForRating:[[[allArrayObjects objectAtIndex:4] objectAtIndex:indexPath.row] floatValue]];
    cell.layer.cornerRadius = 8;
    cell.layer.borderWidth = 1.5f;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    if (indexPath.row % 2 == 0) {
        // [cell setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
        [cell setBackgroundColor:[UIColor clearColor]];
        cell.userInteractionEnabled = YES;
        
        //  cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBgnd.png"]];
        
    }
    else {
        [cell setBackgroundColor:UIColorFromRGB(0x9a33cc)];
    }

return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

        if ([[segue identifier] isEqualToString:@"gift"])
        {
            GiftCardDetails *detailViewController =[segue destinationViewController];
          
            NSIndexPath *myIndexPath = [self.tableView
                                        indexPathForSelectedRow];
           

          //  NSArray *dataFromGift = (NSArray*)(self.responseDict);
             //detailViewController.getDict = [dataFromGift objectAtIndex:myIndexPath.row];
           
           // NSLog(@"data in detailViewController.getDict is %@",detailViewController.getDict);
            detailViewController.giftNames = [[self.responseDict valueForKey:@"pname"]objectAtIndex:myIndexPath.row];
            detailViewController.giftDesc = [[self.responseDict valueForKey:@"desc"]objectAtIndex:myIndexPath.row];
            detailViewController.giftImage = [[self.responseDict valueForKey:@"image"]objectAtIndex:myIndexPath.row];
            detailViewController.giftPrice = [[self.responseDict valueForKey:@"price"]objectAtIndex:myIndexPath.row];
            detailViewController.giftId = [[self.responseDict valueForKey:@"id"]objectAtIndex:myIndexPath.row];
            
            NSUserDefaults *GiftcardDetails = [NSUserDefaults standardUserDefaults];
            [GiftcardDetails setObject:[[allArrayObjects objectAtIndex:3] objectAtIndex:myIndexPath.row] forKey:@"pname"];
            [GiftcardDetails setObject:[[allArrayObjects objectAtIndex:0] objectAtIndex:myIndexPath.row] forKey:@"desc"];
            [GiftcardDetails setObject:[[allArrayObjects objectAtIndex:2] objectAtIndex:myIndexPath.row] forKey:@"image"];
            
            [GiftcardDetails setObject:[[allArrayObjects objectAtIndex:4] objectAtIndex:myIndexPath.row] forKey:@"price"];
            [GiftcardDetails setObject:[[allArrayObjects objectAtIndex:1] objectAtIndex:myIndexPath.row] forKey:@"pID"];
            [GiftcardDetails synchronize];

            


        }
}

-(NSMutableArray*)getGiftcardByCatID:(NSString*)idStr andSubCatID:(NSString*)subCatID;
{
   
    NSMutableArray * giftCardDescArray=[NSMutableArray array];
    NSMutableArray* giftCardPriceArray=[NSMutableArray array];
    NSMutableArray* giftCardIdArray=[NSMutableArray array];
    NSMutableArray *giftCardNameArray = [NSMutableArray array];
    NSMutableArray *giftCardImgArray = [NSMutableArray array];
    NSMutableArray *giftCardtotviewArray = [NSMutableArray array];
    
    
    
    // create the URL we'd like to query
    
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/getprobysc&cid=%@&sid=%@",idStr,subCatID];
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
