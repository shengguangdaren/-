//
//  weatherCell.m
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "weatherCell.h"
@interface weatherCell()
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UILabel *T;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *date;
@end
@implementation weatherCell
+(instancetype)initWIthtableView:(UITableView *)tableView
{
    weatherCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"weatherCell" owner:nil options:nil]firstObject];
    }
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
-(void)setDict:(NSDictionary *)dict
{
    self.wind.text=dict[@"wind"];
    self.T.text=dict[@"temperature"];
    self.weather.text=dict[@"weather"];
    self.date.text=dict[@"week"];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
