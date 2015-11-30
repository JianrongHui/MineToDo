//
//  HJRInputCell.h
//  ToDo
//
//  Created by yang on 15/11/25.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJRInputCell : UITableViewCell

@property (nonatomic, copy) NSString *cellTitle;
@property (weak, nonatomic) IBOutlet UITextField *inputTextView;

@end
