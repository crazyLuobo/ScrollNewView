//
//  ScrollNewView.m
//  ScrollNewShow
//
//  Created by iOS002 on 2019/9/9.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "ScrollNewView.h"
#import <Masonry/Masonry.h>
#import "ScrollViewNewsTableViewCell.h"
#import "WeakTimer.h"

@interface ScrollNewView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView  *contentTableView;
@property (nonatomic, strong) WeakTimer *timer;
@property (nonatomic, strong) ScrollNewConfig *config;

@end
@implementation ScrollNewView



- (instancetype)initWithFrame:(CGRect)frame WithConfig:(ScrollNewConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        self.config = config;
        [self layoutScrollNewView];
        self.timer = [WeakTimer scheduledTimerWithTimeInterval:self.config.interval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    }
    return self;
}

- (instancetype)initWithConfig:(ScrollNewConfig *)config
{
    self = [super init];
    if (self) {
         self.config = config;
        [self layoutScrollNewView];
       self.timer = [WeakTimer scheduledTimerWithTimeInterval:self.config.interval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    }
    return self;
}
#pragma mark - 布局
- (void)layoutScrollNewView
{
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    [self addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

#pragma mark - 页面滑动
- (void)nextPage
{
    CGFloat contentOffsetY = self.contentTableView.contentOffset.y + self.config.cellHeight;
    //scroll over top
    if (contentOffsetY < 0.0) {
        contentOffsetY = self.contentTableView.contentSize.height / self.config.showTitleArray.count;
        [self.contentTableView setContentOffset:CGPointMake(0, contentOffsetY) animated:YES];
    }
    //scroll over bottom
    else if (contentOffsetY >= (self.contentTableView.contentSize.height - self.bounds.size.height)) {
        contentOffsetY = self.contentTableView.contentSize.height / self.config.showTitleArray.count - self.bounds.size.height;
         [self.contentTableView setContentOffset:CGPointMake(0, contentOffsetY) animated:NO];
    }else{
    
    [self.contentTableView setContentOffset:CGPointMake(0, contentOffsetY) animated:YES];
    }
}


#pragma mark - getter and setter
- (UITableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
        _contentTableView.pagingEnabled = YES;
        _contentTableView.scrollEnabled = NO;
        _contentTableView.backgroundColor = [UIColor grayColor];
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_contentTableView registerClass:NSClassFromString(self.config.registCellClassString) forCellReuseIdentifier:self.config.registCellClassString];
    }
    return _contentTableView;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
      NSInteger index = indexPath.row % self.config.showTitleArray.count;
    // 如果是使用的默认的样式，不需要调用block进行赋值
    if ([self.config.registCellClassString isEqualToString:NSStringFromClass([ScrollViewNewsTableViewCell class])]) {
        ScrollViewNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.config.registCellClassString forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.config.showTitleArray[index]];
        cell.backgroundColor = self.config.cellBackColor;
        return cell;
        
    }else{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.config.registCellClassString forIndexPath:indexPath];
    if (self.addDataBlock) {
        self.addDataBlock(cell, index);
    }
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.config.showTitleArray.count*10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.config.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSInteger index = indexPath.row % self.config.showTitleArray.count;
    if (self.didSelectBlock) {
        self.didSelectBlock(index);
    }
}


@end
