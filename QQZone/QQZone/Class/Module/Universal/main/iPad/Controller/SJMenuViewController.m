//
//  SJMenuViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuViewController.h"
#import "SJMainTableViewController.h"
#import "SJMenuItem.h"
#import "SJMenuItemViewModel.h"
#import "SJMenuButton.h"

#define kMiddleButtonHeight 60
#define kMiddleButtonCount 6
#define kBottmoLandscapeHeight 90
#define kBottomPortraitHeight 180

@interface SJMenuViewController ()
//容器视图,显示的是iphone的tabBar界面,只有当spliteVC的宽度是紧凑的时候才显示
@property (weak, nonatomic) IBOutlet UIView *container;

//masterVC最底部的stackView
@property(nonatomic,strong) UIStackView *bottomStackView;

@property(nonatomic,strong) UIStackView *middleStackView;

//menvItemVM
@property (nonatomic, strong) SJMenuItemViewModel *menuItemVM;
//记录相中按钮
@property(nonatomic,strong) SJMenuButton *selectedBtn;

@end

@implementation SJMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:34/250.0 alpha:1];
    //容器view
    [self setupContainerView];
    //master底部的stackView
    [self prepareBottomStackView];
    //masterVC 中间的stackView
    [self prepareMiddleStackView];
    
    //默认选中第一个按钮
    [self menuButtonClick:self.middleStackView.arrangedSubviews[0]];
    
}
/**
 *  当ipad屏幕发送改变的时候就需要调用该方法进行更新
 *  当屏幕方向发生改变的时候,stackView的子控件布局需要改变
 *
 *  @param isLandscape 是否是横屏
 */
- (void)updateSubViews:(BOOL)isLandscape{
    //根据横竖屏设置高度
    CGFloat height = isLandscape ? kBottmoLandscapeHeight : kBottomPortraitHeight;
    //根据横竖屏改变bottomStackView子控件的布局方式
    self.bottomStackView.axis = isLandscape ? UILayoutConstraintAxisHorizontal :UILayoutConstraintAxisVertical;
    //利用Masonry更新约束
    [self.bottomStackView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
    }];
    
    //当屏幕方向改变到时候调用, 根据屏幕方向来设置menuButton的内容对齐模式,文字是否显示
    for (SJMenuButton *btn in self.middleStackView.arrangedSubviews) {
        [btn setupButton:isLandscape];
    }
}

/**
 *  准备容器view
 */
- (void)setupContainerView{
    //1.创建iPhone的tabBarVC
    SJMainTableViewController *tabBarVC = [[SJMainTableViewController alloc] init];
    //2.将tabBarVC.view赋值给container
    self.container = tabBarVC.view;
    
    // 如果一个控制器的view成为另外一个控制器的子view时,最好将控制器也成为另一个控制器的子控制器
    // 3.将tabBarVC作为self的子控制器,当屏幕旋转或modal的时候才不会出现问题
    [self.view addSubview:tabBarVC.view];
    [self addChildViewController:tabBarVC];
}

/**
 *  准备masterVC底部的stackView
 */
- (void)prepareBottomStackView{
    //1.添加stackView
    [self.view addSubview:self.bottomStackView];
    self.bottomStackView.backgroundColor = [UIColor orangeColor];
    
    self.bottomStackView.axis = UILayoutConstraintAxisHorizontal;//默认
    self.bottomStackView.alignment = UIStackViewAlignmentFill;//默认.垂直方向填充stackview
    self.bottomStackView.distribution = UIStackViewDistributionFillEqually;//水平方向等宽
    self.bottomStackView.spacing = 5;//间距
    
    /*stackView的排列方式
     @property(nonatomic) UILayoutConstraintAxis axis;//子控件排列方式:水平or垂直
     
    @property(nonatomic) UIStackViewDistribution distribution;//子控件水平方向排列方式
    
     @property(nonatomic) UIStackViewAlignment alignment; //子控件垂直方向排列方式
    
    @property(nonatomic) CGFloat spacing; //间距

     */
    
    //2.设置stackView的frame
    [self.bottomStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        //stackView的右边与当前view的右边相等. 底部,左侧一样
        make.trailing.leading.bottom.equalTo(self.view);
        make.height.equalTo(@(kBottmoLandscapeHeight));
    }];
    
