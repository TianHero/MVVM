//
//  TableViewModel.h
//  MVVM
//
//  Created by 赵天 on 16/6/19.
//  Copyright © 2016年 赵天. All rights reserved.
//

/**
 *  这个ViewModel的作用就是给ViewController瘦身，把请求数据的操作放到这里面。
 */
#import <Foundation/Foundation.h>
/**
 *  这个block的作用是用来把ViewModel请求到的数据回调给ViewController
 *
 *  @param array 数据源
 */
typedef void(^callBack)(NSMutableArray *array);

@interface TableViewModel : NSObject


/**
 *  下拉刷新
 *
 *  @param callBack 回调的数据源
 */
- (void)headerRefreshRequestWithCallBack:(callBack)callBack;
/**
 *   上拉刷新
 *
 *  @param callBack 回调的数据源
 */
- (void)footerRefreshRequestWithCallBack:(callBack)callBack;


@end
