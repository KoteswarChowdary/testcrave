//
//  FriendDetailsViewController.h
//  WeCraveProject
//
//  Created by hari on 28/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailsViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    BOOL checked;
    NSString *error;
    NSMutableDictionary *dict;

}
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UITextField *friendName;
@property (strong, nonatomic) IBOutlet UITextField *friendEmailAddress;
@property (strong, nonatomic) IBOutlet UITextField *friendCell;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGester;
@property (strong, nonatomic) IBOutlet UITextView *ConditionsView;
@property (strong, nonatomic) IBOutlet UIView *successView;
@property (strong, nonatomic) IBOutlet UILabel *termsConditionsLabel;

@property (nonatomic, retain) id productPrice;
//-------------Fields to DB----------------

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UITextField *cityField;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UITextField *stateOrRegion;
@property (strong, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;


- (IBAction)conditionButton:(id)sender;
- (IBAction)MakePaymentBtn:(id)sender;
-(IBAction)Zoomme:(UIPinchGestureRecognizer*)reconginzer;
//***************Check Box *****************
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
- (IBAction)checkButton:(id)sender;

@end

