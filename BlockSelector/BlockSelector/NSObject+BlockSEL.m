//
//  NSObject+BlockSEL.m
//  
//
//  Created by HJaycee on 2017/4/28.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "NSObject+BlockSEL.h"
#import <objc/runtime.h>

@implementation NSObject (Action)

- (SEL)action:(void (^)(void))action {
    NSString *selName = [NSString stringWithFormat:@"action%p", action];
    SEL sel = NSSelectorFromString(selName);
    class_addMethod([self class], sel, (IMP)selectorImp, "v@:");
    objc_setAssociatedObject(self, sel, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return sel;
}

void selectorImp(id self, SEL _cmd) {
    void (^action)(void) = objc_getAssociatedObject(self, _cmd);
    if (action) action();
}

@end
