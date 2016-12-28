//
//  JZLoginViewController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZLoginViewController.h"
#import "Masonry.h"
#import "TBCityIconFont.h"
#import "WTThirdPartyLoginManager.h"
#import "JZAccount.h"
#import "JZAccountTool.h"

@interface JZLoginViewController ()

@end

@implementation JZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
     NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.title = @"登录";
    
    UIImageView *iconView = [[UIImageView alloc]init];
    [self.view addSubview:iconView];
    [iconView setImage:[UIImage imageNamed:@"福"]];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.equalTo(self.view.mas_top).offset(25);
    }];
    
    UITextField *telLabel = [[UITextField alloc]init];
    [self.view addSubview:telLabel];
    telLabel.placeholder = @"请输入手机号";
    [telLabel setBackgroundColor:[UIColor lightGrayColor]];
    [telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(iconView.mas_bottom).offset(40);
        make.height.mas_equalTo(@30);
    }];
    
    UITextField *passwordLabel = [[UITextField alloc]init];
    [self.view addSubview:passwordLabel];
    passwordLabel.placeholder = @"请输入密码";
    [passwordLabel setBackgroundColor:[UIColor grayColor]];
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(telLabel.mas_bottom);
        make.height.mas_equalTo(@30);
    }];
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [self.view addSubview:loginBtn];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(passwordLabel.mas_bottom).offset(30);
        make.height.mas_equalTo(@30);
    }];
    
    UIButton *weiboBtn = [[UIButton alloc]init];
    [self.view addSubview:weiboBtn];
    [weiboBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e60b", 30, [UIColor redColor])] forState:UIControlStateNormal];
    [weiboBtn sizeToFit];
    [weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(40);
    }];
    [weiboBtn addTarget:self action:@selector(weiboLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)weiboLogin
{
    [WTThirdPartyLoginManager getUserInfoWithWTLoginType:WTLoginTypeWeiBo result:^(NSDictionary *LoginResult, NSString *error) {
        
        JZAccount *account = [JZAccount accountWithDict:LoginResult];
        
        [JZAccountTool saveAccount:account];
        
        [self popController];
        
    }];
}

-(void)popController
{
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    self.hidesBottomBarWhenPushed = NO;
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
