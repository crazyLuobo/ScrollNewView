//
//  ScrollNewConfig.m
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/10.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ScrollNewConfig.h"
#import "ScrollViewNewsTableViewCell.h"
@interface ScrollNewConfig()

@end
@implementation ScrollNewConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.registCellClassString = NSStringFromClass([ScrollViewNewsTableViewCell class]);
        self.cellHeight = 100;
        self.cellBackColor = [UIColor grayColor];
        self.interval = 2;
    }
    return self;
}
@end
