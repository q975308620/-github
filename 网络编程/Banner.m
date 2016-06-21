//
//  Banner.m
//  网络编程
//
//  Created by DC018 on 16/6/8.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "Banner.h"

@implementation Banner
#pragma mark 获取新闻数据
-(void)get_header{
    //    ----------获取 banner新闻 ----------
    [self.manager POST:Set_table parameters:@{@"categoryId":@1} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *arr=responseObject[@"data"];
        NSArray *banner=[Banner mj_objectArrayWithKeyValuesArray:arr];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"news" object:banner];
         
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"头部错误%@",error);
    }];
 }
-(AFHTTPSessionManager *)manager{
    if (_manager) {
        return _manager;
    }
    _manager=[AFHTTPSessionManager manager];
    _manager.requestSerializer=[AFJSONRequestSerializer serializer];
    return _manager;
}

@end
