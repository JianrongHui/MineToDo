//
//  HJRBaseController+HJRAdd.m
//  ToDo
//
//  Created by yang on 15/11/28.
//  Copyright © 2015年 nxone. All rights reserved.
//

#import "HJRBaseController+HJRAdd.h"

@implementation HJRBaseController (HJRAdd)

- (BOOL)hjr_isAvailableAlbum
{
   return  [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL)hjr_isAvailableTakePhoto
{
    return  [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

@end