//    //3.准备数据
//    NSArray *titleArray = @[@{@"title":@"发说说",@"icon":@""},
//                            @{@"title":@"传照片",@"icon":@""},
//                            @{@"title":@"写日志",@"icon":@""}];
//    //3.1字典转模型
//    NSMutableArray *itemArray = [NSMutableArray array];
//    for (NSDictionary *dict in titleArray) {
//        SJMenuItem *menuItem = [SJMenuItem menuItemWithDict:dict];
//        [itemArray addObject:menuItem];
//    }
    
    //4.创建子控件
    for (SJMenuItem *item in self.menuItemVM.composeItems) {
//        UIButton *btn = [[UIButton alloc] init];
//        [btn setTitle:item.title forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:item.icon] forState:UIControlStateNormal];
        SJMenuButton *btn = [[SJMenuButton alloc] initWithMenuItem:item];
        [self.bottomStackView addArrangedSubview:btn];
    }
    
}

//masterVC 中间的stackView
- (void)prepareMiddleStackView{
    [self.view addSubview:self.middleStackView];
    //设置属性
    self.middleStackView.axis = UILayoutConstraintAxisVertical;
    self.middleStackView.distribution = UIStackViewDistributionFillEqually;

    //设置约束
    CGFloat height = kMiddleButtonCount * kMiddleButtonHeight;
    [self.middleStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.leading.equalTo(self.view);
        make.bottom.equalTo(self.bottomStackView.mas_top);
        make.height.equalTo(@(height));
    }];
//    //准备数据
//    NSArray *array = @[@{@"title":@"全部动态",@"icon":@"tab_bar_feed_icon"},
//                       @{@"title":@"与我相关",@"icon":@"tab_bar_passive_feed_icon"},
//                       @{@"title":@"照片墙",@"icon":@"tab_bar_pic_wall_icon"},
//                       @{@"title":@"电子相框",@"icon":@"tab_bar_e_album_icon"},
//                       @{@"title":@"好友",@"icon":@"tab_bar_friend_icon"},
//                       @{@"title":@"更多",@"icon":@"tab_bar_e_more_icon"}];
//
//    //3.1字典转模型
//    NSMutableArray *itemArray = [NSMutableArray array];
//    for (NSDictionary *dict in array) {
//        SJMenuItem *menuItem = [SJMenuItem menuItemWithDict:dict];
//        [itemArray addObject:menuItem];
//    }
    
    //4.创建子控件
    for (SJMenuItem *item in self.menuItemVM.menuItems) {
//        UIButton *btn = [[UIButton alloc] init];
//        [btn setTitle:item.title forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:item.icon] forState:UIControlStateNormal];
        SJMenuButton *btn = [[SJMenuButton alloc] initWithMenuItem:item];
        [btn addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.middleStackView addArrangedSubview:btn];
    }
}
/**
 *  menu按钮的点击事件
 *
 *  @param btn <#btn description#>
 */
- (void)menuButtonClick:(SJMenuButton *)btn{
    //如果当前按钮 是 选中按钮 返回
    if (self.selectedBtn == btn) {
        return;
    }
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

/**
 *  容器视图是否显示
 *
 *  @param isShow <#isShow description#>
 */
- (void)showContainer:(BOOL)isShow{
    self.container.hidden = !isShow;
}

#pragma mark - 懒加载
//底部的stackView
- (UIStackView *)bottomStackView{
    
    if (_bottomStackView == nil) {
        _bottomStackView = [[UIStackView alloc] init];
    }
    
    return _bottomStackView;
}
//中间的stackView
- (UIStackView *)middleStackView{
    
    if (_middleStackView == nil) {
        _middleStackView = [[UIStackView alloc] init];
    }
    
    return _middleStackView;
}

//menvItemVM
- (SJMenuItemViewModel *)menuItemVM{
    
    if (_menuItemVM == nil) {
        _menuItemVM = [[SJMenuItemViewModel alloc] init];
    }
    
    return _menuItemVM;
}


@end
