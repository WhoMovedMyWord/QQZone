//
//  SJMenuViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuViewController.h"
#import "SJMainTableViewController.h"
@interface SJMenuViewController ()
//容器视图,显示的是iphone的tabBar界面,只有当spliteVC的宽度是紧凑的时候才显示
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation SJMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupContainerView];
}

- (void)setupContainerView{
    //1.创建iPhone的tabBarVC
    SJMainTableViewController *tabBarVC = [[SJMainTableViewController alloc] init];
    //2.将tabBarVC.view赋值给container
    self.container = tabBarVC.view;
    
    // 如果一个控制器的view成为另外一个控制器的子view时,最好将控制器也成为另一个控制器的子控制器
    // 3.将tabBarVC作为self的子控制器,当屏幕旋转或modal的时候才不会出现问题
    [self.view addSubview:tabBarVC.view];
    [self addChildViewController:tabBarVC];
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
