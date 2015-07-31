//
//  FlipsideViewController.m
//  WeCraveProject
//
//  Created by hari on 28/05/14.
//  Copyright (c) 2014 Supreme-TechSolution. All rights reserved.
//

#import "FlipsideViewController.h"
#import "PayViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface FlipsideViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *environmentSegmentControl;
@property (strong, nonatomic) IBOutlet UISwitch *acceptCreditCardsSwitch;
@property (strong, nonatomic) IBOutlet UITextView *payPalResultTextView;
@property (strong, nonatomic) IBOutlet UILabel *payPalResultLabel;

@end

@implementation FlipsideViewController



- (void)awakeFromNib {
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)logEnvironment {
    NSLog(@"Environment: %@. Accept credit cards? %d", self.delegate.environment, self.delegate.acceptCreditCards);
}

- (void)viewWillAppear:(BOOL)animated {
    [self logEnvironment];
    
    int numberOfSegments = self.environmentSegmentControl.numberOfSegments;
    while (numberOfSegments--) {
        NSString *title = [self.environmentSegmentControl titleForSegmentAtIndex:numberOfSegments];
        if ([[title lowercaseString] isEqualToString:self.delegate.environment]) {
            self.environmentSegmentControl.selectedSegmentIndex = numberOfSegments;
            break;
        }
    }
    self.acceptCreditCardsSwitch.on = self.delegate.acceptCreditCards;
    
    if ([self.delegate resultText]) {
        NSLog(@"%@", [self.delegate resultText]);
        self.payPalResultTextView.text = [[self.delegate resultText] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    } else {
        self.payPalResultTextView.hidden = YES;
        self.payPalResultLabel.hidden = YES;
    }
    self.payPalResultTextView.layer.cornerRadius = 8.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)environmentControlDidUpdate:(id)sender {
    if (self.environmentSegmentControl == sender) {
        self.delegate.environment = [[self.environmentSegmentControl titleForSegmentAtIndex:self.environmentSegmentControl.selectedSegmentIndex] lowercaseString];
    }
    [self logEnvironment];
}

- (IBAction)processCreditCardsChanged:(id)sender {
    [self.delegate setAcceptCreditCards:self.acceptCreditCardsSwitch.on];
    [self logEnvironment];
}

- (IBAction)done:(id)sender {
    [self logEnvironment];
    [self.delegate flipsideViewControllerDidFinish:self];
}


@end
