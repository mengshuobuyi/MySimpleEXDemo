//
//  UIImage+Extension.m
//  Test
//
//  Created by codyy on 16/8/22.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (color) {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
    return nil;
}

+(UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    //设置边框宽度
    CGFloat imageWH = MIN(originImage.size.width, originImage.size.height);
    
    CGFloat ovalWH = imageWH - 2*borderWidth;
    
    UIGraphicsBeginImageContextWithOptions(originImage.size, NO, 0);
    
    if (borderColor) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, imageWH, imageWH)];
        [borderColor set];
        [path fill];
    }
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, ovalWH, ovalWH)];
    [clipPath addClip];
    
    //绘制图片
    [originImage drawAtPoint:CGPointMake(borderWidth, borderWidth)];

    //从上下文中获取图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    return resultImage;
    
}
-(UIImage *)convertGrayImage:(UIImage *)originImage {
    CGRect imageRect = CGRectMake(0, 0, originImage.size.width, originImage.size.height);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, originImage.size.width, originImage.size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGContextDrawImage(context, imageRect, [originImage CGImage]);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    return newImage;
}
@end
