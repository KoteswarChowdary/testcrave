//
//  PaymentDetailsViewController.h
//  WeCraveProject
//
//  Created by hari on 23/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentDetailsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    
    IBOutlet UIPickerView *cardTypePicker;
    NSArray *cardTypes;
    NSArray *cardNums;
    NSArray *cardColors;
    NSString *selectcard;
}

- (IBAction)buttonToDisplayPicker:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *cardNamelabel;
@property (nonatomic, retain) NSArray *cardTypes,*cardNums,*cardColors;



@end
