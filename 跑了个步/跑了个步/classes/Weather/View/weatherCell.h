//
//  weatherCell.h
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weatherCell : UITableViewCell
@property(nonatomic,copy)NSDictionary *dict;
+(instancetype)initWIthtableView:(UITableView *)tableView;

@end
