//
//  HJRAddItemController.m
//  ToDo
//
//  Created by 辉建荣 on 15/11/24.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRAddItemController.h"
#import "HJRImageLabelCell.h"
#import "HJRInputCell.h"
#import "HJRDetailDTO.h"
#import <AVFoundation/AVFoundation.h>

@interface HJRAddItemController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *_timeArray;
    HJRDetailDTO *_returnDTO;
}

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation HJRAddItemController

#pragma mark - lifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加新项目";
    _timeArray = @[].mutableCopy;
    _returnDTO = [[HJRDetailDTO alloc] init];
    [self setupRightBarButtonItemWithTitle:@"重置" imageName:nil];
    [self setUpContentTableView];
}

- (void)setUpContentTableView {
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.rowHeight = 44.0f;
    _contentTableView.backgroundColor = KBACKGROUNDCOLOR;
    _contentTableView.sectionHeaderHeight = 20.0f;
    _contentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _contentTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

#pragma mark - super
- (void)backAction:(id)sender
{
    if (self.returnBlock) {
        self.returnBlock(_returnDTO);
    }
    [super backAction:nil];
}
#pragma mark - 点击事件

- (IBAction)saveBtnAction:(id)sender {
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 1;
        case 1: return 1;
        case 2: return 4;// _timeArray.count;
        case 3: return 1;
        default: return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = [NSString stringWithFormat:@"cellId%zi_%zi",indexPath.section,indexPath.row];
    switch (indexPath.section) {
        case 0:
        {
            HJRImageLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[HJRImageLabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            cell.cellTitle = @"上传照片";
            cell.cellImageName = @"button_update";
            return cell;
         }
        case 1:
        {
            HJRInputCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[HJRInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            cell.cellTitle = @"名称:";
            cell.inputTextView.placeholder = @"待办事项";
            return cell;
        }
        case 2:
        {
            if (indexPath.row == _timeArray.count - 1) {
                HJRImageLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
                if (!cell) {
                    cell = [[HJRImageLabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
                }
                cell.cellTitle = @"添加时间";
                cell.cellImageName = @"button_add";
                return cell;
            }
            
            HJRInputCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[HJRInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            cell.cellTitle = indexPath.row == 0? @"时间:" : @"";
            cell.inputTextView.placeholder = @"输入时间";
//            cell.inputTextView.text = _timeArray[indexPath.row];
            cell.userInteractionEnabled = NO;
            return cell;
        }
        case 3:
        {
            if (indexPath.row == 0) {
                HJRInputCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
                if (!cell) {
                    cell = [[HJRInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
                }
                cell.cellTitle = @"规律:";
                cell.inputTextView.placeholder = @"规律";
                cell.userInteractionEnabled = NO;
                return cell;
            }
            
            HJRImageLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
                cell = [[HJRImageLabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            cell.cellTitle = @"添加规律";
            cell.cellImageName = @"button_add";
            return cell;
        }
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [UIView new];
    header.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
    header.backgroundColor = KBACKGROUNDCOLOR;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2 || section == 3 ) {
        return 44;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 2 || section == 3) {
        UIButton *footBtn = [UIButton buttonWithType:0];
        footBtn.frame = CGRectMake(0, 0, KIPHONEWIDTH, 44);
        [footBtn setImage:[UIImage imageNamed:@"button_add"] forState:UIControlStateNormal];
        NSString *btnTitle = section==2? @"  添加时间" : @"  添加规律";
        
        [footBtn setTitle:btnTitle forState:UIControlStateNormal];
        footBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [footBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        footBtn.backgroundColor = [UIColor whiteColor];
        return footBtn;
    }
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UIActionSheet *sheet = [[UIActionSheet alloc]
                                initWithTitle:nil
                                delegate:self
                                cancelButtonTitle:@"取消"
                                destructiveButtonTitle:nil 
                                otherButtonTitles:@"相机",@"照片",
                                nil];
        
        [sheet showInView:self.view];

    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
            break;
        case 1:
            [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _returnDTO.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ohter

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)type
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) && type == UIImagePickerControllerSourceTypeCamera) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"相机未授权\n请到“设置-隐私-相机”打开" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show ];
        return;
    }

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = type;

    [self presentViewController:picker animated:YES completion:nil];
}

@end
