//
//  DLUserInfoManager.h
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLUserInfoManager : NSObject

+ (instancetype)defaultManager;
@property (nonatomic, copy, nullable) NSString *token;  ///阿良的远古神话
@property (nonatomic, copy, nullable) NSString *token1;  ///良1的远古神话
@property (nonatomic, copy, nullable) NSString *token2;  ///良2的远古神话
@property (nonatomic, copy, nullable) NSString *token3;  ///良3的远古神话
@property (nonatomic, strong) NSMutableArray *mythTimeArray;
@end

NS_ASSUME_NONNULL_END
