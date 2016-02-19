//
//  SJMenuItem.m
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuItem.h"

@implementation SJMenuItem
- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)menuItemWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    
//}
@end
