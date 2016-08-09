//
//  MiLinkDemonstrationView.m
//  MiLink
//
//  Created by Cain on 26/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkDemonstrationView.h"

@interface MiLinkDemonstrationView()

@property (nonatomic, strong) UIImageView *demonstrationImageView;
@property (nonatomic, strong) UIButton    *presentButton;
@property (nonatomic, strong) UILabel     *tipsLabel;

@end

@implementation MiLinkDemonstrationView

- (instancetype)init {
    
    if (self = [super init]) {
                
        [self addSubview:self.demonstrationImageView];
        [self addSubview:self.tipsLabel];
        [self addSubview:self.presentButton];
        
        [self addConstraints];
        
//        self.transform = CGAffineTransformMakeRotation(M_PI / 2);
    }
    
    return self;
}

- (void)addConstraints {
    
    [self.demonstrationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        (void)make.edges;
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, CAL_WIDTH_TO_FIT(150), 0, CAL_WIDTH_TO_FIT(150)));
    }];
    
    [self.presentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.tipsLabel);
        make.top.equalTo(self.tipsLabel.mas_bottom).offset(CAL_WIDTH_TO_FIT(40));
        make.size.mas_equalTo(CGSizeMake(CAL_WIDTH_TO_FIT(320), CAL_WIDTH_TO_FIT(80)));
    }];
}

#pragma mark - Init Demonstration Image View
- (UIImageView *)demonstrationImageView {
    
    CAL_GET_METHOD_RETURN_OBJC(_demonstrationImageView);
    
    _demonstrationImageView = [[UIImageView alloc] init];
    
    _demonstrationImageView.image = [UIImage imageNamed:@"icon_demo"];    

    return _demonstrationImageView;
}

#pragma mark - Init Present Button
- (UIButton *)presentButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_presentButton);
    
    _presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_presentButton setTitle:@"开始直播"
                    forState:UIControlStateNormal];
    
    [_presentButton setBackgroundImage:[UIImage imageNamed:@"icon_login_button"]
                              forState:UIControlStateNormal];
    
    [_presentButton addTarget:self
                       action:@selector(presentButtonAction)
             forControlEvents:UIControlEventTouchUpInside];
    
    return _presentButton;
}

- (void)presentButtonAction {
    
    if (self.miLinkDemonstrationBlock) {
        self.miLinkDemonstrationBlock();
    }
}

#pragma mark - Init Tips Label
- (UILabel *)tipsLabel {
    
    CAL_GET_METHOD_RETURN_OBJC(_tipsLabel);
    
    _tipsLabel = [[UILabel alloc] init];
    
    _tipsLabel.text      = @"请正确放置您的手机";
    _tipsLabel.font      = [UIFont systemFontOfSize:30];
    _tipsLabel.textColor = [UIColor whiteColor];
    
    _tipsLabel.textAlignment = NSTextAlignmentCenter;
    _tipsLabel.adjustsFontSizeToFitWidth = YES;
    
    return _tipsLabel;
}

@end
