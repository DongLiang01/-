//
//  DLUserInfoManager.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "DLUserInfoManager.h"

@implementation DLUserInfoManager

static DLUserInfoManager *_instance = nil;
+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DLUserInfoManager alloc] init];
    });
    return _instance;
}

@end
