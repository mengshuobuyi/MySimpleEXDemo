//
//  UIView+Extension.m
//  Test
//
//  Created by codyy on 16/8/23.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setCornerRadius:(UIRectCorner)type with:(CGFloat)radius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:type cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}
@end
