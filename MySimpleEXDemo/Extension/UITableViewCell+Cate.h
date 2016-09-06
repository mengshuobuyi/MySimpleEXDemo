//
//  UITableViewCell+Cate.h
//  Test
//
//  Created by codyy on 16/8/10.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Cate)
-(void)setCell:(id)model;
-(void)setDelegate:(id)delegate;
-(CGFloat)getHeight;
@end
