//
//  MiLinkRTMPViewManager.h
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiLinkRTMPNavigationBar.h"
#import "MiLinkRTMPTarBar.h"


@interface MiLinkRTMPViewManager : NSObject

- (instancetype)initRTMPViewManagerWithController:(UIViewController *)controller;

- (void)reloadViewManager;

@property (nonatomic, strong) MiLinkRTMPNavigationBar *miLinkNavigationBar;
@property (nonatomic, strong) MiLinkRTMPTarBar        *miLinkRTMPTarBar;

@end
