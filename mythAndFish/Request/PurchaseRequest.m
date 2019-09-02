//
//  PurchaseRequest.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "PurchaseRequest.h"

@implementation PurchaseRequest

-(instancetype)initWithId:(NSString *)goodsId token:(NSString *)token{
    if (self = [super init]) {
        [self.requestParamter setValue:goodsId forKey:@"id"];
        [self.requestParamter setValue:token forKey:@"token"];
    }
    return self;
}

-(NSString *)requestUrl{
    return @"http://fuzai.hunyuanjie.com/api/app/index/flash_buy";
}

-(RequstMethod)requestMethod{
    return get;
}

@end
