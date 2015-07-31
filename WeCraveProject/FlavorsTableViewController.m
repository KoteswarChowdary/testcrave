//
//  FlavorsTableViewController.m
//  WeCraveProject
//
//  Created by hari on 09/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "FlavorsTableViewController.h"
#import "NewFloursTableViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface FlavorsTableViewController ()
{
    NSTimer *timer;
}

@end

@implementation FlavorsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    
    self = [super initWithStyle:style];     if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

     // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
   
    self.navigationItem.title = @"Flavours";
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

    @try {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=20"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *raw_data = [NSData dataWithContentsOfURL:url];
    NSLog(@"the data is %@",raw_data);
    NSError *error = nil;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:raw_data options:kNilOptions error:&error];
    NSLog(@"%@",json);
    array_data = [json objectForKey:@"subcatlist"];
     NSLog(@"data in array is %@",array_data);
    flavorCatId = [NSMutableArray array];
    flavorSubcatIds = [NSMutableArray array];
    flavorSubCatNames = [NSMutableArray array];
    for (int i=0 ; i<[array_data count] ; i++ ) {
        
       
        [flavorCatId addObject:[[array_data objectAtIndex:i]objectForKey:@"catid"]];
        [flavorSubcatIds addObject:[[array_data objectAtIndex:i]objectForKey:@"subcatid"]];
        [flavorSubCatNames addObject:[[array_data objectAtIndex:i] objectForKey:@"subcatname"]];
        
    }
           }
    
        @catch (NSException *exception) {
            NSLog(@"no network");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Network No Data" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

                        [alert show];
            [self.tabBarController setSelectedIndex:0];

           
        }

    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation  duration:(NSTimeInterval)duration {
    //[super willAnimateRotationToInterfaceOrientation:orientation duration:duration];
    CGRect frame = self.navigationController.navigationBar.frame;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        frame.size.height = 44;
    } else {
        frame.size.height = 44;
    }
    self.navigationController.navigationBar.frame = frame;
}

-(void)viewWillAppear:(BOOL) animated {

    
    timer =   [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:NO];
   // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

        
   }
-(void)timerMethod
{
   [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    if (![flavorCatId isKindOfClass:[NSMutableArray class]]) {
        
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Not Connected to network" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [alert show];
         [self.tabBarController setSelectedIndex:0];
    }
}

-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
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
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
   // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    [act stopAnimating];
}

-(void)testUrlDataInView:(NSString *)str
{
     NSString *str1 = [NSString stringWithFormat:@"%@",@"koti"];
    if ([str1 isEqualToString:str]) {
        
        
        [self performSelector:@selector(performSomeAction) withObject:nil afterDelay:0];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"%@", str1] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }

    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [flavorSubcatIds count];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = UIColorFromRGB(0x944DFF);

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.layer.cornerRadius = 10;
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    UILabel *flavorTypeNames_label = (UILabel *)[cell viewWithTag:100];
    
    flavorTypeNames_label.text = [flavorSubCatNames objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   
    cell.accessoryView = act;
  
    
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.catId = [flavorCatId objectAtIndex:indexPath.row];
   self.subCatId = [flavorSubcatIds objectAtIndex:indexPath.row];
    [act startAnimating];
    NewFloursTableViewController *flavor = [[NewFloursTableViewController alloc]init];
    flavor.delegate = self;
    // flavor.catId = self.catId;
    // flavor.subCatId = self.subCatId;
    [flavor sampleProcessToCallDelegate:self.catId andsubcatId:self.subCatId];
    
   // [self performSelector:@selector(performSomeAction) withObject:nil afterDelay:0];
    
}
-(void)performSomeAction
{
    [self performSegueWithIdentifier:@"seugeflavor" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NewFloursTableViewController *detailViewController = [segue destinationViewController];
    detailViewController.catId = self.catId;
    detailViewController.subCatId = self.subCatId;
    
}


@end
