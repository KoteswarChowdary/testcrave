//
//  PayViewController.m
//  WeCraveProject
//
//  Created by hari on 28/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "PayViewController.h"
#import <QuartzCore/QuartzCore.h>
#define kPayPalEnvironment PayPalEnvironmentSandbox


@interface PayViewController ()

@property (strong, nonatomic) IBOutlet UIButton *buyGiftButton;
@property (strong, nonatomic) IBOutlet UIView *successView;
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;

@end

@implementation PayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"PayPal SDK ";
    
    
 // BackButton Code
    
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGroundimg.png"]]];
    
//  Home Button Code
    
    UIButton *btnNext1 =[[UIButton alloc] init];
    btnNext1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    [btnNext1 setBackgroundImage:[UIImage imageNamed:@"HomeImg.png"] forState:UIControlStateNormal];
    
    btnNext1.frame = CGRectMake(100, 100, 60, 45);
    UIBarButtonItem *btnNext =[[UIBarButtonItem alloc] initWithCustomView:btnNext1];
    [btnNext1 addTarget:self action:@selector(gotoHome) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = btnNext;
    
    
    // Set up payPalConfig
    _payPalConfig = [[PayPalConfiguration alloc] init];
    _payPalConfig.acceptCreditCards = YES;
    _payPalConfig.languageOrLocale = @"en";
    _payPalConfig.merchantName = @"Awesome Shirts, Inc.";
    _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
    
    // Setting the languageOrLocale property is optional.
    //
    // If you do not set languageOrLocale, then the PayPalPaymentViewController will present
    // its user interface according to the device's current language setting.
    //
    // Setting languageOrLocale to a particular language (e.g., @"es" for Spanish) or
    // locale (e.g., @"es_MX" for Mexican Spanish) forces the PayPalPaymentViewController
    // to use that language/locale.
    //
    // For full details, including a list of available languages and locales, see PayPalPaymentViewController.h.
    
    _payPalConfig.languageOrLocale = [NSLocale preferredLanguages][0];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.successView.hidden = YES;
    
    // use default environment, should be Production in real life
    self.environment = kPayPalEnvironment;
    
    NSLog(@"PayPal iOS SDK version: %@", [PayPalMobile libraryVersion]);
   
    // For getting the Product Price, Product Name and Login Id
 
    
    self.amountDisplayLabel.text = [NSString stringWithFormat:@"%@",[self.detailDict objectForKey:@"GiftCardPriceDetails"]];
     NSLog(@" self.amountDisplayLabel.text %@",  self.amountDisplayLabel.text);

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // Preconnect to PayPal early
    [PayPalMobile preconnectWithEnvironment:self.environment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) GoBack{
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)gotoHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Receive Single Payment

- (IBAction)payButton:(id)sender {
    NSLog(@"Paybutton Pressed");
    
    // Remove our last completed payment, just for demo purposes.
    self.resultText = nil;

    PayPalPayment *payment = [[PayPalPayment alloc] init];
    payment.amount = [[NSDecimalNumber alloc] initWithString:[self.detailDict objectForKey:@"GiftCardPriceDetails"]];
    NSLog(@" payment.amount %@", payment.amount);
    payment.currencyCode = @"USD";
    NSString *str = [NSString stringWithFormat:@"%@",[self.detailDict objectForKey:@"GiftCardNameDetails"]];
    payment.shortDescription = str;
    payment.items = nil;  // if not including multiple items, then leave payment.items as nil
    payment.paymentDetails = nil; // if not including payment details, then leave payment.paymentDetails as nil
   
    if (!payment.processable) {
        NSLog(@"Not processable");
        // This particular payment will always be processable. If, for
        // example, the amount was negative or the shortDescription was
        // empty, this payment wouldn't be processable, and you'd want
        // to handle that here.
    }
    
    // Update payPalConfig re accepting credit cards.
    NSLog(@" processable......");

    
    self.payPalConfig.acceptCreditCards = self.acceptCreditCards;
    
    PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                                                configuration:self.payPalConfig
                                                                                                     delegate:self];
    [self presentViewController:paymentViewController animated:YES completion:nil];

}

#pragma mark PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment {
    NSLog(@"PayPal Payment Success!");
    self.resultText = [completedPayment description];
    [self showSuccess];
    NSLog(@"after Success");

    
    [self sendCompletedPaymentToServer:completedPayment]; // Payment was processed successfully; send to server for verification and fulfillment
   
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    NSLog(@"PayPal Payment Canceled");
    self.resultText = nil;
    self.successView.hidden = YES;
    NSLog(@"cancel the payment");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Proof of payment validation

- (void)sendCompletedPaymentToServer:(PayPalPayment *)completedPayment {
    // TODO: Send completedPayment.confirmation to server
    NSLog(@"Here is your proof of payment:\n\n%@\n\nSend this to your server for confirmation and fulfillment.", completedPayment.confirmation);
    NSDictionary *dict = [completedPayment.confirmation objectForKey:@"response"];
     NSLog(@"data in dict is %@",dict);
   
    NSArray *array = @[self.detailDict,dict];
    
    NSString *str = [NSString stringWithFormat:@"FriendDetails=%@&paypalDetails=%@",array[0],array[1]];
    NSLog(@"total data to send to DB is %@",array);
    NSLog(@"%@",str);


}


#pragma mark PayPalFuturePaymentDelegate methods

- (void)payPalFuturePaymentViewController:(PayPalFuturePaymentViewController *)futurePaymentViewController didAuthorizeFuturePayment:(NSDictionary *)futurePaymentAuthorization {
    NSLog(@"PayPal Future Payment Authorization Success!");
    self.resultText = futurePaymentAuthorization[@"code"];
    [self showSuccess];
    
    [self sendAuthorizationToServer:futurePaymentAuthorization];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalFuturePaymentDidCancel:(PayPalFuturePaymentViewController *)futurePaymentViewController {
    NSLog(@"PayPal Future Payment Authorization Canceled");
    self.successView.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendAuthorizationToServer:(NSDictionary *)authorization {
    // TODO: Send authorization to server
    NSLog(@"Here is your authorization:\n\n%@\n\nSend this to your server to complete future payment setup.", authorization);
}


#pragma mark - Helpers

- (void)showSuccess {
    self.successView.hidden = NO;
    self.successView.alpha = 1.0f;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.5];
    [UIView setAnimationDelay:2.0];
    self.successView.alpha = 0.0f;
    [UIView commitAnimations];
    NSLog(@"sucess View");
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pushSettings"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender {
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}




@end
