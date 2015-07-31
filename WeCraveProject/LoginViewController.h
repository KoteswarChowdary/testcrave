//
//  LoginViewController.h
//  WeCraveProject
//
//  Created by hari on 21/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    NSString *error;
}

- (IBAction)signInBtn:(id)sender;
- (IBAction)signUp:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *email;


@property (strong, nonatomic) IBOutlet UITextField *Passwd;
- (void) alertStatus:(NSString *)msg :(NSString *)title;
@property (strong, nonatomic) IBOutlet UIImageView *backImage;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *topView;

@end
