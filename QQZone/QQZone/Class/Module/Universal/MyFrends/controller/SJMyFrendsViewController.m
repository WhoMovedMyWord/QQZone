//
//  SJMyFrendsViewController.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMyFrendsViewController.h"

@interface SJMyFrendsViewController ()

@end

@implementation SJMyFrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  提供segment的items
 *
 *  @return <#return value description#>
 */
- (NSArray *)itemsForBaseSegmentedControl{
    return @[@"我的好友",@"好友列表"];
}

/**
 *  segment点击的处理方法
 */
- (void)segmentedControllerDidSelected:(UISegmentedControl *)seg{
    NSLog(@"%s--%s",__FILE__,__func__);
}

@end
