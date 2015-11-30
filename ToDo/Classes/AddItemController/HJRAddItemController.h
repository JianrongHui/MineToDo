//
//  HJRAddItemController.h
//  ToDo
//
//  Created by 辉建荣 on 15/11/24.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRBaseController.h"

@class HJRDetailDTO;
@interface HJRAddItemController : HJRBaseController

@property (nonatomic, copy) void (^returnBlock)(HJRDetailDTO *dto);

@end
