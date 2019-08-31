//
//  ViewController.m
//  mythAndFish
//
//  Created by dongliang on 2019/8/26.
//  Copyright © 2019 dl. All rights reserved.
//

#import "ViewController.h"
#import "LoginRequest.h"
#import "PurchaseRequest.h"
#import "ListRequest.h"
#import "ViewController+view.h"
#import "ViewController+action.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *mythArray;
@property (nonatomic, strong) NSMutableArray *fishArray;

@end

@implementation ViewController

-(NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
        [_items addObject:self.mythArray];
        [_items addObject:self.fishArray];
    }
    return _items;
}

-(NSMutableArray *)mythArray{
    if (!_mythArray) {
        _mythArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _mythArray;
}

-(NSMutableArray *)fishArray{
    if (!_fishArray) {
        _fishArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _fishArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.greenColor;
    [self  initUI];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDate *nowDate = [NSDate date]; // 当前日期
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
        NSString *str = [formatter stringFromDate:nowDate];
        NSLog(@"现在的时间是%@",str);
    });
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return  [[self.items objectAtIndex:0] count];
            break;
        case 1:
            return [[self.items objectAtIndex:1] count];
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
        {
            ListModel *model = _mythArray[indexPath.row];
             cell.textLabel.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.contentId];
        }
            break;
        case 1:
        {
            ListModel *model = _fishArray[indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.contentId];
        }
            break;
        default:
            break;
    }
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
                    ///阿良登录成功后，添加远古神话抢兽行为
                    [mySelf addMythActionitWithToken:[DLUserInfoManager defaultManager].token];
                    
                    if (self.mythArray.count == 0 ) {
                        [mySelf requestListDataWithUserToken:[DLUserInfoManager defaultManager].token];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"登录失败");
            }];
        };
        _userView1.signOutBlock = ^{
             [DLUserInfoManager defaultManager].token = nil;
            mySelf.userView1.station = @"退出登录";
             [mySelf clearData];
        };
    }
    return _userView1;
}

