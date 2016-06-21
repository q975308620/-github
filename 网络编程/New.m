//
//  New.m
//  网络编程
//
//  Created by DC018 on 16/6/8.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "New.h"

@implementation New
+ (void) getNewsDataWithPageNum:(int)pageNum
{
    [[[self class] alloc]get_new:pageNum];
}
-(void)get_new:(int)pagenum{
       
    //    ----------获取新闻信息----------
    NSDictionary *dic=@{@"categoryId":@1,@"pageNum":@(pagenum)};
    [self.manager POST:Set_scrollview parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         NSArray *temp=responseObject[@"data"];
       
       NSArray *arr = [New mj_objectArrayWithKeyValuesArray:temp];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"cell" object:arr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
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
//-(instancetype)initWithdic:(NSDictionary *)diction{
//    self=[super init];
//    if (self) {
//        self.newsId=diction[@"newsTd"];
//        self.title=diction[@"title"];
//        self.summary=diction[@"summary"];
//        self.link=diction[@"link"];
//        self.browseNum=diction[@"browseNum"];
//        self.praiseNum=diction[@"praiseNum"];
//        self.issuestime=diction[@"issuestime"];
//        self.source=diction[@"source"];
//        self.image=[diction valueForKey:@"image"];
//    }
//    return self ;
//}
//+(NSMutableArray<New *>*)mutableArrayWithArray:(NSArray<NSDictionary *>*)array{
//    NSMutableArray *release=[NSMutableArray array];
//    for (NSDictionary * dic in array) {
//          New *new=[[New alloc]initWithdic:dic];
//         [release addObject:new];
//        
//    }
//    return release;
//}
@end
