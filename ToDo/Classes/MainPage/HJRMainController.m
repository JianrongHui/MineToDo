//
//  HJRMainController.m
//  ToDo
//
//  Created by 辉建荣 on 15/10/26.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRMainController.h"
#import "HJRMainPageCell.h"
#import "HJRGogingController.h"

static NSString *const mainPageCellId = @"mainPageCellId";

@interface HJRMainController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *contentTableView;

@end

@implementation HJRMainController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupContentTableView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI

- (void)setupContentTableView
{
    // 计算cell高度
    CGFloat iphoneW = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellH = iphoneW*3/5.0 + 10;
    
    _contentTableView = [[UITableView alloc] init];
    _contentTableView.frame = self.view.bounds;
    _contentTableView.delegate  = self;
    _contentTableView.dataSource = self;
    _contentTableView.rowHeight = cellH;
    _contentTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [_contentTableView registerClass:[HJRMainPageCell class] forCellReuseIdentifier:mainPageCellId];
    [self.view addSubview:_contentTableView];
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJRMainPageCell *cell = [tableView dequeueReusableCellWithIdentifier:mainPageCellId];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJRGogingController *vc = [[HJRGogingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
