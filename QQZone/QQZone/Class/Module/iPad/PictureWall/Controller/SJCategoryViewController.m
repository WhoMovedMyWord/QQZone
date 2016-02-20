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
#import "SJCategoryViewModel.h"
#import "SJCategoryModel.h"

@interface SJCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;

@property (nonatomic, strong) SJCategoryViewModel *categoryVM;

@end

@implementation SJCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //注册cell
    [self.mainTableView registerClass:[SJCategoryMainTableViewCell class] forCellReuseIdentifier:kMainTableViewCellIdentifier];
    [self.subTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSubTableViewCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return self.categoryVM.categories.count;
    }else{
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        SJCategoryMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableViewCellIdentifier];
        SJCategoryModel *model = self.categoryVM.categories[indexPath.row];
        cell.textLabel.text = model.name;
        cell.imageView.image = [UIImage imageNamed:model.icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:model.highlighted_icon];
        
        //判断是否有子分类
        if (model.subcategories) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSubTableViewCellIdentifier];
        cell.textLabel.text = @"sub";
        return cell;
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
