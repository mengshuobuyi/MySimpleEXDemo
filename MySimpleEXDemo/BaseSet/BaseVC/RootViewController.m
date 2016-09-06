//
//  RootViewController.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController()<UITabBarControllerDelegate>

@end
@implementation RootViewController
#pragma mark - LIFECIRCLE
-(void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:self.tabBar];
    [self.view addSubview:self.tabBar.view];
}

#pragma mark - DELEGATE

#pragma mark - PRIVATE METHOD
-(NSArray *)initailizeDataSource {
    BYTabBarItem *item1 = [BYTabBarItem new];
    item1.title=@"首页";
    item1.clazz=@"BYSlideViewController";
    item1.normalPic=@"icon_common_homepage_rest";
    item1.selectedPic=@"icon_common_homepage_selected";
    item1.normalTitleColor = RGBHex(byColor6);
    item1.selectedTiltleColor = RGBHex(byColor1);
    item1.tag=Enum_TabBar_Item_HomePage;
    
    BYTabBarItem *item2 = [BYTabBarItem new];
    item2.title=@"分类";
    item2.clazz=@"TestMasonryViewController";
    item2.normalPic=@"icon_common_classify_rest";
    item2.selectedPic=@"icon_common_classify_selected";
    item2.normalTitleColor = RGBHex(byColor6);
    item2.selectedTiltleColor = RGBHex(byColor1);
    item2.tag=Enum_TabBar_Item_Store;
    
    BYTabBarItem *item3 = [BYTabBarItem new];
    item3.title=@"购物车";
    item3.clazz=@"UIViewController";
    item3.normalPic=@"icon_common_shopping_rest";
    item3.selectedPic=@"icon_common_shopping_selected";
    item3.normalTitleColor = RGBHex(byColor6);
    item3.selectedTiltleColor = RGBHex(byColor1);
    item3.tag=Enum_TabBar_Item_ShoppingCart;
    
    BYTabBarItem *item4 = [BYTabBarItem new];
    item4.title=@"个人中心";
    item4.clazz=@"UIViewController";
    item4.normalPic=@"icon_common_personal_rest";
    item4.selectedPic=@"icon_common_personal_selected";
    item4.normalTitleColor = RGBHex(byColor6);
    item4.selectedTiltleColor = RGBHex(byColor1);
    item4.tag=Enum_TabBar_Item_UserCenter;
    
    BYTabBarItem *item5 = [BYTabBarItem new];
    item5.title=@"个人中心";
    item5.clazz=@"UIViewController";
    item5.normalPic=@"icon_common_personal_rest";
    item5.selectedPic=@"icon_common_personal_selected";
    item5.normalTitleColor = RGBHex(byColor6);
    item5.selectedTiltleColor = RGBHex(byColor1);
    item5.tag=Enum_TabBar_Item_Profile;
    return @[item1,item2,item3,item4,item5];
}
#pragma mark - SETTER AND GETTER
-(BYTabBarController *)tabBar {
    if (!_tabBar) {
        _tabBar = [[BYTabBarController alloc]init];
        _tabBar.delegate = self;
        NSArray *items = [self initailizeDataSource];
        [_tabBar addTabItems:items[0],items[1],items[2],items[3],items[4], nil];
    }
    return _tabBar;
}
@end
