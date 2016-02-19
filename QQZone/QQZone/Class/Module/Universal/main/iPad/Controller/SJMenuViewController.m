//
//  SJMenuViewController.m
//  QQZone
//
//  Created by app;e on 16/2/17.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJMenuViewController.h"
#import "SJMainTableViewController.h"

#define kMiddleButtonHeight 60
#define kMiddleButtonCount 6
@interface SJMenuViewController ()
//容器视图,显示的是iphone的tabBar界面,只有当spliteVC的宽度是紧凑的时候才显示
@property (weak, nonatomic) IBOutlet UIView *container;

//masterVC最底部的stackView
@property(nonatomic,strong) UIStackView *bottomStackView;

@property(nonatomic,strong) UIStackView *middleStackView;

@end

@implementation SJMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //容器view
    [self setupContainerView];
    //master底部的stackView
    [self prepareBottomStackView];
    //masterVC 中间的stackView
    [self prepareMiddleStackView];
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
        make.height.equalTo(@90);
    }];
    
    //3.准备数据
    NSArray *titleArray = @[@{@"title":@"发说说"},
                            @{@"title":@"传照片"},
                            @{@"title":@"写日志"}];
    
    //4.创建子控件
    for (NSDictionary *dic in titleArray) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:dic[@"title"] forState:UIControlStateNormal];
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
    //准备数据
    NSArray *array = @[@{@"title":@"全部动态"},
                            @{@"title":@"与我相关"},
                            @{@"title":@"照片墙"},
                            @{@"title":@"电子相框"},
                            @{@"title":@"好友"},
                            @{@"title":@"更多"}];

    //生成按钮
    for (NSDictionary *dic in array) {
        UIButton *btn = [UIButton new];
        [btn setTitle:dic[@"title"] forState:UIControlStateNormal];
        [self.middleStackView addArrangedSubview:btn];
    }
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


@end
