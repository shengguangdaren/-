//
//  ViewController.m
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "WeatherController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "getWeather.h"
#import "weatherCell.h"
#import "weatherCityController.h"
#import "headerViewCell.h"
#import "contentWeatherController.h"
static NSString *const strKey=@"96390dd4b3620ccf089a3728842cda63";
@interface WeatherController ()<CLLocationManagerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)CLLocation *cllocation;
@property(nonatomic,strong)NSString *strWeatherUrl;
@property(nonatomic,strong)weatherModel *model;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *arrFuture;
@property(nonatomic,strong)NSString *strWeatherCity;
@end
@implementation WeatherController
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent=NO;
    [self.navigationController.navigationBar.subviews.firstObject setAlpha:0];
//    [self.tabBarController.tabBar.subviews.firstObject setAlpha:0];
    [self loaddefaultssetting];
    [self loadTableView];
}
- (IBAction)getAction:(UIBarButtonItem *)sender {
    __weak typeof(self)weakself=self;
    weatherCityController *city=[self.storyboard instantiateViewControllerWithIdentifier:@"weatherCityController"];
    [self.navigationController pushViewController:city animated:YES];
    
    [city setBlkCity:^(NSString *strCity) {
        NSLog(@"%@",strCity);
        weakself.strWeatherCity=strCity;
        CLGeocoder *geo=[[CLGeocoder alloc]init];
        if (weakself.strWeatherCity==0){
            NSLog(@"请输入城市");
            return;
        }
        [geo geocodeAddressString:weakself.strWeatherCity completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (error!=nil || placemarks.count==0   ) {
                NSLog(@"请输入正确城市名");
                return ;
            }
            CLPlacemark *pl=[placemarks firstObject];
            self.strWeatherUrl=[NSString stringWithFormat:@"http://v.juhe.cn/weather/geo?format=2&key=%@&lon=%f&lat=%f&dtype=json",strKey,pl.location.coordinate.longitude,pl.location.coordinate.latitude];
            getWeather *weather=[getWeather initWithNSString:self.strWeatherUrl];
            [weather setBlkModel:^(weatherModel *model) {
                weakself.model=model;
                [weakself.tableView reloadData];
                NSLog(@"%@",model.city);
            }];
            NSLog(@"%f>>>>>>>>%f",pl.location.coordinate.latitude,pl.location.coordinate.longitude);
        }];
    }];
}
- (IBAction)locationAction:(UIButton *)sender {
    [self loaddefaultssetting];
}
-(void)loadTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"优3.jpeg"];
    self.tableView.backgroundView=imageView;
}
-(void)loaddefaultssetting{
    self.locationManager=[[CLLocationManager alloc]init];
    self.locationManager.delegate=self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    if ([CLLocationManager locationServicesEnabled]){
        [self.locationManager startUpdatingLocation];
        NSLog(@"开始更新位置信息");
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return self.model.future.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
    
        headerViewCell *cell=[headerViewCell initWIthtableView:tableView];
        cell.model=self.model;
        return cell;
    }
    weatherCell *cell=[weatherCell initWIthtableView:tableView ];
    cell.dict=self.model.future[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        contentWeatherController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"contentWeather"];
        vc.city=self.model.city;
//        UIBarButtonItem *btn=[[UIBarButtonItem alloc]init];
//        [btn setBackButtonBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIImage *image = [UIImage imageNamed:@"返回"];
        
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationController.navigationBar.backIndicatorImage=image;
       self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
        UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
        [buttonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(-500, 0) forBarMetrics:UIBarMetricsDefault];

        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 200;
    }
    return 100;
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
     __weak typeof(self)weakself=self;
    NSLog(@"Longitude = %f", manager.location.coordinate.longitude);
    NSLog(@"Latitude = %f", manager.location.coordinate.latitude);
    CGFloat lon=manager.location.coordinate.longitude;
    CGFloat lat=manager.location.coordinate.latitude;
    if (lon>=1e-6  || lat>=1e-6){
        CLLocation *newlocation=manager.location;
        CLLocation *cl=[[CLLocation alloc]initWithLatitude:newlocation.coordinate.latitude longitude:newlocation.coordinate.longitude];
        self.cllocation=cl;
        self.strWeatherUrl=[NSString stringWithFormat:@"http://v.juhe.cn/weather/geo?format=2&key=%@&lon=%f&lat=%f&dtype=json",strKey,newlocation.coordinate.longitude,newlocation.coordinate.latitude];
        getWeather *weather=[getWeather initWithNSString:self.strWeatherUrl];
        [weather setBlkModel:^(weatherModel *model) {
            weakself.model=model;
            [weakself.tableView reloadData];
             NSLog(@"%@",model.city);
        }];
    }
    [self.locationManager stopUpdatingLocation];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
@end
