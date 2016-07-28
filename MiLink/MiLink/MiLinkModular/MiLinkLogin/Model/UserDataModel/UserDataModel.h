//
//  UserDataModel.h
//  MiLink
//
//  Created by Cain on 26/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *loginTime;
@property (nonatomic, copy) NSString *pushUrl;

@end
