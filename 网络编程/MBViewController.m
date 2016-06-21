//
//  MBViewController.m
//  网络编程
//
//  Created by DC018 on 16/6/12.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "MBViewController.h"
#import "Banner.h"
#import "New.h"
#import "MBProgressHUD.h"
#import "NViewController.h"
@interface MBViewController()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SDCycleScrollViewDelegate>
{
    int pagenum;
   long int num;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)NSMutableArray *tou;
@property(nonatomic,strong)SDCycleScrollView *scr;
@property(nonatomic,strong)UIPageControl *page;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end
@implementation MBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [_table registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"ce"];
    _table.delegate=self;
    _table.dataSource=self;
    
    [self.view addSubview:_table];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotificationByNews:) name:@"cell" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(take:) name:@"news" object:nil];
    [[Banner alloc]get_header];
    
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingBlock:^{
        //    ---------- 网络加载提醒框----------
        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.label.text=@"加载中...";
//        _hud.customView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Checkmark"]];
//        _hud.mode=MBProgressHUDModeCustomView;
          pagenum=1;
          [New getNewsDataWithPageNum:pagenum];
    }];
    NSMutableArray *idleImages=[NSMutableArray array];
    for (int i=1; i<9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"0%i.tiff",i]];
        [idleImages addObject:image];
    }
    [header setImages:idleImages forState:MJRefreshStatePulling];
    self.table.mj_header=header;
    [self.table.mj_header beginRefreshing];
    
    
    
    //    ----------上拉刷新数据----------
    MJRefreshAutoGifFooter *footer=[MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [New getNewsDataWithPageNum:++pagenum];
    }];
    NSMutableArray *idleImages1=[NSMutableArray array];
    for (int i=1; i<3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"1%i.tiff",i]];
        [idleImages1 addObject:image];
    }
    [footer setImages:idleImages1  forState:MJRefreshStateRefreshing];
    self.table.mj_footer=footer;
 }
#pragma 头部通知返回的数据
-(void)take:(NSNotification *)notifiction{
    self.tou=[NSMutableArray array];
    [self.tou addObjectsFromArray:notifiction.object];
        self.scr.titlesGroup=[self.tou valueForKey:@"title"];
    [self.table reloadData];
}
#pragma mark 新闻通知返回的数据
-(void)handleNotificationByNews:(NSNotification *)notification{
   //    ----------提醒框关闭----------
    [_hud hideAnimated:YES];
    //    ----------当为第一页的时候实例化对象----------
    if (pagenum==1) {
        self.arr=[NSMutableArray array];
      }
    //    ----------当通知返回的数据是数组时 添加到可变数组----------
    if ([notification.object isKindOfClass:[NSArray class]]) {
        [self.arr addObjectsFromArray:notification.object];
    }
    //    ----------刷新数据----------
    [self.table reloadData];
    //    ----------结束上拉，下拉刷新----------
    [self.table.mj_header endRefreshing];
    [self.table.mj_footer endRefreshing];
}
#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arr.count;
    
}
#pragma mark 绘制cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ce"];
    //    ----------用New类型接收----------
    New *new=self.arr[indexPath.row];
     cell.title.text=new.title;
    cell.issuestime.text=new.issuestime;
    [cell.image setImageWithURL:[NSURL  URLWithString:new.image] placeholderImage:[UIImage imageNamed:@"a"]];
    cell.zan.text=[new.praiseNum stringValue];
    cell.ping.text=[new.browseNum stringValue];
    
    return cell;
}
#pragma mark 点击行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    num =(pagenum-1)*10+indexPath.row;
    NSLog(@"%li",num);
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setValue:[NSString stringWithFormat:@"%li",num] forKey:@"new"];
    
        UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NViewController *se = [story instantiateViewControllerWithIdentifier:@"NViewController"];
    [self.navigationController pushViewController:se animated:YES];
    
    
}
#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark 重写SDC库方法
-(SDCycleScrollView *)scr{
    //    ----------实例类库----------
     _scr=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 375, 190) delegate:self placeholderImage:[UIImage imageNamed:@"a"]];
    //    ----------滚动图片----------
    _scr.imageURLStringsGroup=[self.tou valueForKey:@"imageurl"];
    //    ----------分页控件位置----------
    _scr.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    //    ----------分页控制样式----------
    _scr.pageControlStyle=SDCycleScrollViewPageContolStyleAnimated;
    //    ----------分页大小----------
    _scr.pageControlDotSize=CGSizeMake(5, 5);
   // _scr.scrollDirection=UICollectionViewScrollDirectionVertical;

    self.table.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
    [self.table.tableHeaderView addSubview:_scr];
    return _scr;
}
@end