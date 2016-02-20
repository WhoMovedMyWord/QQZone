//
//  SJMainTableViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMainTableViewController.h"
#import "SJAboultMeTableViewController.h"
#import "SJMoodViewController.h"
#import "SJHomeTableViewController.h"
#import "SJMoreTableViewController.h"
#import "SJZoneTableViewController.h"

#define kTabBarItemCount 5
#define kAddButtonOffSet 2

@interface SJMainTableViewController ()
@property(nonatomic,strong) UIButton *addButton;
@end

@implementation SJMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewControlls];
    //当在viewDidLoad添加加号按钮的时候,加号按钮在tabBarButton下面,这样加号按钮的点击事件无法响应
//    [self setupAddButton];
}

- (void)viewWillLayoutSubviews{
    [self setupAddButton];
}

- (void)setupAddButton{
    //将加号按钮添加到tabBar上
    [self.tabBar addSubview:self.addButton];
    
    //布局加号按钮
    CGFloat h = self.tabBar.frame.size.height;
    CGFloat w = self.tabBar.frame.size.width / kTabBarItemCount;
    //如果设置w的时候加号按钮的宽度没办法盖住空白tabBarButton的位置.在2个tabBarItem直接的空隙还是能响应到所以需要把w加大一点.
    //    self.addButton.frame = CGRectMake(w*2, 0, w, h);
    self.addButton.frame = CGRectMake(w*2-kAddButtonOffSet, 0, w+2*kAddButtonOffSet, h);
}

/**
 *  添加子控件
 */
- (void)setupChildViewControlls{
    //动态
    SJHomeTableViewController *homeVC = [[SJHomeTableViewController alloc] init];
    [self addChildViewController:homeVC withTitle:@"动态" withImgName:@"tabbar_icon_auth"];
    
    //与我相关
    SJAboultMeTableViewController *aboultMeVC = [[SJAboultMeTableViewController alloc] init];
    [self addChildViewController:aboultMeVC withTitle:@"与我相关" withImgName:@"tabbar_icon_at"];
    
    //添加一个空白占位按钮
    [self addChildViewController:[[UIViewController alloc] init]];
    
    //我的空间
    SJZoneTableViewController *zoneVC = [[SJZoneTableViewController alloc] init];
    [self addChildViewController:zoneVC withTitle:@"我的空间" withImgName:@"tabbar_icon_space"];
    
    //更多
    SJMoreTableViewController *moreVC = [[SJMoreTableViewController alloc] init];
    [self addChildViewController:moreVC withTitle:@"更多" withImgName:@"tabbar_icon_more"];
}

- (void)addChildViewController:(UIViewController *)vc withTitle:(NSString *)title withImgName:(NSString *)imgName{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    NSString *selImgName = [NSString stringWithFormat:@"%@_click",imgName];
    //tabBar图片
    nav.tabBarItem.image = [UIImage imageNamed:imgName];
    //tabBar选中图片
    UIImage *selImg = [[UIImage imageNamed:selImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = selImg;
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateHighlighted];
    //只是设置tabBar的标题
    //    nav.tabBarItem.title = title;
    //设置tabBar与当前控制器的标题
    vc.title = title;
    [self addChildViewController:nav];

}

/**
 *  加号点击事件
 */
- (void)addBtnClick{
    SJMoodViewController *moodVC = [[SJMoodViewController alloc] init];
    moodVC.title = @"写说说";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:moodVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 懒加载
- (UIButton *)addButton{
    
    if (_addButton == nil) {
        _addButton = [[UIButton alloc] init];
        [_addButton setImage:[UIImage imageNamed:@"tabbar_btn"] forState:UIControlStateNormal];
        //填充模式
        _addButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_addButton addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addButton;
}


@end
