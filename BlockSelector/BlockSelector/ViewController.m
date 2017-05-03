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
    
    // button
    [self.btn addTarget:self action:[self selectorBlock:^(ViewController *weakSelf, id arg) {
        NSLog(@"clicked %@", arg);
        // break retain cycle
        weakSelf.view.backgroundColor = [UIColor lightGrayColor];
    }] forControlEvents:UIControlEventTouchUpInside];

    // gesture
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:[self selectorBlock:^(id weakSelf, id arg) {
        NSLog(@"tap %@", arg);
    }]];
    [self.label addGestureRecognizer:tap];

    // timer
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:[self selectorBlock:^(id weakSelf, id arg) {
        NSLog(@"timer run %@", arg);
    }] userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    // notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:[self selectorBlock:^(id weakSelf, id arg) {
        NSLog(@"resign active %@", arg);
    }] name:UIApplicationWillResignActiveNotification object:nil];
}

@end
