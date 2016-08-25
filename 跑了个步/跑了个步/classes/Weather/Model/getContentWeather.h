//
//  getContentWeather.h
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "todayModel.h"
@interface getContentWeather : NSObject
@property(nonatomic,copy)void(^blkModel)(todayModel *);
+(instancetype)initWithNSString:(NSString *)city;
@end
