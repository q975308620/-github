//
//  ViewController.m
//  网络编程
//
//  Created by DC018 on 16/6/7.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "ViewController.h"
#import "YSLContainerViewController.h"
#import "MBViewController.h"
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray * a;
@property(nonatomic,strong)MBViewController *mbview;
@end
@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"1.2dlkfd;l");
    self.view.backgroundColor=[UIColor cyanColor];
    _a=[NSMutableArray array];
     NSArray *ae=@[@"文明播报",@"道德模范",@"文明创建",@"志愿服务",@"未成年人",@"区县传真",@"主题活动",@"我们的节日"];
    for (int i=0; i<8; i++) {
             self.mbview=[[MBViewController alloc]init];
            self.mbview.title=[NSString stringWithFormat:@"%@",ae[i]];
            [_a addObject:self.mbview];
    }
    YSLContainerViewController *ysl=[[YSLContainerViewController alloc]initWithControllers:_a topBarHeight:64 parentViewController:self];
    ysl.menuItemTitleColor=[UIColor grayColor];
    ysl.menuItemSelectedTitleColor=[UIColor redColor];
    ysl.menuBackGroudColor=[UIColor whiteColor];
    [self.view addSubview:ysl.view];
}

@end
