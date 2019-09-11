//
//  WeakTimer.m
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/9.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "WeakTimer.h"

@implementation WeakTimer
+ (NSTimer * _Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)tempTarget selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats {
    WeakTimer *target = [[WeakTimer alloc] init];
    target.tempTarget = tempTarget;
    target.selector = selector;
    target.tempTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:target selector:@selector(timerSelector:) userInfo:userInfo repeats:repeats];
    return target.tempTimer;
}

- (void)timerSelector:(NSTimer *)tempTimer {
    if (self.tempTarget && [self.tempTarget respondsToSelector:self.selector]) {
        [self.tempTarget performSelector:self.selector withObject:tempTimer.userInfo];
    }else {
        [self.tempTimer invalidate];
    }
}


@end
