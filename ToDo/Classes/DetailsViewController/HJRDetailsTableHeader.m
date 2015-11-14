//
//  HJRDetailsTableHeader.m
//  ToDo
//
//  Created by 辉建荣 on 15/11/14.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRDetailsTableHeader.h"

@implementation HJRDetailsTableHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
      NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRDetailsTableHeader" owner:self options:nil];
        self = [nibs firstObject];
    }
    return self;
}


@end
