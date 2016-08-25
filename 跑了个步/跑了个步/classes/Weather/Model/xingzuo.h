//
//  xingzuo.h
//  跑了个步
//
//  Created by qingyun on 16/8/24.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xingzuo : NSObject
@property(nonnull,copy)void(^blkXingzuo)(NSDictionary *);
+(instancetype)initWithNSString:(NSString*)strURL;
@end
