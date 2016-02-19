//
//  SJMenuButton.m
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuButton.h"
#import "SJMenuItem.h"
@implementation SJMenuButton

- (instancetype)initWithMenuItem:(SJMenuItem *)item{
    if (self = [super init]) {
        _item = item;
        
        [self setupUI];
        
    }
    return self;
}

+ (instancetype)menuButtonWithMenuItem:(SJMenuItem *)item{
    return [[self alloc] initWithMenuItem:item] ;
}

- (void)setupUI{
    
    [self setImage:[UIImage imageNamed:self.item.icon] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    //不是撰写按钮
    if (!self.item.isComposeBtn ) {
        //设置分割线
        UIImageView *sepratorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_separate_line"]];
        [self addSubview:sepratorView];
        //添加约束
        [sepratorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.height.equalTo(@2);
        }];
        

        
    }else{
        //设置分割线
        UIImageView *sepratorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_separate_ugc_line_v"]];
        [self addSubview:sepratorView];
        [sepratorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.trailing.equalTo(self);
            make.width.equalTo(@2);
        }];

    }
}

//当屏幕方向改变到时候调用, 根据屏幕方向来设置按钮的内容对齐模式,文字是否显示
- (void)setupButton:(BOOL)isLandscape{
    if (isLandscape) {
        //设置按钮的内容对齐方式
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //内容左侧间距
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        //设置文字距离左侧
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        
        [self setTitle:self.item.title forState:UIControlStateNormal];

    }else{
        //设置按钮的内容对齐方式
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        //内容左侧间距
        self.contentEdgeInsets = UIEdgeInsetsZero;
        
        //设置文字距离左侧
        self.titleEdgeInsets = UIEdgeInsetsZero;
        
        [self setTitle:nil forState:UIControlStateNormal];

    }
}
@end
