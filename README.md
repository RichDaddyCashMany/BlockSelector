# BlockSelector
This is a `category` for replacing `@selector()` with `block`.


## Usage

```objc
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
```
