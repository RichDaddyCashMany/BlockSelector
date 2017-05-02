//
//  NSObject+BlockSEL.h
//
//
//  Created by HJaycee on 2017/4/28.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BlockSEL)

/**
 用`block`来代替`@selector()`

 @param block 回调的arg是事件自动传过来的对象，比如`NSNotification`。
 @return SEL
 */
- (SEL)selectorBlock:(void (^)(id arg))block;

@end
