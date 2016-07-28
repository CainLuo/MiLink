//
//  MiLinkNavigationBar.h
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiLinkRTMPNavigationBar : UIView

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) void(^miLinkNavigationBackBlock)(void);
@property (nonatomic, copy) void(^miLinkSwitchFrameRateButtonBlock)(UIButton *sender);

@property (nonatomic, strong, readonly) UIButton *switchFrameRateButton;

@end
