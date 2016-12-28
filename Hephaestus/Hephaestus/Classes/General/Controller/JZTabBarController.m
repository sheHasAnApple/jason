//
//  JZTabBarController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZTabBarController.h"
#import "JZNavigationController.h"
#import "JZHomeController.h"
#import "JZClassifyController.h"
#import "JZConcernController.h"
#import "JZProfileController.h"
#import "TBCityIconFont.h"
#import "UIImage+JZ.h"

@interface JZTabBarController ()

@end

@implementation JZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.translucent = YES;
    self.tabBar.tintColor=[UIColor redColor];
    [self setUpAllChildVC];
    
}

-(void)setUpAllChildVC
{
    JZHomeController *homeVC = [[JZHomeController alloc]init];
    [self setUpOneChildVC:homeVC imageName:@"\U0000e601" title:@"首页"];
    
    JZClassifyController *classifyVC = [[JZClassifyController alloc]init];
    [self setUpOneChildVC:classifyVC imageName:@"\U0000e612" title:@"分类"];
    
    JZConcernController *concernVC = [[JZConcernController alloc]init];
    [self setUpOneChildVC:concernVC imageName:@"\U0000e61c" title:@"关注圈"];
    
    JZProfileController *profileVC = [[JZProfileController alloc]init];
    [self setUpOneChildVC:profileVC imageName:@"\U0000e66e" title:@"我的"];
}

-(void)setUpOneChildVC:(UIViewController *)VC imageName:(NSString *)imageName title:(NSString *)title
{
    VC.title = title;
    VC.tabBarItem.image = [UIImage iconWithInfo:TBCityIconInfoMake(imageName, 20, [UIColor whiteColor])];
    VC.tabBarItem.selectedImage = [UIImage setOriginalImage:[UIImage iconWithInfo:TBCityIconInfoMake(imageName, 20, [UIColor redColor])]];
    JZNavigationController *nav = [[JZNavigationController alloc]initWithRootViewController:VC];
    [self addChildViewController:nav];
}

@end
