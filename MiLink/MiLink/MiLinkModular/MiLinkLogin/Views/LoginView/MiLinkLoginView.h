//
//  MiLinkLoginView.h
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiLinkLoginView : UIView

@property (nonatomic, copy) void(^miLinkLoginButtonBlock)(NSDictionary *userInfo);

@end
