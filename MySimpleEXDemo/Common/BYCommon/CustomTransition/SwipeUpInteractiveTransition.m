//
//  SwipeUpInteractiveTransition.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/9/7.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "SwipeUpInteractiveTransition.h"
@interface SwipeUpInteractiveTransition()
@property (nonatomic,assign) BOOL shouldComplete;
@property (nonatomic,strong) UIViewController *presentingVC;
@end
@implementation SwipeUpInteractiveTransition
-(void)wireToViewController:(UIViewController *)viewController {
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

-(void)prepareGestureRecognizerInView:(UIView *)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

-(void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = translation.y/400.0;
            fraction = fminf(fmaxf(fraction, 0.0),1.0);
            self.shouldComplete = fraction>0.5;
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }else {
                [self finishInteractiveTransition];
            }
            break;
        default:
            break;
    }
}
@end
