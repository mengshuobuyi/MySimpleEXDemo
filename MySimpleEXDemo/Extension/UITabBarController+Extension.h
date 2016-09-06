//
//  UITabBarController+Extension.h
//  Test
//
//  Created by codyy on 16/8/23.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITabBarController (Extension)

/**
 *  显示按钮badge数字
 *
 *  @param num    要显示的数字，<=0不显示，大于99显示"99"
 *  @param tag    按钮tag值
 */
-(void)showBageNum:(NSInteger)num itemTag:(NSInteger)tag;
/**
 *  设置tabbar背景图片
 *
 *  @param image
 */
-(void)setBkImg:(UIImage *)image;
@end
