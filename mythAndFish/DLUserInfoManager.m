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
        
        _instance.buyBaiHu = YES;
        _instance.buyXuanWu = YES;
        _instance.buyQingLong = YES;
        _instance.buyQiLin = YES;
        _instance.buyPiXiu = YES;
        _instance.buyFengHuang = YES;
        _instance.buyZhuQue = YES;
        _instance.buyHuaFei = YES;
        
    });
    return _instance;
}

@end
