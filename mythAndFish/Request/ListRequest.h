//
//  ListRequest.h
//  mythAndFish
//
//  Created by 董良 on 2019/8/31.
//  Copyright © 2019 dl. All rights reserved.
//

#import "BaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListRequest : BaseRequest

-(instancetype)initWithToken:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
