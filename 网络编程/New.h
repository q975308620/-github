//
//  New.h
//  网络编程
//
//  Created by DC018 on 16/6/8.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface New : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *summary;
@property(nonatomic,strong)NSString *pageNum;
@property(nonatomic,strong)NSString *issuestime;
@property(nonatomic,strong)NSString *source;
@property(nonatomic,strong)NSNumber *browseNum;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSNumber *praiseNum;
@property(nonatomic,strong)NSNumber *newsId;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
+ (void) getNewsDataWithPageNum:(int)pageNum;


-(void)get_new:(int)pagenum;

//-(instancetype)initWithdic:(NSDictionary *)diction;
//
//+(NSMutableArray<New *>*)mutableArrayWithArray:(NSArray<NSDictionary *>*)array;
@end
