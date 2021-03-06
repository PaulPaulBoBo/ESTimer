//
//  ViewController.m
//  ESTimer
//
//  Created by Paul on 2018/6/7.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"
#import "ESTimer.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *defaultTimerBackView;
@property (strong, nonatomic) IBOutlet UILabel *defaultTimerSecondLabel;
@property (strong, nonatomic) IBOutlet UIButton *defaultTimerStartBtn;

@property (strong, nonatomic) IBOutlet UIView *cadTimerBackView;
@property (strong, nonatomic) IBOutlet UILabel *cadTimerSecondLabel;
@property (strong, nonatomic) IBOutlet UIButton *cadTimerStartBtn;

@property (strong, nonatomic) IBOutlet UIView *gcdTimerBackView;
@property (strong, nonatomic) IBOutlet UILabel *gcdTimerSecondLabel;
@property (strong, nonatomic) IBOutlet UIButton *gcdTimerStartBtn;

@property (nonatomic, strong) ESTimer *timer_def;
@property (nonatomic, strong) ESTimer *timer_cad;
@property (nonatomic, strong) ESTimer *timer_gcd;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.defaultTimerBackView.clipsToBounds = YES;
    self.defaultTimerBackView.layer.cornerRadius = 5;
    self.defaultTimerStartBtn.clipsToBounds = YES;
    self.defaultTimerStartBtn.layer.cornerRadius = 5;
    self.defaultTimerStartBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.defaultTimerStartBtn.layer.borderWidth = 1.5;
    
    self.cadTimerBackView.clipsToBounds = YES;
    self.cadTimerBackView.layer.cornerRadius = 5;
    self.cadTimerStartBtn.clipsToBounds = YES;
    self.cadTimerStartBtn.layer.cornerRadius = 5;
    self.cadTimerStartBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.cadTimerStartBtn.layer.borderWidth = 1.5;
    
    self.gcdTimerBackView.clipsToBounds = YES;
    self.gcdTimerBackView.layer.cornerRadius = 5;
    self.gcdTimerStartBtn.clipsToBounds = YES;
    self.gcdTimerStartBtn.layer.cornerRadius = 5;
    self.gcdTimerStartBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.gcdTimerStartBtn.layer.borderWidth = 1.5;
}

- (IBAction)defaultTimerStartBtnAction:(UIButton *)sender
{
    if(!self.timer_def)
    {
        self.timer_def = [ESTimer new];
    }
    __weak typeof(self) weakSelf = self;
    if([sender.currentTitle isEqual:@"Start"])
    {
        [sender setTitle:@"Stop" forState:(UIControlStateNormal)];
        [self.timer_def startTimerWithTimerType:ESTimerTypeDefault startTimerBlock:^(CGFloat seconds) {
            weakSelf.defaultTimerSecondLabel.text = [NSString stringWithFormat:@"%.fs", seconds];
        }];
    }
    else
    {
        [sender setTitle:@"Start" forState:(UIControlStateNormal)];
        [self.timer_def stopTimerWithTimerType:ESTimerTypeDefault stopTimerBlock:^{
            weakSelf.defaultTimerSecondLabel.text = @"0";
        }];
    }
}

- (IBAction)cadTimerStartBtnAction:(UIButton *)sender
{
    if(!self.timer_cad)
    {
        self.timer_cad = [ESTimer new];
    }
    __weak typeof(self) weakSelf = self;
    if([sender.currentTitle isEqual:@"Start"])
    {
        [sender setTitle:@"Stop" forState:(UIControlStateNormal)];
        [self.timer_cad startTimerWithTimerType:ESTimerTypeCAD startTimerBlock:^(CGFloat seconds) {
            weakSelf.cadTimerSecondLabel.text = [NSString stringWithFormat:@"%.fs", seconds];
        }];
    }
    else
    {
        [sender setTitle:@"Start" forState:(UIControlStateNormal)];
        [self.timer_cad stopTimerWithTimerType:ESTimerTypeCAD stopTimerBlock:^{
            weakSelf.cadTimerSecondLabel.text = @"0";
        }];
    }
}

- (IBAction)gcdTimrStartBtnAction:(UIButton *)sender
{
    if(!self.timer_gcd)
    {
        self.timer_gcd = [ESTimer new];
    }
    __weak typeof(self) weakSelf = self;
    if([sender.currentTitle isEqual:@"Start"])
    {
        [sender setTitle:@"Stop" forState:(UIControlStateNormal)];
        [self.timer_gcd startTimerWithTimerType:ESTimerTypeGCD startTimerBlock:^(CGFloat seconds) {
            weakSelf.gcdTimerSecondLabel.text = [NSString stringWithFormat:@"%.fs", seconds];
        }];
    }
    else
    {
        [sender setTitle:@"Start" forState:(UIControlStateNormal)];
        [self.timer_gcd stopTimerWithTimerType:ESTimerTypeGCD stopTimerBlock:^{
            weakSelf.gcdTimerSecondLabel.text = @"0";
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
