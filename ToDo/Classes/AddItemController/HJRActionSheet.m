//
//  HJRActionSheet.m
//  ToDo
//
//  Created by yang on 15/11/28.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRActionSheet.h"

@implementation HJRActionSheet

- (instancetype)initWithCancleButtonTitle:(NSString *)cancelTitle firstButtonTitle:(NSString *)title1 secondButtonTitle:(NSString *)title2
{
    self = [super init];
    if (self) {
        self.frame =  [UIScreen mainScreen].bounds;
        
        [UIView animateWithDuration:1
                         animations:^{
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    }
    return self;
}


- (void)showInView:(UIView *)view
{
    
}

@end
