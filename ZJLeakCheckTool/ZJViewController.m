//
//  ZJViewController.m
//  ZJLeakCheckTool
//
//  Created by 志杰 on 2021/4/24.
//  Copyright © 2021 志杰. All rights reserved.
//

#import "ZJViewController.h"

typedef void (^ZJBlock)(void);
@interface ZJViewController ()

@property (nonatomic,copy) ZJBlock block;
@property (nonatomic,strong) NSString *name;

@end

@implementation ZJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZJViewController";
    
    self.view.backgroundColor = [UIColor grayColor];
    /**
     * 内存泄漏检测原理
     * 1，页面出现的时候，监听做标记
     * 2，页面消失的时候，监听做标记，相应
     * 3，监听控制器的 dealloc 函数
     * 4，runtime交换 实现自己 ZJDealloc
     *
     **/
    
    self.name = @"ZJSandy";
    self.block = ^{
        NSLog(@"%@",self.name);
    };
    
    
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 300, self.view.frame.size.width - 80, 40)];
        [btn setTitle:@"pop" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(btnClickAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    
}

- (void)btnClickAction{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
