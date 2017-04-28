//
//  ViewController.m
//  BlockSelector
//
//  Created by HJaycee on 2017/4/28.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+BlockSEL.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 所有需要传SEL参数的地方都可以用[self action:^{}]来代替
    
    // 按钮点击
    [self.btn addTarget:self action:[self action:^{
        NSLog(@"btn clicked");
    }] forControlEvents:UIControlEventTouchUpInside];
    
    // 手势事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:[self action:^{
        NSLog(@"tap");
    }]];
    [self.label addGestureRecognizer:tap];

    // 定时器事件
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:[self action:^{
        NSLog(@"timer run");
    }] userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

@end
