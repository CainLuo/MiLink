//
//  MiLinkPushViewManager.m
//  MiLink
//
//  Created by Cain on 27/7/16.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import "MiLinkPushViewManager.h"
#import "MiLinkDemonstrationView.h"
#import "MiLinkPushController.h"
#import "MiLinkRTMPController.h"

@interface MiLinkPushViewManager()

@property (nonatomic, strong) MiLinkDemonstrationView *demonstrationView;
@property (nonatomic, strong) MiLinkPushController    *pushController;

@end

@implementation MiLinkPushViewManager

- (instancetype)initPushViewManagerWithController:(UIViewController *)controller {
    
    if (self = [super init]) {
        
        self.pushController = (MiLinkPushController *)controller;
    }
    
    return self;
}

- (void)reloadLoginView {
    
    [self.pushController.view addSubview:self.demonstrationView];
    
    [self addConstraints];
}

- (void)addConstraints {
    
    [self.demonstrationView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        (void)make.edges;
    }];
}

- (MiLinkDemonstrationView *)demonstrationView {
    
    CAL_GET_METHOD_RETURN_OBJC(_demonstrationView);
    
    _demonstrationView = [[MiLinkDemonstrationView alloc] init];
    
    CAL_WEAK_SELF(weakSelf);
    
    [_demonstrationView setMiLinkDemonstrationBlock:^{
        
        MiLinkRTMPController *miLinkRTMPController = [[MiLinkRTMPController alloc] init];
        
        [weakSelf.pushController.navigationController pushViewController:miLinkRTMPController
                                                                animated:YES];
    }];

    return _demonstrationView;
}

@end
