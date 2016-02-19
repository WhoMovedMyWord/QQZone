//
//  SJMenuItemViewModel.h
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJMenuItemViewModel : NSObject

//NSArray不让外界修改
@property (nonatomic, strong) NSArray *composeItems;

@property (nonatomic, strong) NSArray *menuItems;

@end
