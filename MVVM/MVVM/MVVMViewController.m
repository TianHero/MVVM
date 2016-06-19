//
//  MVVMViewController.m
//  MVVM
//
//  Created by 赵天 on 16/6/19.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import "MVVMViewController.h"
#import "TableViewModel.h"
#import "ZTArticleModel.h"
@interface MVVMViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)TableViewModel *viewModel;
/**
 *  数据源
 */
@property (nonatomic,strong)NSMutableArray *dataArr;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MVVMViewController
//懒加载TableViewModel
- (TableViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[TableViewModel alloc] init];
    }
    return _viewModel;
}
//懒加载
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:0];
        
    }
    return _dataArr;
}
//lazy load
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64.f) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }

    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self headerRequestData];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
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

//请求数据
- (void)headerRequestData{
    [self.viewModel headerRefreshRequestWithCallBack:^(NSMutableArray *array) {
        //把回调过来的请求的数据加到数据源里
        self.dataArr = array;
        //刷新TableView
        [self.tableView reloadData];
    }];
}

@end
