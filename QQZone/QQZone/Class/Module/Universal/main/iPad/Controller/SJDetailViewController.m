//
//  SJDetailViewController.m
//  QQZone
//
//  Created by app;e on 16/2/19.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJDetailViewController.h"
#import "SJMenuItem.h"

@interface SJDetailViewController ()
//正在显示的导航控制器
@property(nonatomic,strong) UINavigationController *showVC;
@end

@implementation SJDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CommandBGColor;
}

/**
 *  按钮点击后切换详情控制器的内容控制器
 *
 *  @param item <#item description#>
 */
- (void)setupContentViewWithMenuItem:(SJMenuItem *)item{
    
    //把当前正在显示的控制的view从父控件中移除
    [self.showVC.view removeFromSuperview];
    //0.优化,如果没有这一步,那么每次切换都会重新创建一个控制器
    BOOL hasVc = NO;
    //0.1 判断之前是否已经创建过这个控制器
    for (UINavigationController *vc  in self.childViewControllers) {
        if ([vc.title isEqual:item.title]) {
            //找到之前创建的控制器.跳出循环  不用重新创建
            hasVc = YES;
            self.showVC = vc;
            break;
        }
    }
    
    //没有找到创建
    if (!hasVc) {
        //1.通过模型里面保存的控制器名称,创建对应控制器
        Class class = NSClassFromString(item.detailContentVCName);
        //注意,直接alloc,init的时候有可能是collectionView这个时候需要给一个layout.
        //所以如果class是collectionView的时候需要重写init方法
        UIViewController *vc = [[class alloc] init];
        vc.title = item.title;
        //2.创建导航控制器
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [self addChildViewController:nav];
        self.showVC = nav;
    }

    
    //3.添加控制器的view到详情控制器的view
    //不能添加vc.view  只能添加nav.view
    [self.view addSubview:self.showVC.view];
    
    //4.添加约束
    [self.showVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 0, 0, 44));
    }];
    
//    SJLog(@"%ld---%ld",self.childViewControllers.count,self.view.subviews.count);
}

@end
