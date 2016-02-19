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
//字典转模型
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)menuItemWithDict:(NSDictionary *)dict;

@end
