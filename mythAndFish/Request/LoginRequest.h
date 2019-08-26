//
//  LoginRequest.h
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "BaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginRequest : BaseRequest

-(instancetype)initWithPhone:(NSString *)mediaId password:(NSString *)videoId;

@end

NS_ASSUME_NONNULL_END
