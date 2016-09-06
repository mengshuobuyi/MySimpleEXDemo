//
//  RootViewController.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYTabBarController.h"
typedef NS_ENUM(NSInteger,Enum_TabBar_Item) {
    Enum_TabBar_Item_HomePage = 0,
    Enum_TabBar_Item_Store,
    Enum_TabBar_Item_ShoppingCart,
    Enum_TabBar_Item_UserCenter,
    Enum_TabBar_Item_Profile,
};
@interface RootViewController : UIViewController
@property (nonatomic,strong) BYTabBarController* tabBar;
@end
