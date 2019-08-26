//
//  DLUserView.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "DLUserView.h"

@interface DLUserView()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation DLUserView

-(instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.loginBtn];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@50);
            make.centerY.equalTo(self);
        }];
        WeakSelf(mySelf)
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(mySelf.nameLabel.mas_right).with.offset(100);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        
        
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _nameLabel.text = title;
}

-(void)setStation:(NSString *)station{
    _station = station;
    if ([station isEqualToString:@"登录成功"]) {
        [_loginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    }else{
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    }
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"账号";
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        WeakSelf(mySelf)
        [_loginBtn block:^(id sender) {
            if (mySelf.loginBlock) {
                mySelf.loginBlock();
            }
        }];
    }
    return _loginBtn;
}

@end
