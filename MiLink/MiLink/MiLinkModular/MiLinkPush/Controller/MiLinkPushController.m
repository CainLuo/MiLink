//
//  MiLinkPushController.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkPushController.h"
#import "MiLinkPushViewManager.h"

@interface MiLinkPushController ()

@property (nonatomic, strong) MiLinkPushViewManager *pushViewManager;

@end

@implementation MiLinkPushController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    [AppDelegate userInfoAppDelegate].mask = UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pushViewManager reloadLoginView];
        
    [self supportedInterfaceOrientations];
}

- (MiLinkPushViewManager *)pushViewManager {
    
    CAL_GET_METHOD_RETURN_OBJC(_pushViewManager);
    
    _pushViewManager = [[MiLinkPushViewManager alloc] initPushViewManagerWithController:self];
    
    return _pushViewManager;
}

@end
