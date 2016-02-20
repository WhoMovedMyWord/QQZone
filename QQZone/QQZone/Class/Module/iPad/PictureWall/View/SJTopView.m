//
//  SJTopView.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJTopView.h"

@interface SJTopView ()
/**
 *  竖分割线
 */
@property(nonatomic,strong) UIView *separatorView;
/**
 *  图标按钮
 */
@property(nonatomic,strong) UIButton *iconBtn;
/**
 *  标题
 */
@property(nonatomic,strong) UILabel *titleLabel;
/**
 *  子标题
 */
@property(nonatomic,strong) UILabel *subTitleLabel;
@end

@implementation SJTopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self preapreUI];
    }
    return self;
}

- (instancetype)initWithIcon:(NSString *)iconName helIcon:(NSString *)helIconName andTitle:(NSString *)title andSubTitle:(NSString *)subTitle{
    if (self = [super init]) {
        [self preapreUI];
        self.iconName = iconName;
        self.helIconName = helIconName;
        self.title = title;
        self.subTitle = subTitle;
    }
    return self;
}

+ (instancetype)topViewWithIcon:(NSString *)iconName helIcon:(NSString *)helIconName andTitle:(NSString *)title andSubTitle:(NSString *)subTitle{
    return [[self alloc] initWithIcon:iconName helIcon:helIconName andTitle:title andSubTitle:subTitle];
}


- (void)preapreUI{
    //1.分割线
    [self addSubview:self.separatorView];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.bottom.equalTo(self).offset(-2);
        make.leading.equalTo(self);
        make.width.equalTo(@1);
    }];
    //2.按钮
    [self addSubview:self.iconBtn];
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    //3.标题
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconBtn);
        make.leading.equalTo(self.iconBtn).offset(40);
    }];
    //4.子标题
    [self addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.equalTo(self.titleLabel);
    }];
}

#pragma mark - 设置UI
- (void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    //更新图片
    [self.iconBtn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
}
- (void)setHelIconName:(NSString *)helIconName{
    _helIconName = helIconName;
    [self.iconBtn setImage:[UIImage imageNamed:helIconName] forState:UIControlStateHighlighted];
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    self.subTitleLabel.text = subTitle;
}

#pragma mark - 按钮点击
- (void)iconBtnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(topViewBtnClick:)]) {
        [self.delegate topViewBtnClick:self];
    }
}

#pragma mark - 懒加载
//分割线
- (UIView *)separatorView{
    if (_separatorView == nil) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = [UIColor blackColor];
        _separatorView.alpha = 0.2;
    }
    return _separatorView;
}
//图标
- (UIButton *)iconBtn{
    if (_iconBtn == nil) {
        _iconBtn = [[UIButton alloc] init];
        [_iconBtn setImage:[UIImage imageNamed:@"icon_district"] forState:UIControlStateNormal];
        [_iconBtn setImage:[UIImage imageNamed:@"icon_district_highlighted"] forState:UIControlStateHighlighted];
        _iconBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _iconBtn.contentEdgeInsets= UIEdgeInsetsMake(0, 8, 0, 0);
        [_iconBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconBtn;
}
//标题
- (UILabel *)titleLabel{
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"主标题";
    }
    
    return _titleLabel;
}
//子标题
- (UILabel *)subTitleLabel{
    
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.text = @"子标题";
    }
    
    return _subTitleLabel;
}


@end
