//
//  SJSplitViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJSplitViewController.h"

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

@end
