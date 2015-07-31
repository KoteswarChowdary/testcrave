//
//  FriendDetailsViewController.m
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "FriendDetailsViewController.h"
#import "SampleViewViewController.h"
#import "PayViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface FriendDetailsViewController ()
{
    NSUserDefaults *giftDetailsSendToDB;
    NSUserDefaults *loginId;

}

@end

@implementation FriendDetailsViewController
@synthesize tapGester,friendName,friendCell,friendEmailAddress,firstName,addressField,stateOrRegion,lastNameField,cityField,countryField,postalCode,checkBoxButton;


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
     checked = NO; //Check Button checking
   
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
    self.successView.hidden = YES;
   
    dict = [[NSMutableDictionary alloc]init]; // for sendinding frnd details to other page //
    

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
    
    // HomeButton and Image for It
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    btnNext1.frame = CGRectMake(100, 100, 60, 40);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    


    
    self.friendName.delegate = self;
    self.friendEmailAddress.delegate =self;
    self.friendCell.delegate = self;
    self.firstName.delegate = self;
    self.addressField.delegate = self;
    self.countryField.delegate = self;
    self.stateOrRegion.delegate = self;
    self.postalCode.delegate = self;
    self.cityField.delegate = self;
    self.lastNameField.delegate = self;
     [friendCell setKeyboardType:UIKeyboardTypeNamePhonePad];
    [friendEmailAddress setKeyboardType:UIKeyboardTypeEmailAddress];
    [friendName setKeyboardType:UIKeyboardTypeAlphabet];
    [self.postalCode setKeyboardType:UIKeyboardTypeNumberPad];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:singleTap];
    
    
    giftDetailsSendToDB = [NSUserDefaults standardUserDefaults];
    loginId = [NSUserDefaults standardUserDefaults];
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
    self.scroller.contentSize = CGSizeMake(320, 700);
}
- (void)showSuccess {
   
    self.successView.layer.cornerRadius = 6;
    self.successView.layer.borderWidth = 1.5f;
    self.successView.hidden = NO;
    self.successView.alpha = 1.0f;
    self.termsConditionsLabel.layer.cornerRadius = 3;
    self.termsConditionsLabel.layer.borderWidth = 1.5f;
    self.termsConditionsLabel.layer.borderColor = [UIColor blueColor].CGColor;
    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationDelay:2.0];
  //  self.successView.alpha = 0.0f;
//    [UIView commitAnimations];
//    NSLog(@"sucess View");
}
- (IBAction)termsOkButton:(id)sender {
    self.successView.hidden = YES;
     
}

// Implement TextField delegate // registergo
-(void)hideKeyboard
{
    [self.view endEditing:YES];
    
}

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)conditionButton:(id)sender {
   
    self.ConditionsView.hidden= NO;
    self.successView.center = self.view.center;
    NSLog(@"Please Read the Terms And Conditions");
    [self showSuccess];
    self.ConditionsView.hidden= NO;
    self.ConditionsView.backgroundColor = [UIColor yellowColor];
   

  //  self.ConditionsView.text = @"1. It is valid up to 25 days. 2.Not transferable to others.3.Terms and Conditions are Applied.";
    

}

