//
//  getWeather.h
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "weatherModel.h"
@interface getWeather : NSObject
@property(nonatomic,copy)void(^blkModel)(weatherModel *);
+(instancetype)initWithNSString:(NSString *)strUrl;
@end
