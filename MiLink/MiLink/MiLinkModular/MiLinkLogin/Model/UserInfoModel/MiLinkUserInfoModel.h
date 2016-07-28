//
//  MiLinkUserInfoModel.h
//  MiLink
//
//  Created by Cain on 26/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDataModel.h"

@interface MiLinkUserInfoModel : NSObject

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) UserDataModel *data;

@end
