//
//  BYGlobalManager.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "BYGlobalManager.h"
#import "BYTabBarController.h"
#import "RootViewController.h"


@implementation BYGlobalManager
#pragma mark - Publich Method
+(instancetype)shareInstance {
    static dispatch_once_t once;
    static BYGlobalManager *shareObj = nil;
    dispatch_once(&once, ^{
        shareObj = [[self alloc] init];
    });
    return shareObj;
}

-(void)showRedPoint:(BOOL)show tag:(NSInteger)tag {
    BYTabBarController *tab = [self getTabBarController];
    [tab showBadgePoint:show itemTag:tag];
}

-(void)showBageNumber:(NSInteger)num tag:(NSInteger)tag {
    BYTabBarController *tab = [self getTabBarController];
    [tab showBageNum:num itemTag:tag];
}
#pragma mark - Private Method
-(BYTabBarController *)getTabBarController {
    RootViewController *rtvc = (RootViewController *)APPDELEGATE.window.rootViewController;
    BYTabBarController *tab = (BYTabBarController *)rtvc.tabBar;
    return tab;
}

@end
