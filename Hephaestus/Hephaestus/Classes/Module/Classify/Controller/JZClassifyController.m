//
//  JZClassifyController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZClassifyController.h"
#import "JZTextField.h"
#import "TBCityIconFont.h"
#import "JZSearchController.h"
#import <WebKit/WebKit.h>
@interface JZClassifyController ()<UITextFieldDelegate>
@property (nonatomic,strong) WKWebView *wkWebView;
@property (nonatomic,weak) JZTextField *searchField;
@end

@implementation JZClassifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavHead];
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame];
    
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com"]]];
    
    [self.view addSubview:self.wkWebView];
    
}

-(void)setUpNavHead
{
    JZTextField *searchField = [[JZTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 25)];
    [searchField setBackgroundColor:[UIColor whiteColor] isRightBtn:YES isLeftBtn:YES placeholder:@"请输入商品名称"];
    self.searchField = searchField;
    self.searchField.delegate = self;
    self.navigationItem.titleView = searchField;
    
    UIButton *scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [scanBtn addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
    [scanBtn sizeToFit];
    [scanBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e70b", 22, [UIColor whiteColor])] forState:UIControlStateNormal];
    UIBarButtonItem *scanB = [[UIBarButtonItem alloc]initWithCustomView:scanBtn];
    //调整左边间距
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = -13;
    
    self.navigationItem.leftBarButtonItems = @[fixedSpace, scanB];

}

//扫描二维码
-(void)scan
{
    
}

#pragma mark - textField 代理
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    JZSearchController *VC = [[JZSearchController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