-(DLUserView *)userView2{
    if (!_userView2) {
        _userView2 = [[DLUserView alloc] init];
        _userView2.title = @"良1";
        _userView2.backgroundColor = [UIColor whiteColor];
        WeakSelf(mySelf)
        _userView2.loginBlock = ^{
            LoginRequest *request = [[LoginRequest alloc] initWithPhone:@"17136916632" password:@"dongliang8355279"];
            [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = responseObject;
                if ([[NSString stringWithFormat:@"%@",dic[@"status_code"]] isEqualToString:@"200"]) {
                    NSLog(@"登录成功%@",responseObject);
                    mySelf.userView2.station = @"登录成功";
                     [DLUserInfoManager defaultManager].token1 = dic[@"data"][@"token"];
                    ///良1登录成功后，添加远古神话抢兽行为
                    [mySelf addMythActionitWithToken:[DLUserInfoManager defaultManager].token1];
                    
                    if (self.mythArray.count == 0 ) {
                        [mySelf requestListDataWithUserToken:[DLUserInfoManager defaultManager].token1];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        };
        _userView2.signOutBlock = ^{
            [DLUserInfoManager defaultManager].token1 = nil;
            mySelf.userView2.station = @"退出登录";
             [mySelf clearData];
        };
    }
    return _userView2;
}

-(DLUserView *)userView3{
    if (!_userView3) {
        _userView3 = [[DLUserView alloc] init];
        _userView3.title = @"良2";
        _userView3.backgroundColor = [UIColor whiteColor];
        WeakSelf(mySelf)
        _userView3.loginBlock = ^{
            LoginRequest *request = [[LoginRequest alloc] initWithPhone:@"17136916630" password:@"dongliang8355279"];
            [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = responseObject;
                if ([[NSString stringWithFormat:@"%@",dic[@"status_code"]] isEqualToString:@"200"]) {
                    NSLog(@"登录成功%@",responseObject);
                    mySelf.userView3.station = @"登录成功";
                    [DLUserInfoManager defaultManager].token2 = dic[@"data"][@"token"];
                    ///良2登录成功后，添加远古神话抢兽行为
                    [mySelf addMythActionitWithToken:[DLUserInfoManager defaultManager].token2];
                    
                    if (self.mythArray.count == 0 ) {
                        [mySelf requestListDataWithUserToken:[DLUserInfoManager defaultManager].token2];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        };
        _userView3.signOutBlock = ^{
            [DLUserInfoManager defaultManager].token2 = nil;
            mySelf.userView3.station = @"退出登录";
             [mySelf clearData];
        };
    }
    return _userView3;
}

-(DLUserView *)userView4{
    if (!_userView4) {
        _userView4 = [[DLUserView alloc] init];
        _userView4.title = @"良3";
        _userView4.backgroundColor = [UIColor whiteColor];
        WeakSelf(mySelf)
        _userView4.loginBlock = ^{
            LoginRequest *request = [[LoginRequest alloc] initWithPhone:@"17136916631" password:@"dongliang8355279"];
            [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = responseObject;
                if ([[NSString stringWithFormat:@"%@",dic[@"status_code"]] isEqualToString:@"200"]) {
                    NSLog(@"登录成功%@",responseObject);
                    mySelf.userView4.station = @"登录成功";
                    [DLUserInfoManager defaultManager].token3 = dic[@"data"][@"token"];
                    ///良2登录成功后，添加远古神话抢兽行为
                    [mySelf addMythActionitWithToken:[DLUserInfoManager defaultManager].token3];
                    
                    if (self.mythArray.count == 0 ) {
                        [mySelf requestListDataWithUserToken:[DLUserInfoManager defaultManager].token3];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        };
        _userView4.signOutBlock = ^{
            [DLUserInfoManager defaultManager].token3 = nil;
             mySelf.userView4.station = @"退出登录";
            [mySelf clearData];
        };
    }
    return _userView4;
}

///请求首页数据
-(void)requestListDataWithUserToken:(NSString *)token{
    WeakSelf(mySelf)
    ListRequest *request = [[ListRequest alloc] initWithToken:token];
    [request startWithCompletionBlockWithSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"列表数据%@",responseObject);
        mySelf.mythArray =[NSMutableArray arrayWithArray: [NSArray  yy_modelArrayWithClass:[ListModel class] json:responseObject[@"data"][@"piglist"]]];
        [mySelf.items replaceObjectAtIndex:0 withObject:mySelf.mythArray];
        [mySelf.listTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"首页数据请求失败");
    }];
}

///清空神话数据
-(void)clearData{
    if (![DLUserInfoManager defaultManager].token && ![DLUserInfoManager defaultManager].token1 &&  ![DLUserInfoManager defaultManager].token2 && ![DLUserInfoManager defaultManager].token3) {
        [self.mythArray removeAllObjects];
        [self.items replaceObjectAtIndex:0 withObject:self.mythArray];
        [self.listTableView reloadData];
    }
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

///获取今天的时间，年月日
-(NSString *)getNowYearMonthDay{
    //获取本地时间
    NSDate *date = [NSDate date];                            //实际上获得的是：UTC时间，协调世界时，亚州的时间与UTC的时差均为+8
    NSTimeZone *zone = [NSTimeZone systemTimeZone];                  //zone为当前时区信息  在我的程序中打印的是@"Asia/Shanghai"
    NSInteger interval = [zone secondsFromGMTForDate: date];      //28800 //所在地区时间与协调世界时差距
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];  //加上时差，得到本地时间
    //get seconds since 1970
    NSTimeInterval intervalWith1970 = [localeDate timeIntervalSince1970];     //本地时间与1970年的时间差（秒数）
    int daySeconds = 24 * 60 * 60;                                            //每天秒数
    NSInteger allDays = intervalWith1970 / daySeconds;                        //这一步是为了舍去后面的时分秒
    localeDate = [NSDate dateWithTimeIntervalSince1970:allDays * daySeconds];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";   //创建日期格式（年-月-日）
    NSString *temp = [fmt stringFromDate:localeDate];
    return temp;
}

///计算两个时间差
- (CGFloat)getCountDownStringWithEndTime:(NSString *)endTime {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //设置时区
    NSInteger interval = [zone secondsFromGMTForDate: now];
    NSDate *localDate = [now dateByAddingTimeInterval: interval];
    NSDate *endDate = [dateFormatter dateFromString:endTime];
    NSInteger endInterval = [zone secondsFromGMTForDate: endDate];
    NSDate *end = [endDate dateByAddingTimeInterval: endInterval];
    return [end timeIntervalSinceDate:localDate];
}

@end
