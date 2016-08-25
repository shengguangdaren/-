//
//  todayModel.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "todayModel.h"

@implementation todayModel
+(instancetype)initWithDictionary:(NSDictionary *)dict
{
    todayModel *model=[todayModel new];
    model.result=dict[@"result"];
    model.data=model.result[@"data"];
    model.life=model.data[@"life"];
    model.realtime=model.data[@"realtime"];
    model.info=model.life[@"info"];
    model.pm25=model.data[@"pm25"];
    model.weather=model.realtime[@"weather"];
    model.chuanyi=model.info[@"chuanyi"];
    model.ganmao=model.info[@"ganmao"];
    model.kongtiao=model.info[@"kongtiao"];
    model.wuran=model.info[@"wuran"];
    model.xiche=model.info[@"xiche"];
    model.yundong=model.info[@"yundong"];
    model.ziwaixian=model.info[@"ziwaixian"];
    model.moon=model.realtime[@"moon"];
    model.city_name=model.realtime[@"city_name"];
    model.week=model.realtime[@"week"];
    model.time=model.realtime[@"time"];
    model.date=model.realtime[@"date"];
    model.humidity=model.weather[@"humidity"];
    model.temperature=model.weather[@"temperature"];
    return model;
}
@end
