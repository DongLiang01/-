//
//  ViewController.h
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLUserView.h"
#import "ListModel.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) DLUserView *userView1;
@property (nonatomic, strong) DLUserView *userView2;
@property (nonatomic, strong) DLUserView *userView3;
@property (nonatomic, strong) DLUserView *userView4;
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) NSMutableArray *items;

-(NSString *)getNowYearMonthDay;
- (CGFloat)getCountDownStringWithEndTime:(NSString *)endTime;

@end

