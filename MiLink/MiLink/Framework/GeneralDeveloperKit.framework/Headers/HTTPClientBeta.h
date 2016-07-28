//
//  HTTPClientBeta.h
//  MiGuFM
//
//  Created by LiuYing on 16/1/22.
//  Copyright © 2016年 LiuYing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface HTTPClientBeta : NSObject

+ (instancetype)sharedInstance;

- (void)GET:(NSString *)URLString successBlock:(void (^)(NSDictionary *))successBlock failureBlock:(void (^)(NSError *))failureBlock;

@end

NS_ASSUME_NONNULL_END
