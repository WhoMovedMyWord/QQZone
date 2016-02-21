//
//  SJCategoryModel.h
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJCategoryModel : NSObject
/**
 *  分类普通图片
 */
@property(nonatomic,copy) NSString *icon;

/**
 *  分类高亮图片
 */
@property(nonatomic,copy) NSString *highlighted_icon;
/**
 *  分类名称
 */
@property(nonatomic,copy) NSString *name;
/**
 *  分类高亮小图
 */
@property(nonatomic,copy) NSString *small_highlighted_icon;
/**
 *  分类小图
 */
@property(nonatomic,copy) NSString *small_icon;
/**
 *  子分类数据
 */
@property(nonatomic,copy) NSArray *subcategories;




//1.提供一个初始化方法
- (instancetype) initWithDict:(NSDictionary *) dict;

//2.类方法
+ (instancetype) categoryWithDict:(NSDictionary *) dict;






@end
