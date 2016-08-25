//
//  getContentWeather.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//
#import "getContentWeather.h"
#import <AFNetworking.h>
static NSString *const strURL= @"http://op.juhe.cn/onebox/weather/query?cityname=%@&key=%@";
static NSString *const strKey=@"0aad54ee6ee7b04f30890495a524c6d0";
@implementation getContentWeather
+(instancetype)initWithNSString:(NSString *)city
{
    NSString *strUtf8=  [city stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *strUrl=[NSString stringWithFormat:strURL,strUtf8,strKey];
    getContentWeather *weather=[getContentWeather new];
    AFHTTPSessionManager *manager1=[AFHTTPSessionManager manager];
    [manager1 GET:strUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                        NSLog(@"天气信息%@",responseObject);
        todayModel *model=[todayModel initWithDictionary:responseObject];
        if (weather.blkModel) {
            weather.blkModel(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错你妹啊>>>>%@",error);
    }];
    return weather;
}
@end
