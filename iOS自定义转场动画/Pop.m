//
//  Pop.m
//  Back
//
//  Created by 刘东旭 on 2019/4/14.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import "Pop.h"
#import "SecondVCViewController.h"
#import "ViewController.h"

@implementation Pop

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 1.我们需要得到参与切换的两个ViewController的信息，使用context的方法拿到它们的参照；
    ViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SecondVCViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 2.对于要呈现的VC，我们逐渐缩小；
    UIView *aView = [fromVC.view viewWithTag:1];
    [toVC.view addSubview:aView];
    // 3.将view添加到containerView中；
    [[transitionContext containerView] addSubview:toVC.view];
    // 4.开始动画。
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        [toVC.view viewWithTag:1].frame = CGRectMake(0,100,100,100);
    } completion:^(BOOL finished) {
        // 5.在动画结束后我们必须向context报告VC切换完成，是否成功。系统在接收到这个消息后，将对VC状态进行维护。
        [transitionContext completeTransition:YES];
    }];
    
}

@end
