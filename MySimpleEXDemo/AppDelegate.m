//
//  AppDelegate.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "AFNetworkReachabilityManager.h"
@interface AppDelegate ()
@property (nonatomic,strong)AFNetworkReachabilityManager *manager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [self setNaviBarAndTabBar];
    RootViewController *rvc = [RootViewController new];
    self.window.rootViewController = rvc;
    [self.window makeKeyAndVisible];
    [self.manager startMonitoring];
    return YES;
}

-(AFNetworkReachabilityManager *)manager {
    if (!_manager) {
        _manager = [AFNetworkReachabilityManager manager];
        [_manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN://2G,3G,4G
                    
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    
                    break;
            }
        }];
    }
    return _manager;
}

- (void)setNaviBarAndTabBar {
    /*
     * this method was deprecated in 9.0,use -[UIViewController preferredStatusBarStyle:] instead (ios7)
     */
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //导航栏背景色
    [[UINavigationBar appearance] setBarTintColor:RGBHex(byColor4)];
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIImage *image = [UIImage imageWithColor:RGBHex(byColor4) size:rect.size];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
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
