//
//  testViewController.h
//  WeCraveProject
//
//  Created by hari on 24/03/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface testViewController : UIViewController<UIScrollViewDelegate,MFMailComposeViewControllerDelegate>
{
    NSMutableArray *array;
    NSDictionary *dictionary;
    NSData *myData;
    NSArray *jsonArray;
}
@property (nonatomic, strong) NSString* (^blockAsVariable)(void);

@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property(nonatomic, retain)NSData *myData;
-(void)testBlockMethod;
-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler;
-(void)addSomeNumber:(int)num1 withNum2:(int)num2 andCompHandle:(void(^)(int result))comphandler;
@property (strong, nonatomic) IBOutlet UIButton *button;

- (IBAction)mailButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passWordField;
- (IBAction)Save:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ageField;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelData;
@property (nonatomic, copy)NSString *getStr;

@end
