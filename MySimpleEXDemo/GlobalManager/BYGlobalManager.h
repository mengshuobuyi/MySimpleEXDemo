//
//  BYGlobalManager.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <Foundation/Foundation.h>
#define APPDELEGATE [UIApplication sharedApplication].delegate
#define BYGLOBALMANAGER [BYGlobalManager shareInstance]
@interface BYGlobalManager : NSObject
/*
 * 初始化全局管理对象
 */
+(instancetype)shareInstance;
/*
 * tabbar上红点显示
 */
-(void)showRedPoint:(BOOL)show tag:(NSInteger)tag;
/*
 * tabbar上数字显示
 */
-(void)showBageNumber:(NSInteger)num tag:(NSInteger)tag;
@end
