//
//  MiLinkLoginController.m
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkLoginController.h"

@interface MiLinkLoginController ()

@property (nonatomic, strong, readwrite) MiLinkLoginViewManager *loginViewManager;

@end

@implementation MiLinkLoginController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [AppDelegate userInfoAppDelegate].mask = UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self.loginViewManager reloadLoginView: NO];
}

#pragma mark - 设置屏幕只能竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
        
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - 取消响应者事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Init Login View Manager
- (MiLinkLoginViewManager *)loginViewManager {
    
    CAL_GET_METHOD_RETURN_OBJC(_loginViewManager);
    
    _loginViewManager = [[MiLinkLoginViewManager alloc] initLoginViewManagerWithController:self];

    return _loginViewManager;
}

@end
