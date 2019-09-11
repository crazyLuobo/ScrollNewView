//
//  ScrollNewConfig.h
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/10.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ScrollNewConfig : NSObject
@property (nonatomic, copy) NSString *registCellClassString;// 滑动注册的tableViewCell
@property (nonatomic, strong) NSArray *showTitleArray;// 将要展示的数据数组
@property (nonatomic, assign) CGFloat cellHeight;// default 100
@property (nonatomic, strong) UIColor *cellBackColor; // cell展示的背景颜色
@property (nonatomic, assign) NSTimeInterval interval;// 间隔时间 默认2s


@end

NS_ASSUME_NONNULL_END
