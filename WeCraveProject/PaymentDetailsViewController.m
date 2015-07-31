//
//  PaymentDetailsViewController.m
//  WeCraveProject
//
//  Created by hari on 23/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "PaymentDetailsViewController.h"

@interface PaymentDetailsViewController ()

@end

@implementation PaymentDetailsViewController
@synthesize cardNamelabel,cardTypes,cardNums,cardColors;

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
    cardTypePicker.hidden = YES;
    cardNamelabel.enabled = NO;
    
   self.cardTypes=[[NSArray alloc] initWithObjects:@"Visa",@"MasterCard",@"AmericanExpress",@"Discover", nil];
    cardNums =  @[@"1", @"2", @"3", @"4"];
    cardColors = @[@"a", @"b", @"c", @"d"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 3;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return [cardTypes count];
    }
    if (component == 1) {
        return [cardNums count];
    }
    else
        return [cardColors count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0) {
        return [cardTypes objectAtIndex:row];
    }
    if (component == 1) {
        return [cardNums objectAtIndex:row];
    }
    return [cardColors objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
//   
//   // cardNamelabel.text = cardTypes[row][component];
//    if (component == 0) {
//        
//        NSLog(@"%@",cardTypes[row][0]);
//     
//    }
//    if (component ==1) {
//        NSLog(@"%@",cardTypes[row][1]);
//    }
//    
//    if (component ==2) {
//        NSLog(@"%@",cardTypes[row][2]);
//    }
//    if (component ==3) {
//        NSLog(@"%@",cardTypes[row][3]);
//    }
//
////    NSLog(@"%@",cardTypes[1][2]);
////    NSLog(@"%@",cardTypes[1][component]);
////    NSLog(@"%@",cardTypes[1][component]);
//    cardTypePicker.hidden = NO;
    if (component == 0)
    {
         NSLog(@"%@",[cardTypes objectAtIndex:row]);
    }
    
    if (component == 1)
    {
           NSLog(@"%@",[cardNums objectAtIndex:row]);
    }
     if (component == 2)
     {
         NSLog(@"%@",[cardColors objectAtIndex:row]);
     }
    cardTypePicker.hidden = NO;

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


- (IBAction)buttonToDisplayPicker:(id)sender {
    cardTypePicker.hidden = NO;
}
@end
