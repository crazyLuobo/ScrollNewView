//
//  CustomTableViewCell.m
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/10.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "CustomTableViewCell.h"
#import <Masonry/Masonry.h>
@interface CustomTableViewCell()

@end


@implementation CustomTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super  initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutCustomTableViewCell];
    }
    return self;
}

- (void)layoutCustomTableViewCell
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
        _titleLabel.text = @"dsfdsfjk";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLabel;
}


@end
