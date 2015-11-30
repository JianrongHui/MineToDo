//
//  HJRConfig.h
//  ToDo
//
//  Created by yang on 15/11/27.
//  Copyright © 2015年 nxone. All rights reserved.
//

#ifndef HJRConfig_h
#define HJRConfig_h

//=============== UIColor
#define KHEXCOLOR(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]
#define KBACKGROUNDCOLOR KHEXCOLOR(0xeeeeee)

//=============== 系统版本
#define KIOS8_LATER [[[UIDevice currentDevice] systemVersion] floatValue]>=8.0

//=============== 屏幕尺寸
#define KIPHONEWIDTH [UIScreen mainScreen].bounds.size.width
#define KIPHOENHEIGHT [UIScreen mainScreen].bounds.size.height
#define KVIEWWIDTH(view) view.frame.size.width

#endif /* HJRConfig_h */
