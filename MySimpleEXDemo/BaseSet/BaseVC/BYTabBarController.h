//
//  BYTabBarController.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITabBarController+Extension.h"
@interface BYTabBarItem : NSObject
/*
 * @param clazz             VC名称
 */
@property (nonatomic,strong)NSString *clazz;
/*
 * @param normalPic         默认状态图片
 */
@property (nonatomic,strong)NSString *normalPic;
/*
 * @param selectedPic       选择状态图片
 */
@property (nonatomic,strong)NSString *selectedPic;
/*
 * @param title             tab标题
 */
@property (nonatomic,strong)NSString *title;
/*
 * @param tag               tab编号
 */
@property (nonatomic,assign)NSInteger tag;
/*
 * @param normalTitleColor  默认标题字色
 */
@property (nonatomic,strong)UIColor *normalTitleColor;
/*
 * @param selectedTiltleColor 选择状态字色
 */
@property (nonatomic,strong)UIColor *selectedTiltleColor;
@end

@interface BYTabBarController : UITabBarController
/**
 *  添加tababr 按钮，加nil结尾
 *  只支持xib和代码创建vc
 *  @param firstObject BYTabBarItem对象格式
 */
-(void)addTabItems:(BYTabBarItem *)firstObj,... NS_REQUIRES_NIL_TERMINATION;
/**
 *  按钮上的红点
 *
 *  @param enabled 显示/关闭红点
 *  @param tag     按钮tag值
 */
-(void)showBadgePoint:(BOOL)enabled itemTag:(NSInteger)tag;
@end
