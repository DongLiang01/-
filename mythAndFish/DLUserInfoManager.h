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
@property (nonatomic, copy) NSString *token;

@end

NS_ASSUME_NONNULL_END
