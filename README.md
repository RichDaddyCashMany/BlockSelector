# BlockSelector
This is a `category` for replacing `@selector()` with a `block`.


## Usage

```objc
// button
[self.btn addTarget:self action:[self selectorBlock:^(id arg) {
    NSLog(@"clicked %@", arg);
}] forControlEvents:UIControlEventTouchUpInside];
```
```objc
// gesture
UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:[self selectorBlock:^(id arg) {
    NSLog(@"tap %@", arg);
}]];
[self.label addGestureRecognizer:tap];
```
```objc
// timer
NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:[self selectorBlock:^(id arg) {
    NSLog(@"timer run %@", arg);
}] userInfo:nil repeats:NO];
[[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
```
```objc
// notification
[[NSNotificationCenter defaultCenter] addObserver:self selector:[self selectorBlock:^(id arg) {
    NSLog(@"resign active %@", arg);
}] name:UIApplicationWillResignActiveNotification object:nil];
```
