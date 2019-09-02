//
//  MythCheckRequest.m
//  mythAndFish
//
//  Created by 董良 on 2019/8/31.
//  Copyright © 2019 dl. All rights reserved.
//

#import "MythCheckRequest.h"

@implementation MythCheckRequest

-(instancetype)initWithId:(NSString *)goodsId token:(NSString *)token{
    if (self = [super init]) {
        [self.requestParamter setValue:goodsId forKey:@"id"];
        [self.requestParamter setValue:token forKey:@"token"];
    }
    return self;
}

-(NSString *)requestUrl{
    return @"http://fuzai.hunyuanjie.com/api/app/index/check_flush_open";
}

-(RequstMethod)requestMethod{
    return get;
}

@end
