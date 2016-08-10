//
//  MiLinkFramework.h
//  MiLinkFramework
//
//  Created by Cain on 10/8/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CAL_OBJC_IS_NIL(objc) ((objc) ? (NO) : (YES))

#define CAL_GET_METHOD_RETURN_OBJC(objc) if (objc) return objc

#define CAL_WEAK_SELF(weakSelf) __weak __typeof(&*self)weakSelf = self

#define CAL_COLOR_FROM_HEX_CODE(hexCode)    [UIColor colorWithRed:((float)((hexCode & 0xFF0000) >> 16))/255.0 green:((float)((hexCode & 0xFF00) >> 8))/255.0 blue:((float)(hexCode & 0xFF))/255.0 alpha:1.0]

#pragma mark - Device Screen Size Fit
#define CAL_SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define CAL_SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define CAL_WIDTH_TO_FIT(wiDth)  (ceilf( [UIScreen mainScreen].bounds.size.width / 375.0f  * (wiDth / 2) * 2) \
/ 2.0f)

#pragma mark - Get Device System Version
#define GET_IOS_7_Device    ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0f)
#define GET_IOS_8_Device    ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f)

//! Project version number for MiLinkFramework.
FOUNDATION_EXPORT double MiLinkFrameworkVersionNumber;

//! Project version string for MiLinkFramework.
FOUNDATION_EXPORT const unsigned char MiLinkFrameworkVersionString[];

#import <MiLinkFramework/YYModel.h>
#import <MiLinkFramework/Masonry.h>
#import <MiLinkFramework/IQKeyboardManager.h>
#import <MiLinkFramework/AFNetworking.h>
#import <MiLinkFramework/MBProgressHUD.h>
#import <MiLinkFramework/NSObject+FrameworkCheck.h>
