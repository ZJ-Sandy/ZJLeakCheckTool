//
//  NSObject+ZJLeak.h
//  ZJLeakCheckTool
//
//  Created by 志杰 on 2021/4/24.
//  Copyright © 2021 志杰. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZJLeak)

- (void)zj_Dealloc;
+ (BOOL)zj_hookOrigInstanceMenthod:(SEL)oriSEL newInstanceMenthod:(SEL)swizzledSEL;
@end

NS_ASSUME_NONNULL_END
