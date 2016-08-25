//
//  headerView.h
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todayModel.h"
@interface headerView : UIView
@property(nonatomic,strong)todayModel *model;
+(instancetype)init;
@end
