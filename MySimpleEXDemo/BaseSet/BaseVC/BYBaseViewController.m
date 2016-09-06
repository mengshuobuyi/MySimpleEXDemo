//
//  BYBaseViewController.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "BYBaseViewController.h"
#import "BYTabBarController.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "UserDefaultTool.h"
@interface BYBaseViewController ()

@end

@implementation BYBaseViewController
#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self globleUI];
}

- (void)globleUI {
     self.view.backgroundColor=RGBHex(byColor11);
}

@end
