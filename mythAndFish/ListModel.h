//
//  ListModel.h
//  mythAndFish
//
//  Created by 董良 on 2019/8/27.
//  Copyright © 2019 dl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *contentId;
@property (nonatomic, copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
