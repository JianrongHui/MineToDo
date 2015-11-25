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
#import "HJRDetailsController.h"
#import "HJRAddItemController.h"

static NSString *const mainPageCellId = @"mainPageCellId";

@interface HJRMainController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
}

@property (nonatomic, strong) UITableView *contentTableView;

@end

@implementation HJRMainController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray new];
    
    for (int i = 0; i < 5; i++) {
        [_dataArray addObject:@""];
    }
    
    self.title = @"全部";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupRightBarButtonItemWithTitle:nil imageName:@"button_add@3x.png"];
    [self setupContentTableView];
}

#pragma mark - UI
- (void)setupContentTableView
{
    // 计算cell高度
    CGFloat iphoneW = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellH = (iphoneW - 10)*3/5.0 + 10;
    _contentTableView = [[UITableView alloc] init];
    _contentTableView.frame = self.view.bounds;
    _contentTableView.contentInset = UIEdgeInsetsMake(0, 0, 48, 0);
    _contentTableView.delegate  = self;
    _contentTableView.dataSource = self;
    _contentTableView.rowHeight = cellH;
    _contentTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [_contentTableView registerClass:[HJRMainPageCell class] forCellReuseIdentifier:mainPageCellId];
    [self.view addSubview:_contentTableView];
}

#pragma mark - 点击事件
- (void)rightBarButtonAction:(id)sender
{
    HJRAddItemController *vc = [[HJRAddItemController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJRMainPageCell *cell = [tableView dequeueReusableCellWithIdentifier:mainPageCellId];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJRDetailsController *vc = [[HJRDetailsController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;

        [self.navigationController pushViewController:vc animated:YES];
    
}


@end
