//
//  headerViewCell.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//
#import "headerViewCell.h"
@interface headerViewCell()
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *wendu;
@property (weak, nonatomic) IBOutlet UILabel *shidu;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UIButton *Image;
@end
@implementation headerViewCell
+(instancetype)initWIthtableView:(UITableView *)tableView
{
    headerViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"headercell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"headerViewCell" owner:nil options:nil]firstObject];
    }
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
-(void)setModel:(weatherModel *)model{
    _model=model;
    self.city.text=model.city;
        NSString *strDate=[[model.date_y componentsSeparatedByString:@"年"]lastObject];
    self.date.text=[NSString stringWithFormat:@"%@,%@",strDate,model.week];
    self.weather.text=model.weather;
    self.wendu.text=model.temperature;
    self.shidu.text=[NSString stringWithFormat:@"湿度:%@",model.humidity];
    self.wind.text=[NSString stringWithFormat:@"%@,%@",model.wind_direction,model.wind_strength];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
@end
