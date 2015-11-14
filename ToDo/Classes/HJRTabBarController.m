//
//  HJRMainController.m
//  ToDo
//
//  Created by yang on 15/10/26.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRTabBarController.h"
#import "HJRMainController.h"
#import "HJRGogingController.h"
#import "HJRHaveDoneController.h"
#import "HJRSettingController.h"


@interface HJRTabBarController ()
{
    HJRMainController     *_mainController;
    HJRGogingController   *_goingController;
    HJRHaveDoneController *_haveDoneController;
    HJRSettingController  *_settingController;
}
@end

@implementation HJRTabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 

- (void)setupSubviews
{
    _mainController = [[HJRMainController alloc] init];
    _mainController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"全部" image:[UIImage imageNamed:@"tabbar_all_nor"] selectedImage:[UIImage imageNamed:@"tabbar_all_selected"]];
    UINavigationController *mainNvc = [[UINavigationController alloc] initWithRootViewController:_mainController];
    
    _goingController = [[HJRGogingController alloc] init];
    _goingController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"进行中" image:[UIImage imageNamed:@"tabbar_going_nor"] selectedImage:[UIImage imageNamed:@"tabbar_going_selected"]];    UINavigationController *goingNvc = [[UINavigationController alloc] initWithRootViewController:_goingController];
    
    _haveDoneController = [[HJRHaveDoneController alloc] init];
    _haveDoneController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"已完成" image:[UIImage imageNamed:@"tabbar_haveDone_nor"] selectedImage:[UIImage imageNamed:@"tabbar_haveDone_selected"]];    UINavigationController *haveDoneNvc = [[UINavigationController alloc] initWithRootViewController:_haveDoneController];
    
    _settingController = [[HJRSettingController alloc] init];
    _settingController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"tabbar_setting_nor"] selectedImage:[UIImage imageNamed:@"tabbar_setting_selected"]];    UINavigationController *settingNvc = [[UINavigationController alloc] initWithRootViewController:_settingController];
    
    self.viewControllers = @[mainNvc,goingNvc,haveDoneNvc,settingNvc];
    self.tabBar.translucent = NO;
}


@end
