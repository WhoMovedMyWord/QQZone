//
//  SJMenuItem.h
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import <Foundation/Foundation.h>
//模型
@interface SJMenuItem : NSObject
//标题
@property(nonatomic,copy) NSString *title;

//图标
@property(nonatomic,copy) NSString *icon;

@property(nonatomic,assign,getter=isComposeBtn) BOOL composeBtn;

//按钮右边对应的内容控制器的名称
@property (nonatomic, copy) NSString *detailContentVCName;

//字典转模型
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)menuItemWithDict:(NSDictionary *)dict;

@end
