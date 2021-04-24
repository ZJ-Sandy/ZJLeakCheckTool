//
//  UINavigationController+ZJLeak.m
//  ZJLeakCheckTool
//
//  Created by 志杰 on 2021/4/24.
//  Copyright © 2021 志杰. All rights reserved.
//

#import "UINavigationController+ZJLeak.h"
#import "NSObject+ZJLeak.h"
extern const void* const ZJHasBeenPoppedKey;

@implementation UINavigationController (ZJLeak)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self zj_hookOrigInstanceMenthod:@selector(popViewControllerAnimated:) newInstanceMenthod:@selector(zj_popViewControllerAnimated:)];
        [self zj_hookOrigInstanceMenthod:@selector(presentViewController:animated:completio:) newInstanceMenthod:@selector(zj_presentViewController:animated:completion:)];
    });
}

- (UIViewController *)zj_popViewControllerAnimated:(BOOL)animated{
    /**
     * 当视图POP出去后，记录为YES
     */
    UIViewController *popVC = [self zj_popViewControllerAnimated:animated];
    objc_setAssociatedObject(popVC, ZJHasBeenPoppedKey, @(YES), OBJC_ASSOCIATION_RETAIN);
    return popVC;
}

- (void)zj_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    /**
     * 当视图POP出去后，记录为YES
     */
    objc_setAssociatedObject(viewControllerToPresent, ZJHasBeenPoppedKey, @(YES), OBJC_ASSOCIATION_RETAIN);
}


@end
