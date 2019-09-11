//
//  ScrollViewNewsTableViewCell.m
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/9.
//  Copyright © 2019 iOS002. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "ScrollViewNewsTableViewCell.h"
@interface ScrollViewNewsTableViewCell()
//@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ScrollViewNewsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super  initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutScrollViewNewsTableViewCell];
    }
    return self;
}

- (void)layoutScrollViewNewsTableViewCell
{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
    }];
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLabel;
}



@end
