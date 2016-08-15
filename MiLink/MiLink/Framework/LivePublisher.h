//
//  LivePublisher.h
//  NodeMediaClient v1.1.1
//
//  Created by Mingliang Chen on 15/8/21.
//  Copyright (c) 2015年 NodeMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AAC_PROFILE_LC 0                //LC-AAC
#define AAC_PROFILE_HE 1                //HE-AAC

#define AVC_PROFILE_BASELINE 0          //H.264 Baseline profile
#define AVC_PROFILE_MAIN     1          //H.264 Main profile
#define AVC_PROFILE_HIGH     2          //H.264 High profile

#define CAMERA_BACK  0                  //后置摄像头
#define CAMERA_FRONT 1                  //前置摄像头


#define VIDEO_ORI_PORTRAIT 0            //Home 键在下的 竖屏 9:16 方向
#define VIDEO_ORI_LANDSCAPE 1           //Home 键在右的 横屏 16:9 方向
#define VIDEO_ORI_PORTRAIT_REVERSE 2    //Home 键在上的 竖屏 9:16 方向
#define VIDEO_ORI_LANDSCAPE_REVERSE 3   //Home 键在左的 横屏 16:9 方向

/*
 * RTMP Publishing Type 
 * rtmp_specification_1.0.pdf 
 * 7.2.2.6. publish
 */
#define PUBLISH_TYPE_LIVE 0             //rtmp 发布类型 'live'  默认值 不设置就为该值
#define PUBLISH_TYPE_RECORD 1           //rtmp 发布类型 'record'
#define PUBLISH_TYPE_APPEND 2           //rtmp 发布类型 'append'

@protocol LivePublisherDelegate

-(void) onEventCallback:(int)event msg:(NSString*)msg;

@end


@interface LivePublisher : NSObject

@property (nonatomic, weak) id<LivePublisherDelegate> livePublisherDelegate;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *swfUrl;
@property (nonatomic) int publishType;

///关键帧间隔,单位秒,默认1
@property (nonatomic) int keyFrameInterval;

-(int) setAudioParamBitrate:(int)bitrate aacProfile:(int)aacProfile;
-(int) setVideoParamWidth:(int)width height:(int)height fps:(int)fps bitrate:(int)bitrate avcProfile:(int)avcProfile;
-(int) setCameraOrientation:(UIInterfaceOrientation)ori;
-(int) setVideoOrientation:(int)ori;
-(int) startPreview:(UIView*)preview camId:(int)camId frontMirror:(BOOL)mirror;
-(int) stopPreview;
-(int) switchCamera;
-(int) startPublish:(NSString*)rtmpUrl;
-(int) stopPublish;
-(int) setDenoiseEnable:(BOOL)denoise;
-(int) setMicEnable:(BOOL)micEnable;
-(int) setCamEnable:(BOOL)camEnable;
-(int) setFlashEnable:(BOOL)flashEnable;
-(int) setSmoothSkinLevel:(int)level;
-(int) setHWEnable:(BOOL)hwEnable;
-(void) capturePicture:(NSString*)filePath;
-(void) requestFocusWithAuto:(BOOL)autoFocus;
@end
