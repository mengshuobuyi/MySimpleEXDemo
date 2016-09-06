//
//  UITabBarController+Extension.m
//  Test
//
//  Created by codyy on 16/8/23.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "UITabBarController+Extension.h"

@implementation UITabBarController (Extension)

-(void)setBkImg:(UIImage *)image {
    if (!image)
        [self.tabBar setBackgroundImage:[UIImage imageNamed:@"black_Navigation"]];
    else
        [self.tabBar setBackgroundImage:image];
}

-(void)showBageNum:(NSInteger)num itemTag:(NSInteger)tag {
    for (UINavigationController *navi in self.viewControllers) {
        UITabBarItem *item = navi.tabBarItem;
        if (item.tag == tag) {
            if (num < 0) {
                item.badgeValue = nil;
            }else if (num > 99) {
                item.badgeValue = @"99";
            }else {
                item.badgeValue = [NSString stringWithFormat:@"%ld",(long)num];
            }
        }
    }
}
@end
