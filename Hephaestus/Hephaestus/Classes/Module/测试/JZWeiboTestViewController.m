//
//  JZWeiboTestViewController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZWeiboTestViewController.h"
#import "weiboSDK.h"
#import "WTThirdPartyLoginManager.h"

#define WBRedirectURI @"https://api.weibo.com/oauth2/default.html"

@interface JZWeiboTestViewController ()

@property (nonatomic ,strong) UIImageView *imageView;

@end

@implementation JZWeiboTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:tapBtn];
    [tapBtn setFrame:CGRectMake(100, 100, 50, 50)];
    [tapBtn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc]init];
    [self.view addSubview:_imageView];
    [self.imageView setFrame:CGRectMake(100, 150, 100, 100)];
    
}

-(void)tap
{
    [WTThirdPartyLoginManager getUserInfoWithWTLoginType:WTLoginTypeWeiBo result:^(NSDictionary *LoginResult, NSString *error) {
        
        
        NSLog(@"%@",[NSThread currentThread]);
        
        if (LoginResult) {
            
            NSLog(@"🐒🐒🐒🐒🐒🐒🐒🐒-----%@", LoginResult);
            
            
            
            NSLog(@"%@",LoginResult[@"third_name"]);
            
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:LoginResult[@"third_image"]]];
            self.imageView.image = [UIImage imageWithData:data];
            
        }else{
            NSLog(@"%@",error);
        }
        
    }];
    
    
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
