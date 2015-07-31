//
//  LoginViewController.m
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "RegisterViewController.h"
#import "MainMenuCollectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface LoginViewController ()
{
    UIView *popupView;
}

@end

@implementation LoginViewController
@synthesize email,Passwd,backImage,scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    if ((fromInterfaceOrientation == UIInterfaceOrientationPortrait) || (fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        NSLog(@"landscape");
        
    }
    if ((fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight) || (fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        
       // self.view.backgroundColor = [UIColor grayColor];
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginPageBg.jpg"]]];
        NSLog(@"portlite");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIInterfaceOrientation currentOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    NSLog(@"current orientation is %ld",currentOrientation);
    [self.view addSubview:scrollView];
    self.email.delegate = self;
    [self.email setLeftViewMode:UITextFieldViewModeAlways];
    self.email.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home1.png"]];
    
    [self.Passwd setLeftViewMode:UITextFieldViewModeAlways];
    self.Passwd.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home1.png"]];
    
    self.Passwd.delegate =self;
    [self.scrollView setScrollEnabled:YES];
    self.email.opaque = YES;
    self.email.alpha = 1.0f;
    self.Passwd.opaque = YES;
    
    [self.email setLeftViewMode:UITextFieldViewModeAlways];
    self.email.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"EmailIcon.png"]];
    [self.Passwd setLeftViewMode:UITextFieldViewModeAlways];
    self.Passwd.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PasswordIcon.png"]];
   

    
   // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
   // UIImage *backgroundImage = [UIImage imageNamed:@"appbackground.png"];
   // UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
   // [self.view setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:193.0/255.0 blue:139.0/255.0 alpha:1.0]];
  //  [self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
   //--- [self.view setBackgroundColor:UIColorFromRGB(0x90EE90)];
   // self.backImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image_frame.png"]];
    


    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"LoginPageBg.jpg"]]];
    popupView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 480)];
    
    self.topView.layer.cornerRadius = 8;
    self.topView.layer.borderWidth = 2;
    self.topView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.topView.layer.masksToBounds = YES;
    self.topView.backgroundColor = [UIColor whiteColor];
    self.topView.alpha = 0.8f;
    self.topView.opaque = YES;
    //[self.topView addSubview:self.email];
   // [popupView addSubview:self.Passwd];
    [popupView addSubview:self.activityIndicator];
   
    [self.scrollView addSubview:popupView];
    popupView.hidden = YES;
    [self.scrollView addSubview:self.topView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:singleTap];
    
    
    
}
-(void)hideKeyboard
{
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    popupView.hidden = YES;
    
    [self.activityIndicator stopAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
}

-(void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = CGSizeMake(320, 650);
}

// Implement TextField delegate // registergo

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    NSLog(@"TEXT FIELD  Resign First Responder");
    
    
}
// Implement TouchEvent


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}

- (IBAction)signInBtn:(id)sender {
    
    [self.activityIndicator startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
   
   // [self.activityIndicator setColor:[UIColor redColor]];
        @try {
    
    error = @"";
    NSString *emailString = email.text;
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
   NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
    
    if ([email.text isEqualToString:@""]) {
        error = [NSString stringWithFormat:@"Enter Email Address"];
		[email becomeFirstResponder];
    }
    else if([Passwd.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter the Password"];
		[Passwd becomeFirstResponder];
    }

    else if ([emailTest evaluateWithObject:emailString] != YES)
    {
        error = [NSString stringWithFormat:@"Invalid Email"];
		[email becomeFirstResponder];
    }
    else if([[email text] isEqualToString:@""] || [[Passwd text] isEqualToString:@""] )
    {
        [self alertStatus:@"Check Email & password Correctly" :@"Login failed"];
        return;
    }
    else if(Passwd.text.length < 6)
    {
		error = [NSString stringWithFormat:@"Password must contain minimum of '6' characters"];
		[Passwd becomeFirstResponder];
    }
    if(![error isEqualToString: @""])
    {
        UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Oops!" message:error
                                                        delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
		[prompt show];
				
    }
       // Sending the data to the Server Database To pass the Username nad Pasword
    
   else
   {
       
   
    //NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    //[data setObject:@"login" forKey:@"action"];
    //[data setObject:uname forKey:@"username"];
   // [data setObject:password forKey:@"password"];
       
       popupView.hidden = NO;
        [self.activityIndicator startAnimating];
    
     
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
  
    NSString *post =    [NSString stringWithFormat:@"email=%@&&password=%@",[email text],[Passwd text]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    NSURL *theUrl = [NSURL URLWithString:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/checklogin"];
    [request setURL:theUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
       
        // ------------->   getting the "Response" from web server.
       
    NSError *Error;
    NSURLResponse *response;
    NSData *PostReply=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&Error];
       NSLog(@"data in post reply is %@",PostReply);
       if (PostReply) {
            [self.activityIndicator stopAnimating];
           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

       }
      
    NSString *theReply = [[NSString alloc] initWithBytes:[PostReply bytes] length:[PostReply length] encoding: NSASCIIStringEncoding];
       NSLog(@"data in the reply is %@",theReply);
       NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:PostReply options:kNilOptions error:nil];
       NSLog(@"data in the jsondata is %@",jsonData);

       NSArray *result = [jsonData objectForKey:@"status"];
       NSDictionary *dict = [result objectAtIndex:0];
       NSString *resString = [dict objectForKey:@"status"];

      // NSString *gotResponce = @"Login Sucess"; {"cid":"44","login":"loginsuccess"}
       
  if ([resString isEqualToString:@"success"])
   // if (responseString)
    {
         [self.activityIndicator stopAnimating];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];

       // [self alertStatus:@"Thanks for Login" :@"Welcome"];
        NSUserDefaults *userLoginId = [NSUserDefaults standardUserDefaults];
        NSString *resString = [dict objectForKey:@"customerid"];
        [userLoginId setObject:resString forKey:@"customerId"];
         NSLog(@"customerId %@",[userLoginId objectForKey:@"customerId"]);
        [userLoginId synchronize];
       
        
        [self performSegueWithIdentifier:@"Home" sender:sender];
        // [self.activityIndicator stopAnimating];
            }
     else
    {
         [self.activityIndicator stopAnimating];
         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
        NSLog(@"fail to connect ");
        [self alertStatus:@"Fail to Connect":@"Sorry"];
       
    }
   
   }
    }
    @catch (NSException * e) {
         [self.activityIndicator stopAnimating];
         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Failed." :@"Login Failed!"];
       //  [self.activityIndicator stopAnimating];
       
    }

}
-(IBAction)signUp:(id)sender {
    
    [self performSegueWithIdentifier:@"ToRegistration" sender:sender];

    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Home"]) {
        
      //  MainMenuCollectionViewController *mainView = segue.destinationViewController;
    }
    if ([segue.identifier isEqualToString:@"ToRegistration"]) {
      //  RegisterViewController *registerViwe = segue.destinationViewController;
        
    }
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)unwindToHomeController:(UIStoryboardSegue*)sender
{
    NSLog(@"Home View Controller is Called");
}
@end
