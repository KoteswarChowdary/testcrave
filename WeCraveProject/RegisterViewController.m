//
//  RegisterViewController.m
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "RegisterViewController.h"
#import "ViewController.h"
#import "testViewController.h"
#import "LoginViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize userName,emailField,passWord,contactNum,reTypePassword;

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
   
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    [headerView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"logoImg.png"];
    [self.view addSubview:headerView];

    
    self.userName.delegate = self;
    self.emailField.delegate = self;
    self.passWord.delegate = self;
    self.reTypePassword.delegate = self;
    self.contactNum.delegate = self;
    
    self.userName.layer.cornerRadius = 5;
    self.userName.layer.borderWidth = 0.5;
    self.userName.layer.borderColor = [UIColor blackColor].CGColor;
    self.userName.layer.masksToBounds = YES;
    self.userName.backgroundColor = [UIColor whiteColor];
    
    self.passWord.layer.cornerRadius = 5;
    self.passWord.layer.borderWidth = 0.5;
    self.passWord.layer.borderColor = [UIColor blackColor].CGColor;
    self.passWord.layer.masksToBounds = YES;
    self.passWord.backgroundColor = [UIColor whiteColor];

    
    self.emailField.layer.cornerRadius = 5;
    self.emailField.layer.borderWidth = 0.5;
    self.emailField.layer.borderColor = [UIColor blackColor].CGColor;
    self.emailField.layer.masksToBounds = YES;
    self.emailField.backgroundColor = [UIColor whiteColor];

    
    self.reTypePassword.layer.cornerRadius = 5;
    self.reTypePassword.layer.borderWidth = 0.5;
    self.reTypePassword.layer.borderColor = [UIColor blackColor].CGColor;
    self.reTypePassword.layer.masksToBounds = YES;
    self.reTypePassword.backgroundColor = [UIColor whiteColor];

    
    self.contactNum.layer.cornerRadius = 5;
    self.contactNum.layer.borderWidth = 0.5;
    self.contactNum.layer.borderColor = [UIColor blackColor].CGColor;
    self.contactNum.layer.masksToBounds = YES;
    self.contactNum.backgroundColor = [UIColor whiteColor];
   /*
    self.SubmitButton.layer.cornerRadius = 5;
    self.SubmitButton.layer.borderWidth = 0.5;
     [self.SubmitButton setContentMode:UIViewContentModeScaleAspectFill];
    [self.SubmitButton setImage:[UIImage imageNamed:@"SubmitButtonImg.png"] forState:UIControlStateNormal];
    self.CancelButton.layer.cornerRadius = 5;
    self.CancelButton.layer.borderWidth = 0.5;
     [self.CancelButton setContentMode:UIViewContentModeScaleAspectFill];
    [self.CancelButton setImage:[UIImage imageNamed:@"CancelButtonImg.png"] forState:UIControlStateNormal]; */
   
    
    

   
    
    [self.userName setLeftViewMode:UITextFieldViewModeAlways];
    self.userName.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NameIcon.png"]];
    [self.emailField setLeftViewMode:UITextFieldViewModeAlways];
    self.emailField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"EmailIcon.png"]];
    [self.passWord setLeftViewMode:UITextFieldViewModeAlways];
    self.passWord.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PasswordIcon.png"]];
    [self.reTypePassword setLeftViewMode:UITextFieldViewModeAlways];
    self.reTypePassword.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PasswordIcon.png"]];
    [self.contactNum setLeftViewMode:UITextFieldViewModeAlways];
    self.contactNum.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PhoneNumIcon.png"]];
    
    
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"BackGroundimg.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    //[self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
     [self.view setBackgroundColor:backgroundPattern];
    
    [self.RegisterView addSubview:self.userName];
    [self.RegisterView addSubview:self.emailField];
    [self.RegisterView addSubview:self.passWord];
    [self.RegisterView addSubview:self.reTypePassword];
    [self.RegisterView addSubview:self.contactNum];
    [self.RegisterView  addSubview:self.CancelButton];
    [self.RegisterView addSubview:self.SubmitButton];
    
    
    self.RegisterView.layer.cornerRadius = 8;
    self.RegisterView.layer.borderWidth = 2;
    self.RegisterView.layer.borderColor = [UIColor blueColor].CGColor;
    self.RegisterView.layer.masksToBounds = YES;
    self.RegisterView.alpha = 1;
    self.RegisterView.opaque = NO;
    
    UIImage *registerBgImage = [UIImage imageNamed:@"RegistrationViewBgImg.png"];
    UIColor *registerBgPattern = [UIColor colorWithPatternImage:registerBgImage];
    //[self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:185.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [self.RegisterView setBackgroundColor:registerBgPattern];

    
    
    [self.scroller addSubview:self.RegisterView];
    [self.view addSubview:self.scroller];
    
  //  [self.view addSubview:self.RegisterView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:singleTap];
    
    

}
-(void)hideKeyboard
{
    [self.view endEditing:YES];
    
}

