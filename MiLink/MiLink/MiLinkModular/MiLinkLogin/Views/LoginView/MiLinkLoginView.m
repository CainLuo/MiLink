//
//  MiLinkLoginView.m
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkLoginView.h"

@interface MiLinkLoginView() <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIButton    *loginButton;

@end

@implementation MiLinkLoginView

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, CAL_SCREEN_WIDTH, CAL_SCREEN_HEIGHT);
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.logoImageView];
        [self addSubview:self.accountTextField];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.loginButton];
        
        [self addConstraints];
    }
    
    return self;
}

- (void)addConstraints {
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(CAL_WIDTH_TO_FIT(300));
        make.height.mas_equalTo(CAL_WIDTH_TO_FIT(80));
        make.centerY.equalTo(self).multipliedBy(0.4);
        make.centerX.equalTo(self);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, CAL_WIDTH_TO_FIT(100), 0, CAL_WIDTH_TO_FIT(100)));
        make.height.mas_equalTo(CAL_WIDTH_TO_FIT(80));
        make.centerY.equalTo(self).multipliedBy(0.8);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.accountTextField);
        make.top.equalTo(self.accountTextField.mas_bottom).offset(CAL_WIDTH_TO_FIT(30));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.height.equalTo(self.accountTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(CAL_WIDTH_TO_FIT(60));
    }];
}

- (UIImageView *)logoImageView {
    
    CAL_GET_METHOD_RETURN_OBJC(_logoImageView);
    
    _logoImageView = [[UIImageView alloc] init];
    
    _logoImageView.image       = [UIImage imageNamed:@"icon_logo"];
    
    return _logoImageView;
}

- (UITextField *)accountTextField {
    
    CAL_GET_METHOD_RETURN_OBJC(_accountTextField);
    
    _accountTextField = [[UITextField alloc] init];
    
    _accountTextField.delegate = self;
    
    _accountTextField.layer.borderWidth = 1.0f;
    _accountTextField.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
    _accountTextField.placeholder = @"账号";
    _accountTextField.font = [UIFont systemFontOfSize:16];
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_name"]];
    leftImageView.frame = CGRectMake(0, 0, 31, 21);
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;

    _accountTextField.leftViewMode = UITextFieldViewModeAlways;
    _accountTextField.leftView = leftImageView;
    _accountTextField.keyboardType = UIKeyboardTypeASCIICapable;
    _accountTextField.returnKeyType = UIReturnKeyNext;
    _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accountTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]) {
        
        _accountTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    }

    return _accountTextField;
}

- (UITextField *)passwordTextField {
    
    CAL_GET_METHOD_RETURN_OBJC(_passwordTextField);
    
    _passwordTextField = [[UITextField alloc] init];
    
    _passwordTextField.delegate = self;
    
    _passwordTextField.layer.borderWidth = 1.0f;
    _passwordTextField.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
    _passwordTextField.placeholder = @"密码";
    _passwordTextField.font = [UIFont systemFontOfSize:16];
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_password"]];
    leftImageView.frame = CGRectMake(0, 0, 31, 21);
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.leftView = leftImageView;
    
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.keyboardType = UIKeyboardTypeAlphabet;
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;

    return _passwordTextField;
}

- (UIButton *)loginButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_loginButton);
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    _loginButton.titleLabel.textColor = [UIColor whiteColor];
    _loginButton.titleLabel.adjustsFontSizeToFitWidth = YES;

    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"icon_login_button"] forState:UIControlStateNormal];
    
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _loginButton;
}

- (void)loginButtonAction {
    
    if (self.miLinkLoginButtonBlock) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                            message:@""
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
        
        if (self.accountTextField.text.length <= 0) {
            
            alertView.message = @"您尚未输入账号, 请输入账号后重试";
            [alertView show];
            
            return;
        }
        
        if (self.passwordTextField.text.length <= 0) {
            
            alertView.message = @"您尚未输入密码, 请输入账号后重试";
            [alertView show];
            
            return;
        }
        
        NSDictionary *userInfo = @{@"username" : self.accountTextField.text,
                                   @"pwd" : self.passwordTextField.text};
        
        self.miLinkLoginButtonBlock(userInfo);
    }
}

@end
