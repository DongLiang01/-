//
//  ListCell.h
//  mythAndFish
//
//  Created by dongliang on 2019/9/4.
//  Copyright © 2019 dl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListCell : UITableViewCell

@property (nonatomic, strong) ListModel *model;

@end

NS_ASSUME_NONNULL_END
