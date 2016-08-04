//
//  MiLinkRTMPViewManager.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkRTMPViewManager.h"
#import "MiLinkRTMPController.h"

@interface MiLinkRTMPViewManager()

@property (nonatomic, strong) MiLinkRTMPController *miLinkRTMPController;

@end

@implementation MiLinkRTMPViewManager

- (instancetype)initRTMPViewManagerWithController:(UIViewController *)controller {
    
    if (self = [super init]) {
        
        _miLinkRTMPController = (MiLinkRTMPController *)controller;
    }
    
    return self;
}

#pragma mark - Reload View Manager
- (void)reloadViewManager {
    
    [self.miLinkRTMPController.view addSubview:self.miLinkNavigationBar];
    [self.miLinkRTMPController.view addSubview:self.miLinkRTMPTarBar];
    
    [self addConstraints];
}

- (void)addConstraints {
    
    [self.miLinkNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.top.left.right;
        make.height.mas_equalTo(54);
    }];
    
    [self.miLinkRTMPTarBar mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.bottom.left.right;
        make.height.mas_equalTo(54);
    }];
}

#pragma mark - Init MiLink Navigation Bar
- (MiLinkRTMPNavigationBar *)miLinkNavigationBar {
    
    CAL_GET_METHOD_RETURN_OBJC(_miLinkNavigationBar);
    
    CAL_WEAK_SELF(weakSelf);
    
    _miLinkNavigationBar = [[MiLinkRTMPNavigationBar alloc] init];
    
    [_miLinkNavigationBar setMiLinkNavigationBackBlock:^{

        [[UIApplication sharedApplication] setStatusBarHidden:YES];

        [weakSelf.miLinkRTMPController dismissViewControllerAnimated:YES
                                                          completion:nil];
    }];
    
    return _miLinkNavigationBar;
}

#pragma mark - Init MiLink RTMP Tar Bar
- (MiLinkRTMPTarBar *)miLinkRTMPTarBar {
    
    CAL_GET_METHOD_RETURN_OBJC(_miLinkRTMPTarBar);
    
    _miLinkRTMPTarBar = [[MiLinkRTMPTarBar alloc] init];
    
    return _miLinkRTMPTarBar;
}

@end
