//
//  MiLinkRTMPController.m
//  MiLink
//
//  Created by Cain on 26/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkRTMPController.h"
#import "MiLinkRTMPViewManager.h"

@interface MiLinkRTMPController () <LivePublisherDelegate>

@property (nonatomic, strong) MiLinkRTMPViewManager *miLinkRTMPViewManager;
@property (nonatomic, strong) LivePublisher         *livePublisher;
@property (nonatomic, strong) MBProgressHUD         *progressHUD;

@end

@implementation MiLinkRTMPController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    dispatch_async(dispatch_queue_create("close_dispatch",0), ^{
        
        [_livePublisher stopPreview];
        [_livePublisher stopPublish];
        
        _livePublisher = nil;
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.miLinkRTMPViewManager reloadViewManager];
    [self viewManagerBlock];
    [self initLivePublisher];
}

#pragma mark - Init Live Publisher
- (void)initLivePublisher {
    
    _livePublisher = [[LivePublisher alloc] init];
    _livePublisher.livePublisherDelegate = self;
    
    [_livePublisher setAudioParamBitrate:32 * 1000
                              aacProfile:AAC_PROFILE_HE];
    
    [_livePublisher setVideoParamWidth:1280
                                height:720
                                   fps:15
                               bitrate:500 * 1000
                            avcProfile:AVC_PROFILE_HIGH];
    
    [_livePublisher setDenoiseEnable:YES];
    [_livePublisher setSmoothSkinLevel:0];
    [_livePublisher setHWEnable:YES];
    
    [_livePublisher startPreview:self.view
                           camId:CAMERA_BACK
                     frontMirror:YES];
}

#pragma mark - Set Screen
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    
    [self.livePublisher setCameraOrientation:toInterfaceOrientation];

    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            [self.livePublisher setVideoOrientation:VIDEO_ORI_PORTRAIT];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            [self.livePublisher setVideoOrientation:VIDEO_ORI_PORTRAIT_REVERSE];
            break;
        case UIInterfaceOrientationLandscapeLeft:
            [self.livePublisher setVideoOrientation:VIDEO_ORI_LANDSCAPE_REVERSE];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [self.livePublisher setVideoOrientation:VIDEO_ORI_LANDSCAPE];
            break;
            
        default:
            break;
    }
}

#pragma mark - Init MiLink RTMP View Manager
- (MiLinkRTMPViewManager *)miLinkRTMPViewManager {
    
    CAL_GET_METHOD_RETURN_OBJC(_miLinkRTMPViewManager);
    
    _miLinkRTMPViewManager = [[MiLinkRTMPViewManager alloc] initRTMPViewManagerWithController:self];
    
    return _miLinkRTMPViewManager;
}

