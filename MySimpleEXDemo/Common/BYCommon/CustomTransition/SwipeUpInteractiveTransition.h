//
//  SwipeUpInteractiveTransition.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/9/7.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic,assign) BOOL interacting;
-(void)wireToViewController:(UIViewController *)viewController;
@end
