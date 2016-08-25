//
//  weatherModel.m
//  BreakingNews
//
//  Created by qingyun on 16/8/7.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "weatherModel.h"
@implementation weatherModel
+(instancetype)initWithDictionary:(NSDictionary *)dict
{
    weatherModel *Model=[weatherModel new];
    Model.sk=dict[@"sk"];
    Model.today=dict[@"today"];
    Model.future=dict[@"future"];
    Model.temp=Model.sk[@"temp"];
    Model.wind_direction=Model.sk[@"wind_direction"];
    Model.wind_strength=Model.sk[@"wind_strength"];
    Model.time=Model.sk[@"time"];
    Model.humidity=Model.sk[@"humidity"];
    Model.city=Model.today[@"city"];
    Model.week=Model.today[@"week"];
    Model.temperature=Model.today[@"temperature"];
    Model.date_y=Model.today[@"date_y"];
    Model.weather=Model.today[@"weather"];
    return Model;
}
@end
