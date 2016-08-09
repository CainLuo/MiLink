//
//  MiLinkLoginViewManager.m
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkLoginViewManager.h"
#import "MiLinkLoginController.h"
#import "MiLinkLoginView.h"
#import "MiLinkLoginModel.h"
#import "MiLinkRTMPController.h"
#import "MiLinkDemonstrationView.h"
#import "MiLinkPushController.h"

@interface MiLinkLoginViewManager()

@property (nonatomic, strong) MiLinkLoginController   *loginController;
@property (nonatomic, strong) MiLinkLoginView         *loginView;
@property (nonatomic, strong) MiLinkLoginModel        *loginModel;
@property (nonatomic, strong) MiLinkDemonstrationView *demonstrationView;
@property (nonatomic, strong) MiLinkRTMPController    *miLinkRTMPController;

@end

@implementation MiLinkLoginViewManager

- (instancetype)initLoginViewManagerWithController:(UIViewController *)controller {
    
    if (self = [super init]) {
        
        self.loginController = (MiLinkLoginController *)controller;
    }
    
    return self;
}

- (void)reloadLoginView:(BOOL)isLogin {
    
    if (isLogin) {
        
//        [self.loginView removeFromSuperview];
//        
//        [self.loginController.view addSubview:self.demonstrationView];
//        
//        [self.demonstrationView mas_makeConstraints:^(MASConstraintMaker *make) {
//            (void)make.edges;
//        }];
//        
//        CAL_WEAK_SELF(weakSelf);
//        
//        [self.demonstrationView setMiLinkDemonstrationBlock:^{
//            
//            MiLinkRTMPController *miLinkRTMPController = [[MiLinkRTMPController alloc] init];
//                        
//            [weakSelf.loginController presentViewController:miLinkRTMPController
//                                                   animated:YES
//                                                 completion:nil];
//        }];
        
        MiLinkPushController *pushController = [[MiLinkPushController alloc] init];
        
        [self.loginController.navigationController pushViewController:pushController
                                                             animated:YES];
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        
        return;
    }

    [self.loginController.view addSubview:self.loginView];
}

- (MiLinkLoginView *)loginView {
    
    CAL_GET_METHOD_RETURN_OBJC(_loginView);
    
    _loginView = [[MiLinkLoginView alloc] init];
    
    CAL_WEAK_SELF(weakSelf);
    
    [_loginView setMiLinkLoginButtonBlock:^(NSDictionary *userInfo) {
                
        MiLinkLoginModel *loginModel = [[MiLinkLoginModel alloc] initLoginModelWithController:weakSelf.loginController];
        
        [loginModel loginMiLinkWithUserInfo:userInfo];
    }];
    
    return _loginView;
}

- (MiLinkLoginModel *)loginModel {
    
    CAL_GET_METHOD_RETURN_OBJC(_loginModel);
    
    _loginModel = [[MiLinkLoginModel alloc] initLoginModelWithController:self.loginController];
    
    return _loginModel;
}

- (MiLinkDemonstrationView *)demonstrationView {
    
    CAL_GET_METHOD_RETURN_OBJC(_demonstrationView);
    
    _demonstrationView = [[MiLinkDemonstrationView alloc] init];
    
    return _demonstrationView;
}

@end
