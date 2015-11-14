//
//  HJRDetailsController.m
//  ToDo
//
//  Created by 辉建荣 on 15/11/14.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRDetailsController.h"
#import "HJRDetailsTableHeader.h"

static NSString *kDetailsCellId = @"DetailsCellId";
@interface HJRDetailsController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;


@end

@implementation HJRDetailsController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    _dataArray = [[NSMutableArray alloc] init];
#warning 测试数据
    NSArray *tempArray = @[@1,@2,@3,@4,@5];
    [_dataArray addObjectsFromArray:tempArray];
    
    
    [self configTableView];
}

#pragma mark - UI
- (void)configTableView
{
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.rowHeight = 44;
    _contentTableView.sectionHeaderHeight = 205;
    [_contentTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kDetailsCellId];
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDetailsCellId];
    cell.imageView.image = [UIImage imageNamed:@"state_high"];
    cell.textLabel.text = @"打电话给她";
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HJRDetailsTableHeader *header = [[HJRDetailsTableHeader alloc] init];
    return header;
}



@end
