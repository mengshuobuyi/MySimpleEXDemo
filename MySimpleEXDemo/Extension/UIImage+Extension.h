//
//  UIImage+Extension.h
//  Test
//
//  Created by codyy on 16/8/22.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>
//水印位置
typedef NS_ENUM(NSInteger,ImageWaterDirect) {
    ImageWaterDirectTopLeft,            //左上
    ImageWaterDirectTopRight,           //右上
    ImageWaterDirectBottomLeft,         //左下
    ImageWaterDirectBottomRight,        //右下
    ImageWaterDirectCenter,             //正中
};
@interface UIImage (Extension)
/**
 *  根据颜色生成一张图片
 *
 *  @param color 颜色
 *  @param size  图片大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  生成圆角的图片
 *
 *  @param originImage 原始图片
 *  @param borderColor 边框原色
 *  @param borderWidth 边框宽度
 *
 *  @return 圆形图片
 */
+ (UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 *  生成黑白图片
 *
 *  @param originImage 原始图片
 *
 *  @return 黑白图片
 */
-(UIImage *)convertGrayImage:(UIImage *)originImage;
/**
 *  修正图片方向
 *
 *  @param
 *
 *  @return 修正后的图片
 */
- (UIImage *)fixOrientation;

/**
 *  对图片进行模糊处理
 *
 *  @param image    原始图片
 *  @param radius   模糊半径
 *
 *  @return 修正后的图片
 */
+(UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;
/**
 *  对颜色生成的图片进行模糊处理
 *  @param color    颜色
 *  @param size     图片尺寸
 *  @param radius   模糊半径
 *
 *  @return 修正后的图片
 */
+(UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius;

/**
 *  对图片进行等比例缩放
 *
 *  @param image    原始图片
 *  @param scaleSize   缩放比例
 *
 *  @return 修正后的图片
 */
+(UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;
/**
 *  对图片进行自定长宽缩放
 *
 *  @param image    原始图片
 *  @param reSize   自定长宽
 *
 *  @return 修正后的图片
 */
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
/**
 *  截屏
 *
 *
 *  @return 修正后的图片
 */
+(UIImage *)cutScreen;
/**
 *  从给定的view中截图
 *
 *  @param image    给定的view
 *
 *  @return 修正后的图片
 */
+(UIImage *)cutFromView:(UIView *)view;
/**
 *  从给定image中截取指定frame的截图
 *
 *  @param frame   指定的frame
 *
 *  @return 修正后的图片
 */
-(UIImage *)cutWithFrame:(CGRect)frame;
/**
 *  文字水印
 *
 *  @param text      文字
 *  @param direction 文字方向
 *  @param fontColor 文字颜色
 *  @param fontPoint 字体
 *  @param marginXY   对齐点
 *
 *  @return
 */
- (UIImage *)waterWithText:(NSString *)text
                 direction:(ImageWaterDirect)direction
                 fontColor:(UIColor *)fontColor
                 fontPoint:(CGFloat)fontPoint
                  marginXY:(CGPoint)marginXY;
/**
 *  绘制图片水印
 *
 *  @param waterImage 图片水印
 *  @param direction  方向
 *  @param waterSize  水印大小
 *  @param marginXY   对齐点
 *
 *  @return
 */
- (UIImage *)waterWithWaterImage:(UIImage *)waterImage
                       direction:(ImageWaterDirect)direction
                       waterSize:(CGSize)waterSize
                        marginXY:(CGPoint)marginXY;

/**
 *  获取图片指定位置的颜色
 *
 *  @param point 位置
 *
 *  @return 颜色
 */
-(UIColor *)colorAtPoint:(CGPoint)point;
/**
 *  旋转图片
 *
 *  @param isHorizontal 方向
 *
 *  @return 结果图片
 */
-(UIImage *)flip:(BOOL)isHorizontal;

@end
