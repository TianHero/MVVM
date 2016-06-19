//
//  ViewController.m
//  MVVM
//
//  Created by 赵天 on 16/6/18.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import "ZTViewController.h"
#import "MVCViewController.h"
#import "MVVMViewController.h"
#define btnW ([UIScreen mainScreen].bounds.size.width - 200.f)
@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *MVCbtn = [[UIButton alloc] initWithFrame:CGRectMake(100.f, 100.f, btnW, 60.f)];
    [MVCbtn setTitle:@"MVC" forState:UIControlStateNormal];
    
    MVCbtn.backgroundColor = [UIColor greenColor];
    [MVCbtn addTarget:self action:@selector(MVCController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MVCbtn];
    
    UIButton *MVVMCbtn = [[UIButton alloc] initWithFrame:CGRectMake(100.f, 200.f, btnW, 60.f)];
    [MVVMCbtn setTitle:@"MVVM" forState:UIControlStateNormal];
    
    MVVMCbtn.backgroundColor = [UIColor blueColor];
    [MVVMCbtn addTarget:self action:@selector(MVVMCController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MVVMCbtn];
    
}
- (void)MVCController{
    MVCViewController *targetVC = [[MVCViewController alloc] init];
    [self.navigationController pushViewController:targetVC animated:YES];
    
}
- (void)MVVMCController{
    MVVMViewController *targetVC = [[MVVMViewController alloc] init];
    [self.navigationController pushViewController:targetVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
