//
//  NSObject+FrameworkCheck.m
//  MiLinkFramework
//
//  Created by Cain on 10/8/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "NSObject+FrameworkCheck.h"

static NSString *const AspBundleVersionString = @"CFBundleShortVersionString";


@implementation NSObject (FrameworkCheck)

+ (void)load {
    
    NSString *bundleID = [self milink_bundleIdentifier];
    NSString *bundleVersion = [self milink_bundleVersion];
    
    BOOL isBundleID = [bundleID  isEqualToString: @"com.wx1wx.MiLinkDevelopment"] || [bundleID isEqualToString:@"com.ysj.MiLink"];
    BOOL isBundleVersion = [bundleVersion isEqualToString:@"1.0.1"];
    
    if (!isBundleID && !isBundleVersion) {
        [self exceptionMessage:@"MiLinkFramewok" reason:@"You do not have permission to use"];
    }
}

+ (void)exceptionMessage:(NSString *)message reason:(NSString *)reason {
    @throw [NSException exceptionWithName:message reason:reason userInfo:nil];
}

+ (NSString *)milink_bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)milink_bundleVersion {
    return [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
