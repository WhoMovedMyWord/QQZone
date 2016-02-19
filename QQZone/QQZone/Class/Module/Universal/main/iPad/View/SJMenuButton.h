//
//  SJMenuButton.h
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SJMenuItem;
@interface SJMenuButton : UIButton

//记录当前button使用的模型
@property (nonatomic, strong) SJMenuItem *item;

- (instancetype)initWithMenuItem:(SJMenuItem *)item;

+ (instancetype)menuButtonWithMenuItem:(SJMenuItem *)item;

//当屏幕方向改变到时候调用, 根据屏幕方向来设置按钮的内容对齐模式,文字是否显示
- (void)setupButton:(BOOL)isLandscape;
@end
