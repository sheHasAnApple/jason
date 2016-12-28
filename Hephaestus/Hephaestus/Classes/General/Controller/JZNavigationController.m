//
//  JZNavigationController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZNavigationController.h"
#import "JZTabBarController.h"
#import "UIImage+JZ.h"

@interface JZNavigationController ()

@end

@implementation JZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setBarTintColor:[UIColor redColor]];
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}


- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.topViewController;
}


@end
