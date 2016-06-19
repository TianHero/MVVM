//
//  ZTArticleModel.h
//  MVVM
//
//  Created by 赵天 on 16/6/19.
//  Copyright © 2016年 赵天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTArticleModel : NSObject

/**
 *   "id": "ui_54",
 "title": "title_ui_54",
 "desc": "desc_ui_54"
 */
@property (strong, nonatomic) NSString * mID;//!< 文章唯一标识.
@property (copy, nonatomic  ) NSString * title;//!< 文章标题.
@property (copy, nonatomic  ) NSString * desc;//!< 文章简介.

@end
