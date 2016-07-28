//
//  MiLinkDemonstrationView.h
//  MiLink
//
//  Created by Cain on 26/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiLinkDemonstrationView : UIView

@property (nonatomic, copy) void(^miLinkDemonstrationBlock)(void);

@end
