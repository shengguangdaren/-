//
//  headerViewCell.h
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherModel.h"
@interface headerViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *city;
@property(nonatomic,copy)weatherModel *model;
+(instancetype)initWIthtableView:(UITableView *)tableView;
@end
