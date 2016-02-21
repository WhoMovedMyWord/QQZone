//
//  SJPictureWallCollectionViewController.m
//  QQZone
//
//  Created by app;e on 16/2/18.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJPictureWallCollectionViewController.h"
#import "SJTopView.h"
#import "SJCategoryViewController.h"

@interface SJPictureWallCollectionViewController ()<SJTopViewDelegate>
@property (nonatomic, strong) SJTopView *categoryTopView;
@end

@implementation SJPictureWallCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (instancetype)init{
    if(self = [super initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]
               ]){
        
    }
    
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavRight];
    [self setupNavLeft];
    
    //监听SJCategoryViewController中展示数据的改变,来改变topViewUI
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:kSJCategoryDidChangeNofitication object:nil] subscribeNext:^(NSNotification *x) {
//        SJLog(@"%@",x);
        NSString *title = x.userInfo[@"SJCategoryeNameKey"];
        NSString *subTitle = x.userInfo[@"SJSubCategoryeNameKey"];
        NSString *imgName = x.userInfo[@"SJCategoryImageNameKey"];
        NSString *helImgName = x.userInfo[@"SJCategoryHighlightedImageNameKey"];
        
        self.categoryTopView.iconName = imgName;
        self.categoryTopView.helIconName = helImgName;
        self.categoryTopView.title = title;
        self.categoryTopView.subTitle = subTitle;
    }];
}

- (void)setupNavLeft{
    self.categoryTopView = [[SJTopView alloc] init];
    self.categoryTopView.delegate = self;
    self.categoryTopView.frame = CGRectMake(0, 0, 100, 30);
    UIBarButtonItem *categoryButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.categoryTopView];
    self.navigationItem.leftBarButtonItem = categoryButtonItem;
}

- (void)setupNavRight{

    UIButton *mapBtn = [UIButton new];
    [mapBtn setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [mapBtn setImage:[UIImage imageNamed:@"icon_map_highlighted"] forState:UIControlStateHighlighted];
//    [mapBtn sizeToFit];
        mapBtn.frame = CGRectMake(0, 0, 80, 30);
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithCustomView:mapBtn];
    
    UIButton *searchBtn = [UIButton new];
    [searchBtn setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"icon_search_highlighted"] forState:UIControlStateHighlighted];
    [searchBtn sizeToFit];

    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    self.navigationItem.rightBarButtonItems = @[searchItem,mapItem];
}

//SJTopViewDelegate
- (void)topViewBtnClick:(SJTopView *)topView{
    SJCategoryViewController *categoryVC = [[SJCategoryViewController alloc] init];
    
    /*指定了modalPresentationStyle需要设置sourceView
     reason: 'UIPopoverPresentationController (<UIPopoverPresentationController: 0x7fc2a590f900>) should have a non-nil sourceView or barButtonItem set before the presentation occurs.'
     *** First throw call stack:
     */
    //样式
    categoryVC.modalPresentationStyle = UIModalPresentationPopover;
    //位置
    categoryVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    //大小
    categoryVC.preferredContentSize = CGSizeMake(400, 400);
    
    [self presentViewController:categoryVC animated:YES completion:nil];
}

@end
