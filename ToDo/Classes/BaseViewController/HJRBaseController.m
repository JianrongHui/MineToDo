//
//  HJRBaseController.m
//  ToDo
//
//  Created by 辉建荣 on 15/10/26.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRBaseController.h"

@interface HJRBaseController ()

@end

@implementation HJRBaseController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftBarButtonItem];
    [self setupRightBarButtonItem];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -  UI
- (void)setupLeftBarButtonItem{
    if (self.navigationController.viewControllers.count > 1) {
        UIButton *leftBtn = [UIButton buttonWithType:0];
        [leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
        leftBtn.frame = CGRectMake(0, 0, 60, 64);
        [leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
}

- (void)setupRightBarButtonItem{
    UIButton *rightBtn = [UIButton buttonWithType:0];
    [rightBtn setTitle:@"添加" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    rightBtn.backgroundColor = [UIColor greenColor];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    rightBtn.frame = CGRectMake(0, 0, 40, 64);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

#pragma mark - 点击事件 
- (void)backAction:(id)sender
{
    NSArray *array = self.navigationController.viewControllers;
    if (array.count > 1 && [array indexOfObject:self] > 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rightBarButtonAction:(id)sender
{
    // 子类中重载
}

#pragma mark - super
- (void)setTitle:(NSString *)title{
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(0, 0, 100, 20);
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor darkGrayColor];
//    lable.backgroundColor =[UIColor blueColor];
    lable.font = [UIFont systemFontOfSize:17.0f];
    lable.text = title;
    self.navigationItem.titleView = lable;
}


@end
