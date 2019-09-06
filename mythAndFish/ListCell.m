//
//  ListCell.m
//  mythAndFish
//
//  Created by dongliang on 2019/9/4.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ListCell.h"

@interface ListCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *buyButton;

@end

@implementation ListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.buyButton];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(12);
            make.centerY.equalTo(self.contentView);
            make.width.height.greaterThanOrEqualTo(@1);
        }];
        [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).with.offset(-12);
            make.centerY.equalTo(self.contentView);
            make.top.equalTo(self.contentView).with.offset(12);
            make.width.equalTo(@40);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(8);
            make.right.equalTo(self.buyButton.mas_left).with.offset(-8);
            make.centerY.equalTo(self.contentView);
            make.height.mas_greaterThanOrEqualTo(@1);
        }];
        
    }
    return self;
}

-(void)clickBuyButton:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"抢"]) {
        sender.selected = YES;
        sender.backgroundColor = UIColor.redColor;
        [self changeStation:NO];
    }else{
        sender.selected = NO;
        sender.backgroundColor = UIColor.greenColor;
        [self changeStation:YES];
    }
}

-(void)changeStation:(BOOL)station{
    if ([_model.name isEqualToString:@"白虎"]) {
        [DLUserInfoManager defaultManager].buyBaiHu = station;
    }else if ([_model.name isEqualToString:@"玄武"]) {
        [DLUserInfoManager defaultManager].buyXuanWu = station;
    }else if ([_model.name isEqualToString:@"青龙"]) {
        [DLUserInfoManager defaultManager].buyQingLong = station;
    }else if ([_model.name isEqualToString:@"麒麟"]) {
       [DLUserInfoManager defaultManager].buyQiLin = station;
    }else if ([_model.name isEqualToString:@"貔貅"]) {
        [DLUserInfoManager defaultManager].buyPiXiu = station;
    }else if ([_model.name isEqualToString:@"凤凰"]) {
        [DLUserInfoManager defaultManager].buyFengHuang = station;
    }else if ([_model.name isEqualToString:@"朱雀"]) {
        [DLUserInfoManager defaultManager].buyZhuQue = station;
    }else if ([_model.contentId isEqualToString:@"23"]) {
        [DLUserInfoManager defaultManager].buyHuaFei = station;
    }
}

-(void)setModel:(ListModel *)model{
    _model = model;
    _titleLabel.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.contentId];
    _contentLabel.text = model.content;
    if ([model.name isEqualToString:@"白虎"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyBaiHu;
    }else if ([model.name isEqualToString:@"玄武"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyXuanWu;
    }else if ([model.name isEqualToString:@"青龙"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyQingLong;
    }else if ([model.name isEqualToString:@"麒麟"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyQiLin;
    }else if ([model.name isEqualToString:@"貔貅"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyPiXiu;
    }else if ([model.name isEqualToString:@"凤凰"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyFengHuang;
    }else if ([model.contentId isEqualToString:@"朱雀"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyZhuQue;
    }else if ([_model.contentId isEqualToString:@"23"]) {
        _buyButton.selected = ![DLUserInfoManager defaultManager].buyHuaFei;
    }
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = UIColor.whiteColor;
    }
    return _titleLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = UIColor.whiteColor;
    }
    return _contentLabel;
}

-(UIButton *)buyButton{
    if (!_buyButton) {
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_buyButton setTitle:@"抢" forState:UIControlStateNormal];
        _buyButton.backgroundColor = UIColor.greenColor;
        
        [_buyButton setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
        [_buyButton setTitle:@"不抢" forState:UIControlStateSelected];
        
        [_buyButton addTarget:self action:@selector(clickBuyButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyButton;
}

@end
