//
//  ScrollNewView.h
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/9.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollNewConfig.h"
NS_ASSUME_NONNULL_BEGIN


typedef void(^CellAddDataBlock)(UITableViewCell *cell,NSInteger index);
typedef void(^CellDidSelectBlock)(NSInteger selectIndex);
@interface ScrollNewView : UIView
@property (nonatomic, copy) CellAddDataBlock addDataBlock;
@property (nonatomic, copy) CellDidSelectBlock didSelectBlock;

// 创建方法，需要通过config进行配置选项
- (instancetype)initWithConfig:(ScrollNewConfig *)config;
- (instancetype)initWithFrame:(CGRect)frame WithConfig:(ScrollNewConfig *)config;

@end

NS_ASSUME_NONNULL_END
