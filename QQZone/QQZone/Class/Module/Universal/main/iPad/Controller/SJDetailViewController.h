//
//  SJDetailViewController.h
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SJMenuItem;
@interface SJDetailViewController : UIViewController

/**
 *  按钮点击后切换详情控制器的内容控制器
 *
 *  @param item <#item description#>
 */
- (void)setupContentViewWithMenuItem:(SJMenuItem *)item;

@end
