//
//  UIViewController+ZJLeak.m
//  ZJLeakCheckTool
//
//  Created by 志杰 on 2021/4/24.
//  Copyright © 2021 志杰. All rights reserved.
//

#import "UIViewController+ZJLeak.h"
#import "NSObject+ZJLeak.h"

@implementation UIViewController (ZJLeak)
const void *const ZJHasBeenPoppedKey = &ZJHasBeenPoppedKey;


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self zj_hookOrigInstanceMenthod:@selector(viewWillAppear:) newInstanceMenthod:@selector(zj_viewWillAppear:)];
        [self zj_hookOrigInstanceMenthod:@selector(viewDidDisappear:) newInstanceMenthod:@selector(zj_viewDidDisappear:)];
    });
}

- (void)zj_viewWillAppear:(BOOL)animated {
    [self zj_viewWillAppear:animated];
    
    /**
     * 添加关联对象，记录VC是否进来
     * 进来了设为 NO
     */
    objc_setAssociatedObject(self,ZJHasBeenPoppedKey,@(NO),OBJC_ASSOCIATION_RETAIN);
}

- (void)zj_viewDidDisappear:(BOOL)animated{
    [self zj_viewDidDisappear:animated];
    /**
     * 获取关联对象，查看记录是否POP出去
     * 调用zj_Dealloc函数
     */
    
    if ([objc_getAssociatedObject(self, ZJHasBeenPoppedKey) boolValue]) {
        [self zj_Dealloc];
    }
}

@end
