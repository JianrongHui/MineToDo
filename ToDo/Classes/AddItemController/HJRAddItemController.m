//
//  HJRAddItemController.m
//  ToDo
//
//  Created by 辉建荣 on 15/11/24.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRAddItemController.h"

@interface HJRAddItemController ()<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation HJRAddItemController

#pragma mark - lifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加新项目";
    [self setupRightBarButtonItemWithTitle:@"重置" imageName:nil];
    [self setUpContentTableView];
}

- (void)setUpContentTableView {
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.rowHeight = 44.0f;
    _contentTableView.backgroundColor = [UIColor lightGrayColor];
    _contentTableView.sectionHeaderHeight = 20.0f;
    _contentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 1;
        case 1: return 1;
        case 2: return 2;
        case 3: return 2;
        default: return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
    header.backgroundColor = [UIColor lightGrayColor];
    return header;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
//    footer.backgroundColor = [UIColor lightGrayColor];
//    return footer;
//}


@end
