//
//  ToppingsTableViewController.m
//  WeCraveProject
//
//  Created by hari on 09/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "ToppingsTableViewController.h"
#import "SubCatToppingsTableViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ToppingsTableViewController ()
{
    NSTimer *timer;
}

@end

@implementation ToppingsTableViewController

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
   
    
//****************************Table Methods and Others ***********************************
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.edgesForExtendedLayout=UIRectEdgeNone;
  //  [self.view sendSubviewToBack:self.tableView];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
  //  [self gettoppingsFromUrl];
    
//****************************Back and Home Button Methods***********************************
    
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
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
 //****************************Calling URL to Data  ***********************************
    
    @try
    {
       // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSString *urlString = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/gpcategory&path=67"];
        // http://192.168.1.10:8084/devteam/craveec ----> http://saiss.co.in/craveec
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *raw_data = [NSData dataWithContentsOfURL:url];
    NSLog(@"the data is %@",raw_data);
    NSError *error = nil;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:raw_data options:kNilOptions error:&error];
    NSLog(@"%@",json);
    array_data = [json objectForKey:@"subcatlist"];
    NSLog(@"data in array is %@",array_data);
    toppingNames = [NSMutableArray array];
    toppingCatId = [NSMutableArray array];
    toppingSubCatId = [NSMutableArray array];
    for (int i=0 ; i<[array_data count] ; i++ ) {
        
        
        [toppingCatId addObject:[[array_data objectAtIndex:i]objectForKey:@"catid"]];
        [toppingSubCatId addObject:[[array_data objectAtIndex:i]objectForKey:@"subcatid"]];
        [toppingNames addObject:[[array_data objectAtIndex:i] objectForKey:@"subcatname"]];
        
    }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    }
    @catch (NSException *exception) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"no network");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Network No data" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [self.tabBarController setSelectedIndex:0];

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL) animated {
    
 timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:NO];
    

      
}
-(void)timerMethod
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    if (![toppingCatId isKindOfClass:[NSMutableArray class]]) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Not Connected to network" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [act stopAnimating];
}
-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [act stopAnimating];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

       return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

  
    return [toppingNames count];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"productBackground.png"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainCell";
     tableView.separatorColor = [UIColor redColor];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
               
          //  [cell setBackgroundColor:UIColorFromRGB(0x90EE90)];
       // cell.layer.cornerRadius = 30;
        //cell.layer.borderWidth = 0.5f;
       // cell.layer.borderColor = [UIColor clearColor].CGColor;
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.shadowOffset = CGSizeMake(1, 0);
        cell.layer.shadowColor = [[UIColor clearColor] CGColor];
        cell.layer.shadowRadius = 5;
        cell.layer.shadowOpacity = .25;
     
        
        cell.layer.backgroundColor = [UIColor clearColor].CGColor;
        
        
    }
    else {
        [cell setBackgroundColor:[UIColor clearColor]];
    }

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryView = act;
        
    }
    [tableView setSeparatorInset:UIEdgeInsetsZero];// To extend the seperator line full the cell
    UILabel *toppingTypeNames_label = (UILabel *)[cell viewWithTag:100];
    toppingTypeNames_label.text = [toppingNames objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryView = act;
     UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)cell.accessoryView;
    [activityIndicator startAnimating];

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.catId = [toppingCatId objectAtIndex:indexPath.row];
    self.subCatId = [toppingSubCatId objectAtIndex:indexPath.row];
    NSLog(@"%@ %@",self.catId,self.subCatId);
    [act startAnimating];
    [self performSelector:@selector(performSomeAction) withObject:nil afterDelay:0];
    
    
}
-(void)performSomeAction
{
    [self performSegueWithIdentifier:@"toppings" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"toppings"]) {
        
    SubCatToppingsTableViewController *topping = segue.destinationViewController;
    topping.catId = self.catId;
    topping.subCatId = self.subCatId;
         NSLog(@"%@ %@",topping.catId, topping.subCatId);
    }
   
    
}
-(void)gettoppingsFromUrl
{
    @try {
        
        NSURL *url = [NSURL URLWithString:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/gpcategory&path=67"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data, NSError *connectionError)
         {
             if (data.length > 0 && connectionError == nil)
             {
                 
                 NSError *error;
                 
                 NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                 NSLog(@"%@",json);
                 array_data = [json objectForKey:@"subcatlist"];
                 NSLog(@"data in array is %@",array_data);
                 
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
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.tabBarController setSelectedIndex:0];
    }
}


@end
