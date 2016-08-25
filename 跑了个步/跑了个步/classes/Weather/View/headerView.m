//
//  headerView.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "headerView.h"
@interface headerView()
@property (weak, nonatomic) IBOutlet UILabel *wendu;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *moon;
@property (weak, nonatomic) IBOutlet UILabel *pm;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *chuanyi;
@property (weak, nonatomic) IBOutlet UILabel *kongtiao;
@property (weak, nonatomic) IBOutlet UILabel *ganmao;
@property (weak, nonatomic) IBOutlet UILabel *yundong;
@property (weak, nonatomic) IBOutlet UILabel *ziwaixian;
@property (weak, nonatomic) IBOutlet UILabel *wuran;
@end
@implementation headerView
+(instancetype)init
{
    headerView *header=[[[NSBundle mainBundle]loadNibNamed:@"headerView" owner:nil options:nil]firstObject];
    header.backgroundColor=[UIColor clearColor];
    return header;
}
-(void)setModel:(todayModel *)model
{
    _model=model;
    self.wendu.text=[NSString stringWithFormat:@"%@°",_model.temperature ];
    self.city.text=_model.city_name;
    self.moon.text=_model.moon;
    NSString *strPm=_model.pm25[@"pm25"][@"pm25"];
    self.pm.text=[NSString stringWithFormat:@"PM2.5:%@",strPm];
    self.updateTime.text=[NSString stringWithFormat:@"更新时间:%@",_model.time];
    self.chuanyi.text=_model.chuanyi[1];
    self.kongtiao.text=_model.kongtiao[1];
    self.ganmao.text=_model.ganmao[1];
    self.yundong.text=_model.yundong[1];
    self.ziwaixian.text=_model.ziwaixian[1];
    self.wuran.text=_model.wuran[1];
}
@end
