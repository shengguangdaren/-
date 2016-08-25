//
//  getWeather.m
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "getWeather.h"
#import <AFNetworking.h>
@implementation getWeather
+(instancetype)initWithNSString:(NSString *)strUrl
{
    getWeather *weather=[getWeather new];
//    __weak typeof(self)weakself=self;
    AFHTTPSessionManager *manager1=[AFHTTPSessionManager manager];
    [manager1 GET:strUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"天气信息%@",responseObject);
        NSDictionary *dict=responseObject[@"result"];
        weatherModel *model=[weatherModel initWithDictionary:dict];
        if (weather.blkModel )
        {
            weather.blkModel(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"错你妹啊>>>>%@",error);
    }];
    return weather;
}
@end
