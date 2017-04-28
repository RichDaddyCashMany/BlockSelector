//
//  NSObject+BlockSEL.h
//
//
//  Created by HJaycee on 2017/4/28.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

/*
 这个分类作用是用`block`来代替`@selector`，但是注意没有target和sender。
 使用示范：
 [self.btn1 addTarget:self action:[self action:^{
    NSLog(@"1");
 }] forControlEvents:UIControlEventTouchUpInside];
 */

#import <Foundation/Foundation.h>

@interface NSObject (BlockSEL)

- (SEL)action:(void (^)(void))action;

@end
