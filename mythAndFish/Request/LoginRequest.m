//
//  LoginRequest.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

-(instancetype)initWithPhone:(NSString *)mediaId password:(NSString *)videoId{
    if (self = [super init]) {
        
        [self.requestParamter setValue:@"17136916631" forKey:@"mobile"];
        [self.requestParamter setValue:@"dongliang8355279" forKey:@"password"];
        [self.requestParamter setValue:@(true) forKey:@"isSave"];
        
    }
    return self;
}

-(NSString *)requestUrl{
    return @"http://fuzai.hunyuanjie.com/api/app/user/login";
}

-(RequstMethod)requestMethod{
    return post;
}



@end
