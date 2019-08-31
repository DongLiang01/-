//
//  ListModel.m
//  mythAndFish
//
//  Created by 董良 on 2019/8/27.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"contentId": @"id",
             };
}

@end