- (IBAction)MakePaymentBtn:(id)sender
{
    
    error = @"";
    NSString *emailString = friendEmailAddress.text;
    NSString *cellNumString = friendCell.text;
    
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
    NSString *str=@"[0-9][0-9]{9}";
    NSPredicate *number=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    
    if ([friendName.text isEqualToString:@""]) {
        error = [NSString stringWithFormat:@"Enter First Name"];
        [friendName becomeFirstResponder];
    }
    else if ([lastNameField.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter Last Name"];
        [lastNameField becomeFirstResponder];
    }
    else if ([addressField.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter Address"];
        [addressField becomeFirstResponder];
    }
    else if ([cityField.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter City Name"];
        [cityField becomeFirstResponder];
    }
    else if ([postalCode.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter the Postal Cord"];
        [postalCode becomeFirstResponder];
    }
    else if ([stateOrRegion.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter State or Region"];
        [stateOrRegion becomeFirstResponder];
    }
    else if ([countryField.text isEqualToString:@""])
    {
        error = [NSString stringWithFormat:@"Enter Country Name"];
        [countryField becomeFirstResponder];
    }
    
   else  if ([friendEmailAddress.text isEqualToString:@""]) {
        error = [NSString stringWithFormat:@"Enter Email Address"];
        [friendEmailAddress becomeFirstResponder];
    }
   else if([friendCell.text isEqualToString:@""])
   {
       error = [NSString stringWithFormat:@"Enter the Mobile Number Currectly"];
       [friendCell becomeFirstResponder];
   }
    else if ([friendName.text length] < 3)
    {
        error = [NSString stringWithFormat:@"Friend Name must contail minimum 3 characters"];
        [friendName becomeFirstResponder];
    }
    else if ([lastNameField.text length] < 3)
    {
        error = [NSString stringWithFormat:@"last Must Contain Minimun 3 Characters"];
        [lastNameField becomeFirstResponder];
    }
    else if ([addressField.text length] < 1)
    {
        error = [NSString stringWithFormat:@"Enter Address Properly"];
        [addressField becomeFirstResponder];
    }
    else if ([cityField.text length] < 5)
    {
        error = [NSString stringWithFormat:@"City Name must be more than 5 characters"];
        [cityField becomeFirstResponder];
    }
    else if ([postalCode.text length] < 5)
    {
        error = [NSString stringWithFormat:@"Postal Code must be 5 Numbers"];
        [postalCode becomeFirstResponder];
    }
    else if ([stateOrRegion.text length] < 4)
    {
        error = [NSString stringWithFormat:@"State Or Region  must be 4 Numbers"];
        [stateOrRegion becomeFirstResponder];
    }
    else if ([countryField.text length] < 5)
    {
        error = [NSString stringWithFormat:@"Country Field must be 5 Characters"];
        [countryField becomeFirstResponder];
    }

    else if ([emailTest evaluateWithObject:emailString] != YES)
    {
        error = [NSString stringWithFormat:@"Invalid Email"];
        [friendEmailAddress becomeFirstResponder];
    }
    else if ([number evaluateWithObject:cellNumString] != YES)
    {
        error = [NSString stringWithFormat:@"Invalid Number"];
        [friendCell becomeFirstResponder];
    }
    else if ([friendCell.text length] < 10)
    {
        error = [NSString stringWithFormat:@"Mobile Number should Contain 10 num's"];
        [friendCell becomeFirstResponder];
    }
    
//    else if([[friendEmailAddress text] isEqualToString:@""] || [[friendCell text] isEqualToString:@""] )
//    {
//        [self alertStatus:@"Check Email & Mobile Number Correctly" :@"Details are Not Corect"];
//        return;
//    }
    if(![error isEqualToString: @""])
    {
        UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Oops!" message:error
                                                        delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [prompt show];
        
    }
    // Sending the data to the Server Database To pass the Username nad Pasword

    else
    {
        
        if (!checked) {
           
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Ckeck Terms and Conditions" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];


        }
        if (checked) {
              [self performSegueWithIdentifier:@"Payment" sender:self];
        }
        
    }

   
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"Payment"])
    {
        NSMutableDictionary *getFriendAndProductDetails = [[NSMutableDictionary alloc]init];
       
        
      getFriendAndProductDetails =  [self friendsDetailsDict];
        
     
        
        PayViewController *detailViewController =[segue destinationViewController];
        
        detailViewController.detailDict =  getFriendAndProductDetails;
               
    }
}

-(NSMutableDictionary*)friendsDetailsDict
{
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                        self.firstName.text, @"firstName",
                        self.lastNameField.text, @"lastName",
                        self.addressField.text,@"address",
                        self.cityField.text,@"city",
                        self.postalCode.text,@"postalCode",
                        self.stateOrRegion.text,@"state",
                        self.countryField.text,@"country",
                        self.friendEmailAddress.text,@"email",
                        self.friendCell.text,@"mobile",
                        [giftDetailsSendToDB objectForKey:@"GiftCardPrice"],@"GiftCardPriceDetails",
                        [giftDetailsSendToDB objectForKey:@"GiftCardName"], @"GiftCardNameDetails",
                                 
                        [giftDetailsSendToDB objectForKey:@"GiftCardId"], @"GiftCardIdDetails",[loginId objectForKey:@"customerId"],@"LoginDetails",nil];
    NSLog(@"data in Dict info is %@",info);
    return info;
}
-(IBAction)Zoomme:(UIPinchGestureRecognizer*)reconginzer
{
    reconginzer.view.transform = CGAffineTransformScale(reconginzer.view.transform, reconginzer.scale, reconginzer.scale);
    reconginzer.scale = 1;
}

- (IBAction)checkButton:(id)sender {
    
    if (!checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        checked = YES;
    }
    
    else if (checked) {
        [checkBoxButton setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        checked = NO;
    }

}
@end
