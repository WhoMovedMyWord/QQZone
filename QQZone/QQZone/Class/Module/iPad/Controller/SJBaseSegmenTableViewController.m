//
//  SJBaseSegmenTableViewController.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJBaseSegmenTableViewController.h"

@interface SJBaseSegmenTableViewController ()

@end

@implementation SJBaseSegmenTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSegumentedControl];
}
/**
 *  设置segment
 */
- (void)setupSegumentedControl{
    
    //如果子类没实现 返回items 直接返回
    if (![self respondsToSelector:@selector(itemsForBaseSegmentedControl)]) {
        return;
    }
    
    //self:谁调用就代表谁 可能是home 也可能是好友
    NSArray *items = [self itemsForBaseSegmentedControl];
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:items];
    seg.tintColor = CommandBGColor;
    //默认选中第一个,但是该方法不会触发按钮点击事件,需要手动调用
    seg.selectedSegmentIndex = 0;
    //手动调用
    [self baseSegmentedSelected:seg];
    [seg addTarget:self action:@selector(baseSegmentedSelected:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = seg;
}

/**
 *  segument被点击的触发方法
 *
 *  @param seg <#seg description#>
 */
- (void)baseSegmentedSelected:(UISegmentedControl *)seg{
    //判断子类是否有实现 对应子类segment 的 点击 处理事件
    if ([self respondsToSelector:@selector(segmentedControllerDidSelected:)]) {
        [self segmentedControllerDidSelected:seg];
    }
}
@end
