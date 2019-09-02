//
//  PurchaseResultRequest.h
//  mythAndFish
//
//  Created by dongliang on 2019/9/2.
//  Copyright © 2019 dl. All rights reserved.
//

#import "BaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseResultRequest : BaseRequest

-(instancetype)initWithToken:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
