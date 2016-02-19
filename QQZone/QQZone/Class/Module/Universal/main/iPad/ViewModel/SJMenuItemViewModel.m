//
//  SJMenuItemViewModel.m
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuItemViewModel.h"
#import "SJMenuItem.h"
@implementation SJMenuItemViewModel

- (NSArray *)composeItems{
    
    if (_composeItems == nil) {
        //3.准备数据
        NSArray *titleArray = @[@{@"title":@"发说说",@"icon":@""},
                                @{@"title":@"传照片",@"icon":@""},
                                @{@"title":@"写日志",@"icon":@""}];
        //3.1字典转模型
        NSMutableArray *itemArray = [NSMutableArray array];
        for (NSDictionary *dict in titleArray) {
            SJMenuItem *menuItem = [SJMenuItem menuItemWithDict:dict];
            [itemArray addObject:menuItem];
        }
        _composeItems = itemArray;
    }
    
    return _composeItems;
}

- (NSArray *)menuItems{
    
    if (_menuItems == nil) {
        //准备数据
        NSArray *array = @[@{@"title":@"全部动态",@"icon":@"tab_bar_feed_icon"},
                           @{@"title":@"与我相关",@"icon":@"tab_bar_passive_feed_icon"},
                           @{@"title":@"照片墙",@"icon":@"tab_bar_pic_wall_icon"},
                           @{@"title":@"电子相框",@"icon":@"tab_bar_e_album_icon"},
                           @{@"title":@"好友",@"icon":@"tab_bar_friend_icon"},
                           @{@"title":@"更多",@"icon":@"tab_bar_e_more_icon"}];
        
        //3.1字典转模型
        NSMutableArray *itemArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            SJMenuItem *menuItem = [SJMenuItem menuItemWithDict:dict];
            [itemArray addObject:menuItem];
        }
        _menuItems = itemArray;
    }
    
    return _menuItems;
}


@end
