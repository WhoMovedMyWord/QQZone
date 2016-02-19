//
//  SJMenuViewController.h
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJMenuViewController : UIViewController
/**
 *  容器视图是否显示
 *
 *  @param isShow <#isShow description#>
 */
- (void)showContainer:(BOOL)isShow;

/**
 *  当屏幕方向发生改变的时候,stackView的子控件布局需要改变
 *
 *  @param isLandscape 是否是横屏
 */
- (void)updateSubViews:(BOOL)isLandscape;
@end
