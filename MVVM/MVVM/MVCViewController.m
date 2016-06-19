//
//  MVCViewController.m
//  MVVM
//
//  Created by 赵天 on 16/6/18.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import "MVCViewController.h"
#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import "ZTArticleModel.h"
#import <MJExtension.h>
@interface MVCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)ZTArticleModel *articleModel;

@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation MVCViewController

- (UITableView *)tableView{
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f)];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updata];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ZTCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    ZTArticleModel *model = [[ZTArticleModel alloc] init];
    model = self.dataArr[indexPath.row];
    
    cell.textLabel.text = model.mID;
    cell.detailTextLabel.text = model.desc;
    
    return cell;
}
#pragma mark -- 请求数据
- (void)updata{

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *urlStr = @"http://www.ios122.com/find_php/index.php?viewController=YFPostListViewController&model[category]=ui&model[page]=1";
    
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.dataArr = [ZTArticleModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败%@",error);
    }];
}

@end
