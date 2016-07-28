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

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self.loginViewManager reloadLoginView: NO];
}

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
        
    return UIInterfaceOrientationMaskPortrait;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (MiLinkLoginViewManager *)loginViewManager {
    
    CAL_GET_METHOD_RETURN_OBJC(_loginViewManager);
    
    _loginViewManager = [[MiLinkLoginViewManager alloc] initLoginViewManagerWithController:self];

    return _loginViewManager;
}

@end
