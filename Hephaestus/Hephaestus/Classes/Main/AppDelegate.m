//
//  AppDelegate.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "AppDelegate.h"
#import "TBCityIconFont.h"
#import "JZTabBarController.h"
#import "weiboSDK.h"
#import "WTThirdPartyLoginManager.h"

#define WBAppKey @"1831618218"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //微博
    
//    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:WBAppKey];
    
    //添加iconfont
    [TBCityIconFont setFontName:@"iconfont"];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[JZTabBarController alloc]init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:[WTThirdPartyLoginManager shareWTThirdPartyLoginManager]];
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [WeiboSDK handleOpenURL:url delegate:[WTThirdPartyLoginManager shareWTThirdPartyLoginManager]];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:[WTThirdPartyLoginManager shareWTThirdPartyLoginManager]];
}

//-(void)didReceiveWeiboResponse:(WBBaseResponse *)response
//{
//    NSLog(@"------------------");
//    NSLog(@"%@",response);
//    NSLog(@"------------------");
//}
//
//-(void)didReceiveWeiboRequest:(WBBaseRequest *)request
//{
//    NSLog(@"request");
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
