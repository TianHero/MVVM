//
//  ZTArticleModel.m
//  MVVM
//
//  Created by 赵天 on 16/6/19.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import "ZTArticleModel.h"
#import <MJExtension.h>
@implementation ZTArticleModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"mID":@"id"};
}

@end
