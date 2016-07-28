//
//  MiLinkNavigationBar.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkRTMPNavigationBar.h"

@interface MiLinkRTMPNavigationBar()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel  *titleLabel;

@property (nonatomic, strong, readwrite) UIButton *switchFrameRateButton;

@end

@implementation MiLinkRTMPNavigationBar

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.7];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.backButton];
        [self addSubview:self.switchFrameRateButton];
        
        [self addConstraints];
    }
    
    return self;
}

- (void)addConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.mas_equalTo(CAL_WIDTH_TO_FIT(85));
    }];
    
    [self.switchFrameRateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(20, 0, 0, 0));
        make.width.mas_equalTo(CAL_WIDTH_TO_FIT(140));
    }];
}

#pragma mark - Init Back Button
- (UIButton *)backButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_backButton);
    
    _backButton = [[UIButton alloc] init];
    
    [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    return _backButton;
}

- (void)backButtonAction {
    
    if (self.miLinkNavigationBackBlock) {
        self.miLinkNavigationBackBlock();
    }
}

#pragma mark - Init Title Label
- (UILabel *)titleLabel {
    
    CAL_GET_METHOD_RETURN_OBJC(_titleLabel);
    
    _titleLabel = [[UILabel alloc] init];
    
    _titleLabel.text = @"直播状态: 未连接";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    
    return _titleLabel;
}

#pragma mark - Init Switch Frame Rate Button
- (UIButton *)switchFrameRateButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_switchFrameRateButton);
    
    _switchFrameRateButton = [[UIButton alloc] init];
    
    [_switchFrameRateButton setTitle:@"高清" forState:UIControlStateNormal];
    [_switchFrameRateButton addTarget:self action:@selector(switchFrameRateButton:) forControlEvents:UIControlEventTouchUpInside];

    return _switchFrameRateButton;
}

- (void)switchFrameRateButton:(UIButton *)sender {
    
    if (self.miLinkSwitchFrameRateButtonBlock) {
        self.miLinkSwitchFrameRateButtonBlock(sender);
    }
}


@end
