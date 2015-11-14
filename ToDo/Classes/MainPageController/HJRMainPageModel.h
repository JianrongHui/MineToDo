//
//  HJRMainPageModel.h
//  ToDo
//
//  Created by 辉建荣 on 15/10/29.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EAffairLevel) {
    eLowLevel = 0,
    eMiddleLevel,
    eHightLevel,
    eEmergencyLevel
    
};

@interface HJRMainPageModel : NSObject

// 事项的紧急程度
@property (nonatomic, assign) EAffairLevel affairLevel;
// 事项描述
@property (nonatomic, copy) NSString *affairName;
// 事项时间
@property (nonatomic, copy) NSString *affairTime;
// 


@end
