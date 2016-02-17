//
//  SJMenuViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuViewController.h"

@interface SJMenuViewController ()
//容器视图,显示的是iphone的界面,只有当spliteVC的宽度是紧凑的时候才显示
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation SJMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  容器视图是否显示
 *
 *  @param isShow <#isShow description#>
 */
- (void)showContainer:(BOOL)isShow{
    self.container.hidden = !isShow;
}
@end
