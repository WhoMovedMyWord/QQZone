//
//  SJSubTableViewCell.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJCategorySubTableViewCell.h"

@implementation SJCategorySubTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 子控件的创建和初始化
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        UIImageView *selectedBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        self.backgroundView = bg;
        self.selectedBackgroundView = selectedBg;

    }
    return self;
}

@end
