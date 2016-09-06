//
//  Constant.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/24.
//  Copyright © 2016年 zpx. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define APP_W [UIScreen mainScreen].bounds.size.width
#define APP_H [UIScreen mainScreen].bounds.size.height


#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

/**
 *  使用rgb颜色
 */
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, alpha) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/**
 *  使用16位表达
 */
#define RGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBAHex(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(alphaValue)]

/**
 *  使用字体
 */
#define font(fontName,fontSize)         [UIFont fontWithName:fontName size:fontSize]
#define fontSystem(fontSize)            [UIFont systemFontOfSize:fontSize]
#define fontSystemBold(fontSize)        [UIFont boldSystemFontOfSize:fontSize]

/**
 *  颜色样式表
 *  根据UI色表定义
 */

//新规范色
#define byColor1    0x1975cf    // 原来的3色 基础色
#define byColor2    0xff9402    // 用于按钮，优惠信息，交互反馈色
#define byColor3    0xff5000    // 用于疯抢，优惠，未读消息背景色等标签底色
#define byColor4    0xffffff    // 用于反白
#define byColor5    0x00a0ff    // 用于链接
#define byColor6    0x333333    // 用于标题，正文
#define byColor7    0x666666    // 用于菜单，列表文字
#define byColor8    0x999999    // 用于说明文字，提示文案
#define byColor9    0xcccccc    // 用于搜索框，输入框默认提示，次要文字，无效文字
#define byColor10   0xe4e4e4    // 用于分割线，按钮描边
#define byColor11   0xf6f8fb    // 用于cell背景色
#define byColor12   0xff6600    // 其他 橘黄
#define byColor13   0x70bcee    // 其他 淡蓝
#define byColor14   0x8ccf70    // 其他 淡绿
#define byColor15   0xffbe5a    // 其他 淡黄
#define byColor16   0xfef7db    // 其他 超淡黄
#define byColor17   0x000000    // 深黑
#define byColor18   0xfafafa    // 淡灰
#define byColor19   0xfffdf6    // 超超超淡黄
#define byColor20   0xc2c2c2
#define byColor21   0xf2f4f7    // 用于大背景色
#define byColor22   0xc0c5d0    // 用于空态页文字
#define byColor23   0xfff7dc    // 用于公告提示背景色
#define byColor24   0x9e8052    // 用于公告提示文字
#define byColor25   0xfcfcfc    // 用于输入框背景色
#define byColor26   0xfda1a4    // 淡红





/**
 *  文字样式表
 */
#define kFont1 @"Helvetica"
#define kFont2 @"Helvetica-Bold"


/**
 *  文字大小
 */
#define kFontS1     15
#define kFontS2     17
#define kFontS3     16
#define kFontS4     14
#define kFontS5     12
#define kFontS6     11
#define kFontS7     65
#define kFontS8     27
#define kFontS9     9
#define kFontS10    20
#define kFontS11    13
#define kFontS12    25
#define kFontS13    18
#define kFontS14    57



#endif /* Constant_h */
