//
//  MiLinkLoginController.h
//  MiLink
//
//  Created by Cain on 25/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiLinkLoginViewManager.h"

@interface MiLinkLoginController : UIViewController

@property (nonatomic, copy) NSString *pushUrl;

@property (nonatomic, strong, readonly) MiLinkLoginViewManager *loginViewManager;

@end
