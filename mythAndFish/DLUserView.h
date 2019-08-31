//
//  DLUserView.h
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLUserView : UIView

@property (nonatomic, copy) void (^loginBlock)(void);
@property (nonatomic, copy) void (^signOutBlock)(void);
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *station;

@end

NS_ASSUME_NONNULL_END
