//
//  SJSplitViewController.h
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJSplitViewController : UISplitViewController
/**
 *  该方法在appdelegate中当屏幕发送改变的时候就会调用
 *  设置spliteVC的屏幕的宽度,
 *
 *  @param orientation <#orientation description#>
 */
- (void)setupPrimaryColumnWidthWithOrientation:(UIInterfaceOrientation)orientation;

@end
