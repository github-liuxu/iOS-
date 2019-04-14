//
//  Push.m
//  Back
//
//  Created by 刘东旭 on 2019/4/14.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import "Push.h"
#import "SecondVCViewController.h"
#import "ViewController.h"

@implementation Push

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    UIView *containtView = transitionContext.containerView;
    // 1.我们需要得到参与切换的两个ViewController的信息，使用context的方法拿到它们的参照；
    SecondVCViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect initRect = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalRect = CGRectOffset(initRect, 0, [UIScreen mainScreen].bounds.size.height);
    // 2.对于要呈现的VC，我们逐渐放大；
    fromVC.aView.tag = 1;
    [toVC.view addSubview:fromVC.aView];
    // 3.将view添加到containerView中；
    [[transitionContext containerView] addSubview:toVC.view];
    // 4.开始动画。
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        [toVC.view viewWithTag:1].frame = toVC.view.bounds;
    } completion:^(BOOL finished) {
        // 5.在动画结束后我们必须向context报告VC切换完成，是否成功。系统在接收到这个消息后，将对VC状态进行维护。
        [transitionContext completeTransition:YES];
    }];
    
}

@end
