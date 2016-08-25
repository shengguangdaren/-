//
//  todayModel.h
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface todayModel : NSObject
@property(nonatomic,strong)NSDictionary *result;
@property(nonatomic,strong)NSDictionary *data;
@property(nonatomic,strong)NSDictionary *life;
@property(nonatomic,strong)NSDictionary *info;
@property(nonatomic,strong)NSDictionary *pm25;
@property(nonatomic,strong)NSDictionary *weather;
@property(nonatomic,strong)NSDictionary *realtime;
@property(nonatomic,copy)NSArray *chuanyi;
@property(nonatomic,copy)NSArray *ganmao;
@property(nonatomic,copy)NSArray *kongtiao;
@property(nonatomic,copy)NSArray *wuran;
@property(nonatomic,copy)NSArray *xiche;
@property(nonatomic,copy)NSArray *yundong;
@property(nonatomic,copy)NSArray *ziwaixian;
@property(nonatomic,strong)NSString *moon;
@property(nonatomic,strong)NSString *city_name;
@property(nonatomic,strong)NSString *week;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *In_fo;
@property(nonatomic,strong)NSString *humidity;
@property(nonatomic,strong)NSString *temperature;
+(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
