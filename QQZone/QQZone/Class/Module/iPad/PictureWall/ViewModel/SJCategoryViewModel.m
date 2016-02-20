//
//  SJCategoryViewModel.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJCategoryViewModel.h"
#import "SJCategoryModel.h"
@implementation SJCategoryViewModel
- (NSArray *)categories{
    if (_categories == nil) {
        //      拿到应用的目录对象
        NSBundle *bundle = [NSBundle mainBundle];
        //      获得绝对路径
        NSString *path = [bundle pathForResource:@"categories" ofType:@"plist"];
        //      加载plist文件
        NSArray *array  = [NSArray arrayWithContentsOfFile:path];
        //      字典转模型
        //      定义一个可变数组存放转换后的模型
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            
            SJCategoryModel *model = [SJCategoryModel  categoryWithDict:dict];
            
            [arrayM addObject:model];
        }
        _categories = arrayM;
    }
    return _categories;
}
@end
