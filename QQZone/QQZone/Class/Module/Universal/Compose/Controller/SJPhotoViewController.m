//
//  SJPhotoViewController.m
//  QQZone
//
//  Created by app;e on 16/2/20.
//  Copyright © 2016年 world. All rights reserved.
//

#import "SJPhotoViewController.h"

@interface SJPhotoViewController ()

@end

@implementation SJPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavBar];
}

- (void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStyleDone target:self action:@selector(upload)];
    
}

- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)upload{
    
}

@end
