//
//  BYTabBarController.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//
#define kAutoValue 45
#define kTabNum 5

#import "BYTabBarController.h"
static inline UITabBarItem * createTabBarItem(BYTabBarItem *obj) {
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:obj.title image:[UIImage imageNamed:obj.normalPic] tag:obj.tag];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:obj.normalTitleColor,NSFontAttributeName:fontSystem(kFontS6)} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:obj.selectedTiltleColor,NSFontAttributeName:fontSystem(kFontS6)} forState:UIControlStateSelected];
    [item setSelectedImage:[UIImage imageNamed:obj.selectedPic]];
    return item;
}

@implementation BYTabBarItem

@end

@implementation BYTabBarController

-(void)addTabItems:(BYTabBarItem *)firstObj, ... {
    NSMutableArray *controllers = @[].mutableCopy;
    if (firstObj) {
        va_list args;
        va_start(args, firstObj);
        NSInteger idx = 0;
        for (BYTabBarItem *obj = firstObj; obj != nil; obj = va_arg(args, BYTabBarItem*)) {
            Class clazz = NSClassFromString(obj.clazz);
            UIViewController *vc;
            if ([obj.clazz isEqualToString:@"BYSlideViewController"]) {
                 vc = [[clazz alloc] initWithNibName:obj.clazz bundle:nil];
            }else{
                vc = [[clazz alloc] init];
            }
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
            navi.tabBarItem = createTabBarItem(obj);
            [controllers addObject:navi];
            [self createRedPoint:idx atLocation:idx];
            idx ++;
        }
        va_end(args);
        self.viewControllers = controllers;
    }
    [self setBkImg:nil];
}

-(void)createRedPoint:(NSInteger)tag atLocation:(NSInteger)idx{
    CGFloat ww = APP_W/kTabNum;
    CGRect frm = (CGRect){idx*ww + kAutoValue,7,12,10};
    
    UIImageView *redPoint = [[UIImageView alloc]initWithFrame:frm];
    redPoint.tag = tag;
    UIImage *image = [UIImage imageWithColor:[UIColor redColor] size:frm.size];
    UIImage *resultImage = [UIImage circleImage:image borderColor:nil borderWidth:0];
    redPoint.image = resultImage;
    redPoint.hidden = YES;
    [self.tabBar addSubview:redPoint];
}

-(void)showBadgePoint:(BOOL)enabled itemTag:(NSInteger)tag {
    for (UIView *view in self.tabBar.subviews) {
        if (view.tag == tag) {
            [self.tabBar bringSubviewToFront:view];
            view.hidden = !enabled;
        }
    }
}
@end
