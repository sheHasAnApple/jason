//
//  JZTestViewController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/11.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZTestViewController.h"
#import "Masonry.h"
#import "TBCityIconFont.h"
#import "UIImage+JZ.h"
#import "weiboSDK.h"



@interface JZTestViewController ()

@end

@implementation JZTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e63f", 40, [UIColor colorWithRed:255/255.0 green:138/255.0 blue:88/255.0 alpha:1.0])];
    
    [self saveImage:image];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    [button setFrame:CGRectMake(100, 100, 50, 50)];
//    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
}

//-(void)tap
//{
//    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
//    request.redirectURI = WBRedirectURI;
//    request.scope = @"all";
//    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
//                         @"Other_Info_1": [NSNumber numberWithInt:123],
//                         @"Other_Info_2": @[@"obj1", @"obj2"],
//                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
//    [WeiboSDK sendRequest:request];
//    
//}

//存图片到本地沙盒
-(void)saveImage:(UIImage *)image
{
    //拿到图片
    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/flower.png"];
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
    NSLog(@"%@",imagePath);
}

//-(void)tap
//{
//    CGFloat size = 200;
//    UIImage *two = [UIImage imageOfQRFromURL:@"http://www.baidu.com" codeSize:size];
//}

@end
