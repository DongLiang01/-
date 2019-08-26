//
//  BaseRequest.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "BaseRequest.h"
#import <AFNetworking.h>

@implementation BaseRequest

static AFHTTPSessionManager *manager ;
+ (AFHTTPSessionManager *)sharedHTTPSession{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30;
    });
    return manager;
}

-(void)startWithCompletionBlockWithSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    if (self.requestMethod == post) {
        [self postWithCompletionBlockWithSuccess:success failure:failure];
    }else if (self.requestMethod == get){
        [self getWithCompletionBlockWithSuccess:success failure:failure];
    }
    
}

-(void)startFormDataWithCompletionBlockWithSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    if (self.requestMethod == post) {
        [self postFormDataWithCompletionBlockWithSuccess:success failure:failure];
    }else if (self.requestMethod == get){
        
    }
}

#pragma 普通请求
-(void)postWithCompletionBlockWithSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    [[BaseRequest sharedHTTPSession] POST:[self requestUrl] parameters:self.requestParamter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

-(void)getWithCompletionBlockWithSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    [[BaseRequest sharedHTTPSession] GET:[self requestUrl] parameters:self.requestParamter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

#pragma 表单请求
-(void)postFormDataWithCompletionBlockWithSuccess:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    [[BaseRequest sharedHTTPSession] POST:self.requestUrl parameters:self.requestParamter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFormData:[NSJSONSerialization dataWithJSONObject:self.requestParamter options:NSJSONWritingPrettyPrinted error:nil] name:@""];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}



-(NSString *)requestUrl{
    return @"";
}

-(NSMutableDictionary *)requestParamter{
    if (!_requestParamter) {
        _requestParamter = [NSMutableDictionary dictionary];
    }
    return _requestParamter;
}

@end
