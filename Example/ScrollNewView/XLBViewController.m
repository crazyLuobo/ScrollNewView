//
//  XLBViewController.m
//  ScrollNewView
//
//  Created by yanwenbo_78201@163.com on 09/10/2019.
//  Copyright (c) 2019 yanwenbo_78201@163.com. All rights reserved.
//

#import "XLBViewController.h"
#import <ScrollNewView.h>
#import "CustomTableViewCell.h"
@interface XLBViewController ()
@property (nonatomic, strong) ScrollNewView *showScrollView;
@property (nonatomic, strong) ScrollNewView *customScrollView;

@end

@implementation XLBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.showScrollView];
    [self.view addSubview:self.customScrollView];
}

- (ScrollNewView *)showScrollView
{
    if (!_showScrollView) {
        
        ScrollNewConfig *config = [[ScrollNewConfig alloc] init];
        config.cellHeight = 50;
        config.showTitleArray = @[@"加油",@"收款福克斯",@"三十多岁所",@"毒贩夫妇付",@"大幅度付多多多多"];
        _showScrollView = [[ScrollNewView alloc] initWithFrame:CGRectMake(100, 100, 300, 200) WithConfig:config];
        _showScrollView.backgroundColor = [UIColor grayColor];
        
    }
    return _showScrollView;
}

- (ScrollNewView *)customScrollView
{
    if (!_customScrollView) {
        ScrollNewConfig *config = [[ScrollNewConfig alloc] init];
        config.registCellClassString = NSStringFromClass([CustomTableViewCell class]);
        config.cellHeight = 40;
        config.showTitleArray = @[@"加油",@"收款福克斯",@"三十多岁所",@"毒贩夫妇付",@"大幅度付多多多多"];
//        config.interval = 2.0;
        _customScrollView = [[ScrollNewView alloc] initWithFrame:CGRectMake(100, 350, 200, 160) WithConfig:config];
        _customScrollView.addDataBlock = ^(UITableViewCell * _Nonnull cell, NSInteger index) {
            CustomTableViewCell *showCell = (CustomTableViewCell *)cell;
            showCell.titleLabel.text = config.showTitleArray[index];
            showCell.backgroundColor = [UIColor blueColor];
        };
        
    }
    return _customScrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
