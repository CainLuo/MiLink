//
//  MiLinkRTMPTarBar.h
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiLinkRTMPTarBar : UIView

@property (nonatomic, copy) void(^miLinkMicroPhoneBlock)(UIButton *sender);
@property (nonatomic, copy) void(^miLinkChangeCameraBlock)(UIButton *sender);
@property (nonatomic, copy) void(^miLinkRecordingBlock)(UIButton *sender);
@property (nonatomic, copy) void(^miLinkPhotoFlashBlock)(UIButton *sender);
@property (nonatomic, copy) void(^miLinkScreenshotsBlock)(UIButton *sender);

@property (nonatomic, strong, readonly) UIButton *microphoneButton;
@property (nonatomic, strong, readonly) UIButton *changeCameraButton;
@property (nonatomic, strong, readonly) UIButton *recordingButton;
@property (nonatomic, strong, readonly) UIButton *photoFlashButton;
@property (nonatomic, strong, readonly) UIButton *screenshotsButton;

@end
