//
//  TableViewModel.m
//  MVVM
//
//  Created by 赵天 on 16/6/19.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import "TableViewModel.h"
/**
 *  这里的model我就不重新创建了直接用MVC里面直接创建好的
 */
#import "ZTArticleModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>

@implementation TableViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallBack:(callBack)callBack{
    //子线程，后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //睡眠2
        sleep(2);
        //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            

            __block NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            
            NSString *urlStr = @"http://www.ios122.com/find_php/index.php?viewController=YFPostListViewController&model[category]=ui&model[page]=1";
            
            [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                dataArr = [ZTArticleModel mj_objectArrayWithKeyValuesArray:responseObject];
                //把dataArr传给ViewController
                callBack(dataArr);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"请求失败%@",error);
            }];
            
            
        });
    });
}

- (void)footerRefreshRequestWithCallBack:(callBack)callBack{
    
}

@end
