//
//  SJSplitViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJSplitViewController.h"
#import "SJMenuViewController.h"

@interface SJSplitViewController ()

@end

@implementation SJSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareSplitVC];
}

- (void)prepareSplitVC{
    
    //1.设置master 与 deatal 的显示样式
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    //2.设置masterVC的宽度
    [self setupPrimaryColumnWidthWithOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (void)setupPrimaryColumnWidthWithOrientation:(UIInterfaceOrientation)orientation{
    //判断是否是横屏
    BOOL isLandSpace = UIInterfaceOrientationIsLandscape(orientation);
    
    if (isLandSpace) {
        self.maximumPrimaryColumnWidth = 280;
    }else{
        self.maximumPrimaryColumnWidth = 60;
    }

}

/**
 *  当splitVC的sizeClass改变的时候会调用
 *  UITraitCollection 与sizeClass相关的属性存放在该类中
 *  @param previousTraitCollection  之前的sizeClasses属性
 */
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    SJLog(@"%@",previousTraitCollection);
    //获取masterVC. spliteVC有2个控制器  第一个就是masterVC
    SJMenuViewController *menuVC = self.childViewControllers[0];
    //判断
    if(![menuVC isKindOfClass:[SJMenuViewController class]]){
        return;
    }
    //splitVC的当前sizeClasses
    UITraitCollection *currentCollection = self.traitCollection;
    BOOL isShow = currentCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact;
    [menuVC showContainer:isShow];
}

@end
