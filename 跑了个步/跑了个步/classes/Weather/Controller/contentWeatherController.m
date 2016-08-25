//
//  contentWeatherController.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//
#import "contentWeatherController.h"
#import "getContentWeather.h"
#import "todayModel.h"
#import "headerView.h"
#import "footerView.h"
#import <Masonry.h>
@interface contentWeatherController ()
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)todayModel *Model;
@property(nonatomic,strong)NSString *star;
@end
@implementation contentWeatherController
//-(NSString*)star
//{
//    if (_star==nil) {
//        _star=[NSString ]
//    }
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getWeather];
//    [self loadTableview];
}
-(void)getWeather{
    __weak typeof(self) weakself=self;
    if (self.city==nil) {
        NSLog(@"请输入正确的城市名");
    }else{
    getContentWeather *weather=[getContentWeather initWithNSString:self.city];
 [weather setBlkModel:^(todayModel *model) {
     weakself.Model=model;
     NSArray *array=[model.date componentsSeparatedByString:@"-"];
     int M=[array[1] intValue];
     int D=[array[2] intValue];
     [weakself getAstroWithMonth:M day:D];
     [weakself loadTableview];
 }];
    }
}
-(void)loadTableview{
//    __weak typeof(self)weakself=self;
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.tableFooterView.userInteractionEnabled=YES;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"赫本5.jpg"];
    self.tableView.backgroundView=imageView;
    [self.view addSubview:self.tableView];
    headerView *header=[headerView init];
    header.model=self.Model;
    self.tableView.tableHeaderView=header;
    footerView *footer=[footerView init];
    footer.Star=self.star;
    footer.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    self.tableView.tableFooterView=footer;
    }
-(NSString *)getAstroWithMonth:(int)m day:(int)d{
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    if (m<1||m>12||d<1||d>31){
        return @"错误日期格式!";
    }
    if(m==2 && d>29)
    {
        return @"错误日期格式!!";
    }else if(m==4 || m==6 || m==9 || m==11) {
        
        if (d>30) {
            return @"错误日期格式!!!";
        }
    }
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    NSLog(@"猜猜是什么星座%@",result);
    self.star=result;
    return result;
}
-(void)viewWillAppear:(BOOL)animated{
        self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
        self.tabBarController.tabBar.hidden=NO;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
@end
