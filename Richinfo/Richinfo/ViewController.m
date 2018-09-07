//
//  ViewController.m
//  Richinfo
//
//  Created by LL on 2018/9/7.
//  Copyright © 2018年 彩讯科技股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "CXProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40.0, 80.0, 200.0, 12.0)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    CXProgressView *progressV1 = [[CXProgressView alloc] initWithFrame:CGRectMake(40.0, 100.0, 200.0, 12.0)];
    progressV1.progress = 0.5;
    [self.view addSubview:progressV1];
    
    CXProgressView *progressV2 = [[CXProgressView alloc] initWithFrame:CGRectMake(40.0, 120.0, 200.0, 32.0)];
    progressV2.progress = 0.5;
    progressV2.progressColor = [UIColor yellowColor];
    [self.view addSubview:progressV2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
