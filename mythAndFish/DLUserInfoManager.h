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


///是否抢
@property (nonatomic, assign) BOOL buyBaiHu;
@property (nonatomic, assign) BOOL buyXuanWu;
@property (nonatomic, assign) BOOL buyQingLong;
@property (nonatomic, assign) BOOL buyQiLin;
@property (nonatomic, assign) BOOL buyPiXiu;
@property (nonatomic, assign) BOOL buyFengHuang;
@property (nonatomic, assign) BOOL buyZhuQue;
@property (nonatomic, assign) BOOL buyHuaFei;

@end

NS_ASSUME_NONNULL_END
