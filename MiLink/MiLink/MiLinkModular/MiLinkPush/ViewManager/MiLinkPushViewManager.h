//
//  MiLinkPushViewManager.h
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiLinkPushViewManager : NSObject

- (instancetype)initPushViewManagerWithController:(UIViewController *)controller;

- (void)reloadLoginView;

@end
