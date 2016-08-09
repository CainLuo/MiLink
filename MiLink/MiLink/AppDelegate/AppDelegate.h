//
//  AppDelegate.h
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (AppDelegate *)userInfoAppDelegate;

@property (nonatomic, copy) NSString *pushURL;
@property (nonatomic, assign) NSInteger mask;

@property (strong, nonatomic) UIWindow *window;

@end

