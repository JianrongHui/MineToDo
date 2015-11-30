//
//  HJRActionSheet.h
//  ToDo
//
//  Created by yang on 15/11/28.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJRActionSheet : UIView

- (instancetype)initWithCancleButtonTitle:(NSString *)title
                         firstButtonTitle:(NSString *)title
                        secondButtonTitle:(NSString *)title;
- (void)showInView:(UIView *)view;

@end
