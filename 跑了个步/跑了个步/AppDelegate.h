//
//  AppDelegate.h
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
    BMKMapManager *_mapManager;
}

@property (strong, nonatomic) UIWindow *window;


@end

