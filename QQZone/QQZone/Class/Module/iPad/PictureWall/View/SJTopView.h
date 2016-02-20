//
//  SJTopView.h
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SJTopView;
@protocol SJTopViewDelegate <NSObject>

@optional
- (void)topViewBtnClick:(SJTopView *)topView;

@end

@interface SJTopView : UIView
/**
 *  图标
 */
@property(nonatomic,copy) NSString *iconName;
/**
 *  图标
 */
@property(nonatomic,copy) NSString *helIconName;

/**
 *  标题
 */
@property(nonatomic,copy) NSString *title;

/**
 *  子标题
 */
@property(nonatomic,copy) NSString *subTitle;

@property (nonatomic, weak) id<SJTopViewDelegate> delegate;

- (instancetype)initWithIcon:(NSString *)iconName helIcon:(NSString *)helIconName andTitle:(NSString *)title andSubTitle:(NSString *)subTitle;

+ (instancetype)topViewWithIcon:(NSString *)iconName helIcon:(NSString *)helIconName andTitle:(NSString *)title andSubTitle:(NSString *)subTitle;


@end
