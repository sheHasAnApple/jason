//
//  JZNavigationController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZNavigationController.h"
#import "JZTabBarController.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
