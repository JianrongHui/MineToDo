//
//  HJRSettingController.m
//  ToDo
//
//  Created by 辉建荣 on 15/10/26.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRSettingController.h"

@interface HJRSettingController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titleArray;
    NSArray *_imageArray;
}

@property (nonatomic, strong) UITableView *contentTableView;
@end

@implementation HJRSettingController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataSource];
    [self setupContentTableView];
    self.title = @"设置";
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - initializer
- (void)initDataSource {
    _titleArray = @[@[@"更换皮肤",@"任务提醒"],
  @[@"清空所有"],@[@"关于",@"意见反馈"]];
    _imageArray = @[@[@"setting_skin",@"setting_clock"],@[@"setting_clear"],@[@"setting_about",@"setting_feedback"]];
}

- (void)setupContentTableView {
    CGRect size = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44);
    _contentTableView = [[UITableView alloc] initWithFrame:size style:UITableViewStylePlain];
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.backgroundColor = [UIColor lightGrayColor];
    _contentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _contentTableView.sectionHeaderHeight = 15.0f;
    _contentTableView.rowHeight = 44.0f;
    
    
    [self.view addSubview:_contentTableView];
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 2;
        case 1: return 1;
        case 2: return 2;
        default: return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = _titleArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    NSString *imageName =  _imageArray[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
    header.backgroundColor = [UIColor lightGrayColor];
    return header;
}
@end
