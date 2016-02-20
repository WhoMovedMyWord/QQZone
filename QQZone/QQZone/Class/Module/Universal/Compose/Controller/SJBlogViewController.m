//
//  SJBlogViewController.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJBlogViewController.h"

@interface SJBlogViewController ()

@end

@implementation SJBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavBar];
}

- (void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    
}

- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send{
    
}

@end
