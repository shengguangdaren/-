//
//  AppDelegate.m
//  跑了个步
//
//  Created by qingyun on 16/8/21.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)onGetNetworkState:(int)iError
{
    if (0==iError)
    {
        NSLog(@"联网成功");
    }else
    {
        NSLog(@"联网失败%d",iError);
    }
}
-(void)onGetPermissionState:(int)iError
{
    if (0==iError) {
        NSLog(@"授权成功");
    }
    else{
        NSLog(@"授权失败%d",iError);
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _mapManager=[[BMKMapManager alloc]init];
    BOOL ret=[_mapManager start:@"deAiTNwuSOTvOQrsAVdr6HMlepMRhNjN" generalDelegate:nil];
    if (!ret)
    {
        NSLog(@"manager start failed");
    }
    //    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
