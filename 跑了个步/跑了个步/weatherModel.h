//
//  weatherModel.h
//  BreakingNews
//
//  Created by qingyun on 16/8/7.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface weatherModel : NSObject
/** 当前天气状况*/
@property(nonatomic,copy)NSDictionary *sk;
/** 今天一天天气*/
@property(nonatomic,copy)NSDictionary *today;
/** 未来几天天气状况*/
@property(nonatomic,copy)NSArray *future;
/** 当前温度状况*/
@property(nonatomic,strong)NSString *temp;
/** 当前风向*/
@property(nonatomic,strong)NSString * wind_direction;
/** 当前风力*/
@property(nonatomic,strong)NSString *wind_strength;
/** 更新时间*/
@property(nonatomic,strong)NSString *time;
/** 当前湿度状况*/
@property(nonatomic,strong)NSString *humidity;
/** 当前城市*/
@property(nonatomic,strong)NSString *city;
/** 日期（礼拜）*/
@property(nonatomic,strong)NSString *week;
/** 当日温度范围*/
@property(nonatomic,strong)NSString *temperature;
/** 年月日状况*/
@property(nonatomic,strong)NSString *date_y;
/** 当日天气状况*/
@property(nonatomic,strong)NSString *weather;

+(instancetype)initWithDictionary:(NSDictionary *)dict;


@end
