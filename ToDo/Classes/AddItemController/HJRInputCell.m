//
//  HJRInputCell.m
//  ToDo
//
//  Created by yang on 15/11/25.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRInputCell.h"

@interface HJRInputCell()

@property (weak, nonatomic) IBOutlet UILabel *cellTileLabel;

@end

@implementation HJRInputCell

- (void)awakeFromNib {
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRInputCell" owner:self options:nil];
        self = [nibs firstObject];
    }
    return self;
}

- (void)setCellTitle:(NSString *)cellTitle
{
    _cellTileLabel.text = cellTitle;
}

@end
