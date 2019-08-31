//
//  ViewController+view.m
//  mythAndFish
//
//  Created by 董良 on 2019/8/27.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ViewController+view.h"

@implementation ViewController (view)

-(void)initUI{
    
    ///远古神话阿良
    [self.view addSubview:self.userView1];
    [self.userView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view);
        make.centerX.equalTo(self.view).with.multipliedBy(0.5);
        make.height.equalTo(@50);
    }];
    ///远古神话良1
    [self.view addSubview:self.userView2];
    [self.userView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView1).with.offset(0);
        make.right.equalTo(self.view);
        make.centerX.equalTo(self.view).with.multipliedBy(1.5);
        make.height.equalTo(@50);
    }];
    ///远古神话良2
    [self.view addSubview:self.userView3];
    [self.userView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView1.mas_bottom).with.offset(0);
        make.left.equalTo(self.view);
        make.centerX.equalTo(self.view).with.multipliedBy(0.5);
        make.height.equalTo(@50);
    }];
    ///远古神话良3
    [self.view addSubview:self.userView4];
    [self.userView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userView3).with.offset(0);
        make.right.equalTo(self.view);
        make.centerX.equalTo(self.view).with.multipliedBy(1.5);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.userView3.mas_bottom).with.offset(20);
    }];
}

@end
