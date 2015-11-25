//
//  HJRImageLabelCell.m
//  ToDo
//
//  Created by yang on 15/11/25.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRImageLabelCell.h"

@interface HJRImageLabelCell()

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;

@end

@implementation HJRImageLabelCell

- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRImageLabelCell" owner:self options:nil];
        self = [nibs firstObject];
    }
    return self;
}

- (void)setCellTitle:(NSString *)cellTitle
{
    _cellTitleLabel.text = cellTitle;
}

- (void)setCellImageName:(NSString *)cellImageName
{
    _cellImageView.image = [UIImage imageNamed:cellImageName];
}

@end
