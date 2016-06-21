//
//  Banner.h
//  网络编程
//
//  Created by DC018 on 16/6/8.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *imageurl;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
-(void)get_header;
@end
