//
//  ViewController.m
//  ZJLeakCheckTool
//
//  Created by 志杰 on 2021/4/24.
//  Copyright © 2021 志杰. All rights reserved.
//

#import "ViewController.h"
#import "ZJViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 300, self.view.frame.size.width - 80, 40)];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClickAction{
    ZJViewController *vc = [[ZJViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
