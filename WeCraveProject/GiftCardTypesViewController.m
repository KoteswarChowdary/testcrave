//
//  GiftCardTypesViewController.m
//  WeCraveProject
//
//  Created by hari on 10/04/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "GiftCardTypesViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface GiftCardTypesViewController ()
@property (strong, nonatomic) IBOutlet UIButton *birthdaycardBtn;
@property (strong, nonatomic) IBOutlet UIButton *businesscardBtn;

@end

@implementation GiftCardTypesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   //  [self.view setBackgroundColor:UIColorFromRGB(0x90EE90)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
   // [self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [ self.birthdaycardBtn setBackgroundColor:[UIColor greenColor]];
    [self.businesscardBtn setBackgroundColor:[UIColor purpleColor]];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift_head.png"]];

//[self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setBackgroundImage:[UIImage imageNamed:@"back.png"]
						  forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(GoBack)
		 forControlEvents:UIControlEventTouchUpInside];
	NSString *bckbtn = @"Back";
	[backButton setTitle:bckbtn forState:UIControlStateNormal];
	backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0];
	backButton.frame = CGRectMake(0, 0, 50, 33);
	backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	[backButton setContentMode:UIViewContentModeCenter];
	backButton.titleLabel.textColor = [UIColor whiteColor];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem = addButton;
	self.navigationItem.hidesBackButton = TRUE;
	
    UIButton *btnNext1 =[[UIButton alloc] init];
   // NSString *btntitle = @"Home";
	//[btnNext1 setTitle:btntitle forState:UIControlStateNormal];
    
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"home2.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(200, 60, 55, 44);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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


- (IBAction)birthdayGC:(id)sender {
    [self.activityIndicator startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=70"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    /*
    NSData *raw_data = [NSData dataWithContentsOfURL:url];
    NSLog(@"the data is %@",raw_data);
    NSError *error = nil;
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:raw_data options:kNilOptions error:&error];
    NSLog(@"%@",json);

    array_data = [json objectForKey:@"subcatlist"];
    NSLog(@"data in array is %@",array_data); */
    
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSLog(@"responce string is  %@",response);
         [self.activityIndicator stopAnimating];
         if ([httpResponse statusCode] != 200)
         {
             //array_data = [json objectForKey:@"subcatlist"];
             //NSLog(@"data in array is %@",array_data);
         }
        else {
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry! " message:@"No Birthday Cards are avaliable at We Crave Store" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                 
                 [alert show]; 
    
     }
         }];
    
    
}

-(void)gotoPushSegue
{
    [self performSegueWithIdentifier:@"businessGC" sender:self];
}

-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [self.activityIndicator stopAnimating];
}


- (IBAction)businessGiftCard:(id)sender {
    
    
    @try {
        [self.activityIndicator startAnimating];
        
      /*  NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=71"];
       
        [self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *raw_data = [NSData dataWithContentsOfURL:url];
        NSLog(@"the data is %@",raw_data);
        NSError *error = nil;
        
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:raw_data options:kNilOptions error:&error];
        NSLog(@"%@",json);
        if (json) {
            [self performSelector:@selector(gotoPushSegue) withObject:nil afterDelay:0];
            
        } */
        NSString *queryString = [NSString stringWithFormat:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/gpcategory&path=71"];
        NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                  requestWithURL:[NSURL URLWithString:
                                                  queryString]
                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                  timeoutInterval:60.0];
        [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            if (error) {
                //do something with error
            } else {
                NSString *responseText = [[NSString alloc] initWithData:data encoding: NSASCIIStringEncoding];
                NSLog(@"Response: %@", responseText);
                
                NSString *newLineStr = @"\n";
                responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
                [self performSelector:@selector(gotoPushSegue) withObject:nil afterDelay:0];
               
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"no network");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Network" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [self.activityIndicator stopAnimating];
        
        
        [alert show];
    }

}

- (IBAction)marriageGiftcards:(id)sender {

    
    [self.activityIndicator startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=70"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSLog(@"responce string is  %@",response);
         [self.activityIndicator stopAnimating];
         if ([httpResponse statusCode] != 200)
         {
             //array_data = [json objectForKey:@"subcatlist"];
             //NSLog(@"data in array is %@",array_data);
         }
         else {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry! " message:@"No Marriage Cards are avaliable at We Crave Store" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
             [alert setBackgroundColor:[UIColor greenColor]];
             
             [alert show];
             
         }
     }];
    
    

}

- (IBAction)travelGigtCard:(id)sender {
    
    
    [self.activityIndicator startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=70"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSLog(@"responce string is  %@",response);
         [self.activityIndicator stopAnimating];
         if ([httpResponse statusCode] != 200)
         {
             //array_data = [json objectForKey:@"subcatlist"];
             //NSLog(@"data in array is %@",array_data);
         }
         else {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry! " message:@"No Travel Gift Cards are avaliable at We Crave Store" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
             [alert setTintColor:[UIColor redColor]];

             
             [alert show];
             
         }
     }];
    

}

- (IBAction)weddingGiftCard:(id)sender {
    
    [self.activityIndicator startAnimating];
    NSString *urlString = [NSString stringWithFormat:@"http://saiss.co.in/craveec/index.php?route=module/service/gpcategory&path=70"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSLog(@"responce string is  %@",response);
         [self.activityIndicator stopAnimating];
         if ([httpResponse statusCode] != 200)
         {
             //array_data = [json objectForKey:@"subcatlist"];
             //NSLog(@"data in array is %@",array_data);
         }
         else {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry! " message:@"No Wedding GiftCards are avaliable at We Crave Store" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
             
             [alert show];
             
         }
     }];
    

}
@end