- (void)viewManagerBlock {
    
    CAL_WEAK_SELF(weakSelf);
    
    [self.miLinkRTMPViewManager.miLinkRTMPTarBar setMiLinkMicroPhoneBlock:^(UIButton *sender) {
        
        if (sender.tag == 0) {
            
            [weakSelf.livePublisher setMicEnable:NO];

            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_microphone_off"];

            sender.tag = 1;
        } else {
        
            [weakSelf.livePublisher setMicEnable:YES];
            
            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_microphone_on"];

            sender.tag = 0;
        }
    }];
    
    [self.miLinkRTMPViewManager.miLinkRTMPTarBar setMiLinkChangeCameraBlock:^(UIButton *sender) {
        
        [weakSelf.livePublisher setFlashEnable:NO];

        [weakSelf.livePublisher switchCamera];
        [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                       changeImage:@"icon_camera_change"];
    }];
    
    [self.miLinkRTMPViewManager.miLinkRTMPTarBar setMiLinkRecordingBlock:^(UIButton *sender) {
        
        if (sender.tag == 0) {
            
            weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.switchFrameRateButton.enabled = NO;
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [weakSelf.livePublisher startPublish:RTMP_PUSH_URL];
                });
            });
            
            weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 开始连接";

            [weakSelf.miLinkRTMPViewManager.miLinkRTMPTarBar.recordingButton setImage:[UIImage imageNamed:@"icon_video_stop"]
                                                                         forState:UIControlStateNormal];

            sender.tag = 1;
        } else {
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [weakSelf.livePublisher stopPublish];
                });
            });
            
            [weakSelf.miLinkRTMPViewManager.miLinkRTMPTarBar.recordingButton setImage:[UIImage imageNamed:@"icon_video_start"]
                                                                         forState:UIControlStateNormal];
            
            weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.switchFrameRateButton.enabled = YES;

            sender.tag = 0;
        }
    }];
    
    [self.miLinkRTMPViewManager.miLinkRTMPTarBar setMiLinkPhotoFlashBlock:^(UIButton *sender) {
        
        if (sender.tag == 0) {
            
            [weakSelf.livePublisher setFlashEnable:YES];
            
            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_flash_on"];
            
            sender.tag = 1;
        } else {
            
            [weakSelf.livePublisher setFlashEnable:NO];
            
            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_flash_off"];
            
            sender.tag = 0;
        }
    }];
    
    [self.miLinkRTMPViewManager.miLinkRTMPTarBar setMiLinkCameraBlock:^(UIButton *sender) {
        
        if (sender.tag == 0) {
            
            [weakSelf.livePublisher setCamEnable:NO];
            
            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_camera_off"];
            
            sender.tag = 1;
        } else {
            
            [weakSelf.livePublisher setCamEnable:YES];
            
            [weakSelf animationOptionTransitionFlipFromRightWithButton:sender
                                                           changeImage:@"icon_camera_on"];
            
            sender.tag = 0;
        }
    }];
    
    [self.miLinkRTMPViewManager.miLinkNavigationBar setMiLinkSwitchFrameRateButtonBlock:^(UIButton *sender) {
        
        [weakSelf.progressHUD showAnimated:YES];
        
        if (sender.tag == 0) {
            
            [sender setTitle:@"标清"
                    forState:UIControlStateNormal];
            
            sender.tag = 1;
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [weakSelf.livePublisher setVideoParamWidth:640
                                                        height:360
                                                           fps:15
                                                       bitrate:500 * 1000
                                                    avcProfile:AVC_PROFILE_MAIN];
                });
            });

        } else {

            [sender setTitle:@"高清"
                    forState:UIControlStateNormal];

            sender.tag = 0;
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [weakSelf.livePublisher setVideoParamWidth:1280
                                                        height:720
                                                           fps:15
                                                       bitrate:500 * 1000
                                                    avcProfile:AVC_PROFILE_HIGH];
                });
            });
        }
    }];
}

- (void)onEventCallback:(int)event msg:(NSString *)msg {
    
    NSLog(@"Event: %d, message: %@", event, msg);
    
    CAL_WEAK_SELF(weakSelf);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (event) {
            case 2000:
                //发布流开始连接
                
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 开始连接";
                
                break;
            case 2001: {
                //发布流连接成功 开始发布
                
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 已连接";
            }
                break;
            case 2002:
                //发布流连接失败
                
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 连接失败";
                
                break;
            case 2004:
                //停止发布
                
                [weakSelf.miLinkRTMPViewManager.miLinkRTMPTarBar.recordingButton setImage:[UIImage imageNamed:@"icon_video_start"]
                                                                                 forState:UIControlStateNormal];

                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 未连接";
                
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.switchFrameRateButton.enabled = YES;

                break;
            case 2005:
                //发布中遇到网络异常
                
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 连接失败";

                break;
            case 2100:
                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 等待连接";

                break;
            case 2101:

                weakSelf.miLinkRTMPViewManager.miLinkNavigationBar.titleString = @"直播状态: 已连接";
                
                break;
            default:
                break;
        }
    });
}

- (void)animationOptionTransitionFlipFromRightWithButton:(UIButton *)sender
                                             changeImage:(NSString *)image {
    
    [UIView transitionWithView:sender
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        
                        if (sender.tag == 0) {
                            sender.tag = 1;
                            
                            [sender setImage:[UIImage imageNamed:image]
                                    forState:UIControlStateNormal];
                        } else {
                            sender.tag = 0;
                            
                            [sender setImage:[UIImage imageNamed:image]
                                    forState:UIControlStateNormal];
                        }
                        
                    } completion:nil];
}

- (MBProgressHUD *)progressHUD {
    
    CAL_GET_METHOD_RETURN_OBJC(_progressHUD);
    
    _progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    return _progressHUD;
}

@end
