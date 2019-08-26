//
//  ViewController.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ViewController.h"
#import "LoginRequest.h"
#import "DLUserView.h"
#import "PurchaseRequest.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DLUserView *userView1;

@property (nonatomic, strong) UITableView *listTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeakSelf(mySelf)
    self.view.backgroundColor = UIColor.greenColor;
    [self.view addSubview:self.userView1];
    [self.view addSubview:self.listTableView];
    
    [self.userView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@80);
    }];
    
    [_listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.equalTo(@350);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @"白虎";
    return cell;
}

-(DLUserView *)userView1{
    if (!_userView1) {
        _userView1 = [[DLUserView alloc] init];
        _userView1.title = @"阿良";
        _userView1.backgroundColor = [UIColor whiteColor];
        WeakSelf(mySelf)
        _userView1.loginBlock = ^{
            LoginRequest *request = [[LoginRequest alloc] initWithPhone:@"17801081312" password:@"dongliang8355279"];
            [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = responseObject;
                if ([[NSString stringWithFormat:@"%@",dic[@"status_code"]] isEqualToString:@"200"]) {
                    NSLog(@"登录成功%@",responseObject);
                    mySelf.userView1.station = @"登录成功";
                    [DLUserInfoManager defaultManager].token = dic[@"data"][@"token"];
                    
                    PurchaseRequest *request = [[PurchaseRequest alloc] initWithId:@"" token:[DLUserInfoManager defaultManager].token];
                    [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        NSLog(@"首页数据%@",responseObject);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"首页数据请求失败");
                    }];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        };
    }
    return _userView1;
}

-(UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.backgroundColor = [UIColor whiteColor];
        [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _listTableView;
}

@end
