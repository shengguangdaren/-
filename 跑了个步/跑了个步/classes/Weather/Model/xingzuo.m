//
//  xingzuo.m
//  跑了个步
//
//  Created by qingyun on 16/8/24.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "xingzuo.h"
#import <AFNetworking.h>
static NSString *const strKey=@"72ff81998f67208ce7c86d3196105674";

@implementation xingzuo
+(instancetype)initWithNSString:(NSString *)strURL
{
    xingzuo *request=[xingzuo new];
    NSString *str=[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *strUrl=[NSString stringWithFormat:@"http://web.juhe.cn:8080/constellation/getAll?consName=%@&type=today&key=%@",str,strKey];
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:strUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成了个功%@",responseObject);
        if (request.blkXingzuo) {
            request.blkXingzuo(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"----.....>>>>>%@",error);
        
    }];
    return request;
}
@end
