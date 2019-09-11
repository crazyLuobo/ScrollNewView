//
//  WeakTimer.h
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/9.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakTimer : NSObject
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *tempTimer;
@property (nonatomic, weak) id tempTarget;
+ (WeakTimer * _Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)tempTarget selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
