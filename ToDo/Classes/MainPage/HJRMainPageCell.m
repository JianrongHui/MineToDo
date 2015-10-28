//
//  HJRMainPageCell.m
//  ToDo
//
//  Created by 辉建荣 on 15/10/27.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRMainPageCell.h"

@implementation HJRMainPageCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRMainPageCell" owner:self options:nil];
        if (nibs.count < 1) {
            return nil;
        }
        if (![[nibs firstObject] isKindOfClass:[UITableViewCell class]]) {
            return nil;
        }
        return [nibs firstObject];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
