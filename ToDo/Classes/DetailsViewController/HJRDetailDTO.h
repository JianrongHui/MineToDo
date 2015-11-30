//
//  HJRDetailDTO.h
//  ToDo
//
//  Created by yang on 15/11/29.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
@interface HJRDetailDTO : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSArray *timeArray;
@property (nonatomic, copy) NSArray *ruleArray;

@end
