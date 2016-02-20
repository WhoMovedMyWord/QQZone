//
//  SJCategoryModel.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJCategoryModel.h"

@implementation SJCategoryModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //      封装字典转模型
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)categoryWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
