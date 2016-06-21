//
//  NViewController.m
//  网络编程
//
//  Created by DC018 on 16/6/21.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "NViewController.h"

@interface NViewController ()
@property(nonatomic,strong)NSArray * news;
@property (weak, nonatomic) IBOutlet UILabel *biaoti;
@property (weak, nonatomic) IBOutlet UILabel *laiyuan;
@property (weak, nonatomic) IBOutlet UITextView *neirong;
@property (weak, nonatomic) IBOutlet UILabel *shijian;
@end

@implementation NViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _news=[[NSArray alloc]init];
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    int a=[[user valueForKeyPath:@"new"] intValue];
       [self getnew:a];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getnew:(int)pagenum{
    NSDictionary *dic=@{@"newsId":@1,@"categoryFk":@1,@"pageNum":@(pagenum)};
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager POST:Set_new parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _news =responseObject[@"data"];
        NSLog(@"%@",_news);
        _biaoti.text=[_news valueForKeyPath:@"title"];
        _laiyuan.text=[_news valueForKeyPath:@"source"];
        _shijian.text=[_news valueForKeyPath:@"issuestime"];
        _neirong.text=[_news valueForKeyPath:@"content"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误%@",error);
    }];
   
}

@end
