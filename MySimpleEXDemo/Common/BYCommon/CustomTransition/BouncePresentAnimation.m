//
//  BouncePresnetAnimation.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/9/7.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //four steps
    //first get toVC from transitionContext
    //second set init frame for toVC
    //third add toVC's view to containerView
    //last do animate
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
