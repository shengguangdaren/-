//
//  weatherCityController.m
//  跑了个步
//
//  Created by qingyun on 16/8/22.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "weatherCityController.h"

@interface weatherCityController ()
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@end

@implementation weatherCityController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)finishAction:(UIButton *)sender {
//    __weak typeof(self)weakself=self;
    if (self.blkCity)
    {
        self.blkCity(self.cityField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

@end
