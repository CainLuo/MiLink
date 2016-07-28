//
//  MiLinkRTMPTarBar.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkRTMPTarBar.h"

@interface MiLinkRTMPTarBar()

@property (nonatomic, strong, readwrite) UIButton *microphoneButton;
@property (nonatomic, strong, readwrite) UIButton *changeCameraButton;
@property (nonatomic, strong, readwrite) UIButton *recordingButton;
@property (nonatomic, strong, readwrite) UIButton *photoFlashButton;
@property (nonatomic, strong, readwrite) UIButton *screenshotsButton;

@end

@implementation MiLinkRTMPTarBar

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.7];
        
        [self addSubview:self.microphoneButton];
        [self addSubview:self.changeCameraButton];
        [self addSubview:self.recordingButton];
        [self addSubview:self.photoFlashButton];
        [self addSubview:self.screenshotsButton];
        
        [self addConstraints];
    }
    
    return self;
}

- (void)addConstraints {
    
    [self.microphoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerY;
        make.left.equalTo(self).offset(CAL_WIDTH_TO_FIT(50));
        make.height.width.equalTo(self.mas_height);
    }];
    
    [self.changeCameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerY;
        make.left.equalTo(self.microphoneButton.mas_right).offset(CAL_WIDTH_TO_FIT(50));
        make.height.width.equalTo(self.mas_height);
    }];

    [self.recordingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.center;
        make.height.width.equalTo(self.mas_height);
    }];

    [self.photoFlashButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerY;
        make.right.equalTo(self.screenshotsButton.mas_left).offset(CAL_WIDTH_TO_FIT(-50));
        make.height.width.equalTo(self.mas_height);
    }];

    [self.screenshotsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.centerY;
        make.right.equalTo(self).offset(CAL_WIDTH_TO_FIT(-50));
        make.height.width.equalTo(self.mas_height);
    }];
}

#pragma mark - Init Micro Phont Button
- (UIButton *)microphoneButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_microphoneButton);
    
    _microphoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_microphoneButton setImage:[UIImage imageNamed:@"icon_microphone_on"]
                       forState:UIControlStateNormal];
    
    [_microphoneButton addTarget:self
                          action:@selector(microphoneButtonAction:)
                forControlEvents:UIControlEventTouchUpInside];
    
    return _microphoneButton;
}

- (void)microphoneButtonAction:(UIButton *)sender {
    
    if (self.miLinkMicroPhoneBlock) {
        self.miLinkMicroPhoneBlock(sender);
    }
}

#pragma mark - Init Change Camera Button
- (UIButton *)changeCameraButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_changeCameraButton);
    
    _changeCameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_changeCameraButton setImage:[UIImage imageNamed:@"icon_camera_change"]
                         forState:UIControlStateNormal];
    
    [_changeCameraButton addTarget:self
                            action:@selector(changeCameraButtonAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    return _changeCameraButton;
}

- (void)changeCameraButtonAction:(UIButton *)sender {

    if (self.miLinkChangeCameraBlock) {
        self.miLinkChangeCameraBlock(sender);
    }
}

#pragma mark - Init Recording Button
- (UIButton *)recordingButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_recordingButton);
    
    _recordingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_recordingButton setImage:[UIImage imageNamed:@"icon_video_start"]
                      forState:UIControlStateNormal];
    
    [_recordingButton addTarget:self
                         action:@selector(recordingButtonAction:)
               forControlEvents:UIControlEventTouchUpInside];
    
    return _recordingButton;
}

- (void)setRecordingImage:(UIImage *)recordingImage {
    
    [_recordingButton setImage:recordingImage
                      forState:UIControlStateNormal];
}

- (void)recordingButtonAction:(UIButton *)sender {
    
    if (self.miLinkRecordingBlock) {
        self.miLinkRecordingBlock(sender);
    }
}

#pragma mark - Init Photo Flash Button
- (UIButton *)photoFlashButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_photoFlashButton);
    
    _photoFlashButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_photoFlashButton setImage:[UIImage imageNamed:@"icon_flash_off"]
                       forState:UIControlStateNormal];
    
    [_photoFlashButton addTarget:self
                          action:@selector(photoFlashButtonAction:)
                forControlEvents:UIControlEventTouchUpInside];
    
    return _photoFlashButton;
}

- (void)photoFlashButtonAction:(UIButton *)sender {
    
    if (self.miLinkPhotoFlashBlock) {
        self.miLinkPhotoFlashBlock(sender);
    }
}

#pragma mark - Init Screenshots Button
- (UIButton *)screenshotsButton {
    
    CAL_GET_METHOD_RETURN_OBJC(_screenshotsButton);
    
    _screenshotsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_screenshotsButton setImage:[UIImage imageNamed:@"icon_screenshots"]
                        forState:UIControlStateNormal];
    
    [_screenshotsButton addTarget:self
                           action:@selector(screenshotsButtonAction:)
                 forControlEvents:UIControlEventTouchUpInside];
    
    return _screenshotsButton;
}

- (void)screenshotsButtonAction:(UIButton *)sender {
    
    if (self.miLinkScreenshotsBlock) {
        self.miLinkScreenshotsBlock(sender);
    }
}

@end
