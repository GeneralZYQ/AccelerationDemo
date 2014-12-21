//
//  ViewController.m
//  AccelerationDemo
//
//  Created by 张元清 on 14/12/20.
//  Copyright (c) 2014年 张元清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) KMRoundAccelerationView *accelerationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.accelerationView = [[KMRoundAccelerationView alloc] initWithFrame:CGRectMake(10, 40, 300, 300)];
    [self.view addSubview:self.accelerationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startButtonPressed:(id)sender {
    
    [self.accelerationView moveFromPercent:0 toPercent:55 withAcceleration:20];
}

@end
