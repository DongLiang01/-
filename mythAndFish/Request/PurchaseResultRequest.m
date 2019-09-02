//
//  PurchaseResultRequest.m
//  mythAndFish
//
//  Created by dongliang on 2019/9/2.
//  Copyright © 2019 dl. All rights reserved.
//

#import "PurchaseResultRequest.h"

@implementation PurchaseResultRequest

-(instancetype)initWithToken:(NSString *)token{
    if (self = [super init]) {
        [self.requestParamter setValue:token forKey:@"token"];
    }
    return self;
}

-(NSString *)requestUrl{
    return @"http://fuzai.hunyuanjie.com//api/app/user/adopt_log?token";
}

-(RequstMethod)requestMethod{
    return get;
}

@end
