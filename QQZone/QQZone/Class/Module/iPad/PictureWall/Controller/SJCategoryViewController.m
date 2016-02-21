//
//  SJCategoryViewController.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

NSString *const kMainTableViewCellIdentifier = @"kMainTableViewCellIdentifier";
NSString *const kSubTableViewCellIdentifier = @"kSubTableViewCellIdentifier";

#import "SJCategoryViewController.h"
#import "SJCategoryMainTableViewCell.h"
#import "SJCategorySubTableViewCell.h"
#import "SJCategoryViewModel.h"
#import "SJCategoryModel.h"


@interface SJCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;

@property (nonatomic, strong) SJCategoryViewModel *categoryVM;

@property(nonatomic,strong) NSIndexPath *selectedIndexPath;

@end

@implementation SJCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //注册cell
    [self.mainTableView registerClass:[SJCategoryMainTableViewCell class] forCellReuseIdentifier:kMainTableViewCellIdentifier];
    [self.subTableView registerClass:[SJCategorySubTableViewCell class] forCellReuseIdentifier:kSubTableViewCellIdentifier];
    
    //设置tableView的分割线样式
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.subTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return self.categoryVM.categories.count;
    }else{
        SJCategoryModel *model = self.categoryVM.categories[self.selectedIndexPath.row];
        return model.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        SJCategoryMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableViewCellIdentifier];
        SJCategoryModel *model = self.categoryVM.categories[indexPath.row];
        cell.textLabel.text = model.name;
        cell.imageView.image = [UIImage imageNamed:model.small_icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:model.small_highlighted_icon];
        
        //判断是否有子分类
        if (model.subcategories.count>0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{//不能省略,防止循环利用
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }else{
        SJCategorySubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSubTableViewCellIdentifier];
        SJCategoryModel *model = self.categoryVM.categories[self.selectedIndexPath.row];
        cell.textLabel.text = model.subcategories[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {//点击的是manTableview
        self.selectedIndexPath = indexPath;
        //刷新对应的子tableView
        [self.subTableView reloadData];
        
        //更改topView的内容
        //1.点击manTableView且没有子分类
        SJCategoryModel *model = self.categoryVM.categories[indexPath.row];
        if (model.subcategories.count == 0) {
//            SJLog(@"没有子类的main");
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:kSJCategoryDidChangeNofitication object:nil userInfo:@{kSJCategoryImageNameKey:model.icon,kSJCategoryHighlightedImageNameKey:model.highlighted_icon,kSJCategoryeNameKey:model.name}];
            //关闭控制器
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
//        SJLog(@"二级子")
        //获取上一级选中的模型
         SJCategoryModel *model = self.categoryVM.categories[self.selectedIndexPath.row];
        //发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:kSJCategoryDidChangeNofitication object:nil userInfo:@{kSJCategoryImageNameKey:model.icon,kSJCategoryHighlightedImageNameKey:model.highlighted_icon,kSJCategoryeNameKey:model.name,kSJSubCategoryeNameKey:model.subcategories[indexPath.row]}];
        //关闭控制器
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 懒加载
- (SJCategoryViewModel *)categoryVM{
    
    if (_categoryVM == nil) {
        _categoryVM = [[SJCategoryViewModel alloc] init];
    }
    
    return _categoryVM;
}

@end
