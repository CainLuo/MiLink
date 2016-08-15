//
//  LivePlayer.h
//  NodeMediaClient v1.1.1
//
//  Created by Mingliang Chen on 15/8/21.
//  Copyright (c) 2015年 NodeMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LivePlayerDelegate

-(void) onEventCallback:(int)event msg:(NSString*)msg;

@end


@interface LivePlayer : NSObject

@property (nonatomic, weak) id<LivePlayerDelegate> livePlayerDelegate;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *swfUrl;
@property (nonatomic) int bufferTime;
@property (nonatomic) int maxBufferTime;

/**
 * 是否通过发送receiveAudio 和 receiveVideo command 来控制接受音视频流
 * 目前测试fms和red5有效
 * 注意，暂时只能在开始播放前设置有效，播放中途暂时无法关闭或开启
 */
@property (nonatomic) bool receiveAudio;
@property (nonatomic) bool receiveVideo;

/**
 * 
 */
@property (nonatomic) bool subscribe;

-(int) setUIView:(UIView*)playVideoView ContentMode:(UIViewContentMode)contentMode;
-(int) startPlay:(NSString*)rtmpUrl;
-(int) stopPlay;
-(BOOL) capturePicture:(NSString*)filePath;
-(int) getBufferLength;
@end
