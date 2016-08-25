//
//  RunningController.m
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "RunningController.h"
#import "Header.h"
@interface RunningController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property(nonatomic,strong)BMKMapView *mapView;
@property(nonatomic,strong)BMKLocationService *service;


@end

@implementation RunningController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultsSetting];
}
-(void)loadDefaultsSetting
{
    self.mapView=[[BMKMapView alloc]init];
    self.mapView.mapType=BMKMapTypeStandard;
    self.mapView.userTrackingMode=BMKUserTrackingModeFollow;
    self.mapView.delegate=self;
    self.view =self .mapView;
    self.service=[[BMKLocationService alloc]init];
    self.service.delegate=self;
    [self.service startUserLocationService];
}
//方向更新后调用
-(void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"方向%@",userLocation.heading);
}
//位置更新后调用
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [self.mapView updateLocationData:userLocation];
//    self.mapView.centerCoordinate=userLocation.location.coordinate;
    self.mapView.showsUserLocation=YES;
    //    CLLocationCoordinate2D loc=[userLocation.location coordinate];
    BMKLocationViewDisplayParam *param = [[BMKLocationViewDisplayParam alloc] init];
    param.accuracyCircleStrokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    param.accuracyCircleFillColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.3];
    [_mapView updateLocationViewWithParam:param];
    
}

@end
