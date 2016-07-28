//
//  MiLinkPushController.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkPushController.h"
#import "MiLinkPushViewManager.h"

@interface MiLinkPushController ()

@property (nonatomic, strong) MiLinkPushViewManager *pushViewManager;

@end

@implementation MiLinkPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pushViewManager reloadLoginView];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self supportedInterfaceOrientations];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {

    NSLog(@"哈哈哈");
    
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (MiLinkPushViewManager *)pushViewManager {
    
    CAL_GET_METHOD_RETURN_OBJC(_pushViewManager);
    
    _pushViewManager = [[MiLinkPushViewManager alloc] initPushViewManagerWithController:self];
    
    return _pushViewManager;
}

@end
