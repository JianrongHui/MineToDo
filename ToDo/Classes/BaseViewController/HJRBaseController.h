//
//  HJRBaseController.h
//  ToDo
//
//  Created by 辉建荣 on 15/10/26.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJRBaseController : UIViewController

- (void)backAction:(id)sender;
- (void)rightBarButtonAction:(id)sender;
- (void)setupRightBarButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end
