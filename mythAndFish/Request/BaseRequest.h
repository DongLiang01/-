//
//  BaseRequest.h
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RequstMethod){
    post = 0,
    get
};

@interface BaseRequest : NSObject

///设置请求方式
@property (nonatomic, assign) RequstMethod requestMethod;
/**
 请求参数，子类请求直接往 requestParamter 添加参数即可
 Example: [self.requestParamter setValue:@"value" forKey:@"key"];
 */
@property (nonatomic, strong) NSMutableDictionary *requestParamter;
///设置请求地址
- (NSString *)requestUrl;

///开始请求
-(void)startWithCompletionBlockWithSuccess:(nullable void(^)(NSURLSessionDataTask *task, id _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

-(void)startFormDataWithCompletionBlockWithSuccess:(nullable void(^)(NSURLSessionDataTask *task, id _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
