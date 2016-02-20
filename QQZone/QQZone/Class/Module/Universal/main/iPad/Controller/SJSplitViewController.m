//
//  SJSplitViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJSplitViewController.h"
#import "SJMenuViewController.h"
#import "SJDetailViewController.h"

@interface SJSplitViewController ()

@end

@implementation SJSplitViewController

//spliteVC的初始化方法
- (instancetype)init{
    if (self = [super init]) {
        SJMenuViewController *menuVC = [[SJMenuViewController alloc] init];
        //设置master控制器
        [self addChildViewController:menuVC];
        
        //详情控制器
        SJDetailViewController *detailVC = [[SJDetailViewController alloc] init];

        [self addChildViewController:detailVC];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CommandBGColor;
    [self prepareSplitVC];
}

- (void)prepareSplitVC{
    
    //1.设置master 与 deatal 的显示样式
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    //2.设置masterVC的宽度
    [self setupPrimaryColumnWidthWithOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

/**
 *  屏幕发送改变的时候会调用,来设置masterVC的宽度
 *
 *  @param orientation <#orientation description#>
 */
- (void)setupPrimaryColumnWidthWithOrientation:(UIInterfaceOrientation)orientation{
    //判断是否是横屏
    BOOL isLandSpace = UIInterfaceOrientationIsLandscape(orientation);
    
    if (isLandSpace) {//横屏
        self.maximumPrimaryColumnWidth = 280;
    }else{//竖屏
        self.maximumPrimaryColumnWidth = 60;
    }
    
    //拿到menuVC,调用更新materVC子控件的布局
    SJMenuViewController *menuVC = self.childViewControllers[0];
    //判断
    if(![menuVC isKindOfClass:[SJMenuViewController class]]){
        return;
    }
    [menuVC updateSubViews:isLandSpace];
}

/** 在多任务的时候,拖动屏幕改变屏幕的宽度的时候会调用该方法
 *  当splitVC的sizeClass改变的时候会调用
 *  UITraitCollection 与sizeClass相关的属性存放在该类中
 *  @param previousTraitCollection  之前的sizeClasses属性
 */
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
//    SJLog(@"%@",previousTraitCollection);
    //获取masterVC. spliteVC有2个控制器  第一个就是masterVC
    SJMenuViewController *menuVC = self.childViewControllers[0];
    //判断
    if(![menuVC isKindOfClass:[SJMenuViewController class]]){
        return;
    }
    //splitVC的当前sizeClasses
    UITraitCollection *currentCollection = self.traitCollection;
    //根据spliteVC的sizeClass 来决定mastervc的显示内容.
    BOOL isShow = currentCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact;
    //当宽松显示ipad.  紧显示iphone
    [menuVC showContainer:isShow];
}

@end
