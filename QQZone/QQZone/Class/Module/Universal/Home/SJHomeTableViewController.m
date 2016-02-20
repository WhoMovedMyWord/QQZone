//
//  SJHomeTableViewController.m
//  QQZone
//
//  Created by app;e on 16/2/18.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJHomeTableViewController.h"

@interface SJHomeTableViewController ()

@end

@implementation SJHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
/**
 *  提供segment的items
 *
 *  @return <#return value description#>
 */
- (NSArray *)itemsForBaseSegmentedControl{
    return @[@"全部",@"特别关心",@"好友动态",@"认证空间"];
}
/**
 *  segment点击的处理方法
 */
- (void)segmentedControllerDidSelected:(UISegmentedControl *)seg{
    NSLog(@"%s--%s",__FILE__,__func__);
}

@end
