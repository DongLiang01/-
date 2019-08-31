//
//  ListRequest.m
//  mythAndFish
//
//  Created by 董良 on 2019/8/31.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ListRequest.h"

@implementation ListRequest

-(instancetype)initWithToken:(NSString *)token{
    if (self = [super init]) {
         [self.requestParamter setValue:token forKey:@"token"];
    }
    return self;
}

-(NSString *)requestUrl{
    return @"http://fuzai.hunyuanjie.com/api/app/index/index";
}

-(RequstMethod)requestMethod{
    return get;
}

@end
