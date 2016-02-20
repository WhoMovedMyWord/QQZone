//
//  SJBaseSegmenTableViewController.h
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJBaseSegmenTableViewControllerDelegate <NSObject>

//optional 父类可能不实现可能实现, 让子类自己去实现
@optional
//让子类实现,返回segment的items
- (NSArray *)itemsForBaseSegmentedControl;
//让子类实现,对应子类点击segment的时候让对应的子类去响应
- (void)segmentedControllerDidSelected:(UISegmentedControl *)seg;

@end

@interface SJBaseSegmenTableViewController : UITableViewController<SJBaseSegmenTableViewControllerDelegate>

/**
 *  定义在父类,子类必须要去实现,返回seguemnted需要的items.
 *  如果放在.h  但是父类.m不实现有警告, 最好的方法是定义一个协议
 *  @return items数组
 */
//- (NSArray *)itemsForBaseSegmentedControl;

@end