-(void)viewDidLayoutSubviews
{
    self.scroller.contentSize = CGSizeMake(320, 650);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// Implement TextField delegate // registergo

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    NSLog(@"TEXT FIELD  Resign First Responder");
    
    
}
// Implement TouchEvent


-(void)touchesBegan :(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touch Begin's");
}
- (IBAction)submitBtn:(id)sender {

@try {
    
    
    error = @"";
    NSString *emailString = emailField.text;
   // NSString *passwordValidate = passWord.text;
    NSString *contactNumValidate = contactNum.text;
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
    NSString *str=@"[0-9][0-9]{9}";
        NSPredicate *number=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    
    if ([userName.text isEqualToString:@""]) {
        error = [NSString stringWithFormat:@"Enter Your name"];
        [userName becomeFirstResponder];
    }
    
    else if ([emailField.text isEqualToString:@""]) {
        error = [NSString stringWithFormat:@"Enter Email Address"];
		[emailField becomeFirstResponder];
    }
    else if([passWord.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter the Password"];
		[passWord becomeFirstResponder];
    }
    
    else if ([emailTest evaluateWithObject:emailString] != YES)
    {
        error = [NSString stringWithFormat:@"Invalid Email"];
		[emailField becomeFirstResponder];
    }
    
    else if(passWord.text.length < 6)
    {
		error = [NSString stringWithFormat:@"Password must contain minimum of '6' characters"];
		[passWord becomeFirstResponder];
    }
    else if ([number evaluateWithObject:contactNumValidate] != YES)
    {
        error = [NSString stringWithFormat:@"Mobile Number should Contain 10 num's"];
        [contactNum becomeFirstResponder];
    }
    
   /* else if ([contactNum.text length] < 10)
    {
        error = [NSString stringWithFormat:@"Mobile Number should Contain 10 num's"];
        [contactNum becomeFirstResponder];
    } */
    else if([[emailField text] isEqualToString:@""] || [[passWord text] isEqualToString:@""] || [[contactNum text] isEqualToString:@""] || [[userName text] isEqualToString:@""])
    {
        [self alertStatus:@"Check Username,Email ,Password & Number Correctly" :@"Registration failed"];
        return;
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
         [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
        
        NSString *post =[NSString stringWithFormat:@"username=%@&email=%@&contact=%@&password=%@",[userName text],[emailField text],[contactNum text],[passWord text]];
        NSLog(@"data in post string is %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSLog(@"data in post data is %@",postData);
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSLog(@"data in post length is %@", postLength);
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
         NSURL *theUrl = [NSURL URLWithString:@"http://192.168.1.10:8084/devteam/craveec/index.php?route=module/service/insertcustomer"]; 
         [request setURL:theUrl];
        
        NSLog(@"data in request is %@",request);
         [request setHTTPMethod:@"POST"];
        
        NSLog(@"dat in request post is %@",request);
         [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
         [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
         [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
         [request setHTTPBody:postData];
        
         
         //getting the response
         NSError *Error;
         NSURLResponse *response;
         NSData *PostReply=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&Error];
        id myjson = [NSJSONSerialization JSONObjectWithData:PostReply options:NSJSONReadingMutableContainers error:nil];
        //  NSString *responseString=[[NSString alloc]initWithData:PostReply encoding:NSUTF8StringEncoding];
        NSLog(@"responce is %@",myjson);
        // NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:responseString options:kNilOptions error:&Error];
        //NSLog(@"data in %@",json);
        responceData = [myjson objectForKey:@"status"];
        NSLog(@"data in array is %@",responceData);
        NSDictionary *gotResponce = [[responceData objectAtIndex:0]objectForKey:@"insertion"];
        NSString *strResponce = (NSString*)(gotResponce);
         if ([strResponce isEqualToString:@"success"])
         //if (responseString)
         {
         [self alertStatus:@"Thanks for Registring" :@"Welcome"];
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
         
         [self performSegueWithIdentifier:@"Home" sender:sender];
             
         }
        
         else
         {
         NSLog(@"fail to connect");
         [self alertStatus:@"Fail to Connect":@" Sorry"];
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
         
         }
        if ([strResponce isEqualToString:@"email already exists"])
            //if (responseString)
        {
            [self alertStatus:@"Email Already Exists":@"Message"];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
            
            
        }

         
    }
}
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Failed." :@"Login Failed!"];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
    }
    
    
        
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Home"]) {
         ViewController *destination = segue.destinationViewController;
    }
    if ([segue.identifier isEqualToString:@"ToLogin"]) {
        LoginViewController *goToLoginPage = segue.destinationViewController;
    }
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}


- (IBAction)CancelButtonMethod:(id)sender {
    
    NSLog(@"method called %@",sender);
    
   // [self performSegueWithIdentifier:@"ToLogin" sender:sender];

}
@end
