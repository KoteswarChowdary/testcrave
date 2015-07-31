//
//  RegisterViewController.h
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
{
    NSString *error;
    NSArray *responceData;
}
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UITextField *contactNum;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UIView *RegisterView;
@property (strong, nonatomic) IBOutlet UITextField *reTypePassword;
@property (strong, nonatomic) IBOutlet UIButton *CancelButton;
@property (strong, nonatomic) IBOutlet UIButton *SubmitButton;


- (void) alertStatus:(NSString *)msg :(NSString *)title;
- (IBAction)submitBtn:(id)sender;
- (IBAction)CancelButtonMethod:(id)sender;

@end
