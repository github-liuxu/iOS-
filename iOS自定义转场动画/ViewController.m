//
//  ViewController.m
//  Back
//
//  Created by 刘东旭 on 2019/4/14.
//  Copyright © 2019年 刘东旭. All rights reserved.
//

#import "ViewController.h"
#import "SecondVCViewController.h"
#import "Push.h"
#import "Pop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;
    self.aView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.aView];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    if (operation == UINavigationControllerOperationPush) {
        return [Push new];
    } else {
        return [Pop new];
    }
}

- (IBAction)secondClick:(id)sender {
    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondVCViewController *svc = [st instantiateViewControllerWithIdentifier:@"SecondVC"];
    [self.navigationController pushViewController:svc animated:YES];
}

@end
