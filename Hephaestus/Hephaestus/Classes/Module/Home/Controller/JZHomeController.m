//
//  JZHomeController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZHomeController.h"
#import "JZTextField.h"
#import "TBCityIconFont.h"
#import "JZSearchController.h"
#import "LXDScanCodeController.h"
#import "JZCameraController.h"
#import <WebKit/WebKit.h>

#import "JZLoginViewController.h"

@interface JZHomeController ()<UITextFieldDelegate,LXDScanCodeControllerDelegate,JZTextFieldDelegate>

@property (nonatomic,weak) JZTextField *searchField;
@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation JZHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavHead];
    
    JZLoginViewController *vc = [[JZLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame];
    
//    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:pathString]]];

    
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"file:///Users/jianzhonghuang/Desktop/dist/html/app.html#/home"]]];
    
    [self.view addSubview:self.wkWebView];
}

-(void) setUpNavHead
{
    JZTextField *searchField = [[JZTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 25)];
    [searchField setBackgroundColor:[UIColor whiteColor] isRightBtn:YES isLeftBtn:YES placeholder:@"请输入商品名称"];
    self.searchField = searchField;
    self.searchField.delegate = self;
    self.searchField.JZDelegate = self;
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
    LXDScanCodeController * scanCodeController = [LXDScanCodeController scanCodeController];
    scanCodeController.scanDelegate = self;
//    [self.navigationController pushViewController: scanCodeController animated: YES];
    [self presentViewController:scanCodeController animated:YES completion:nil];
}

#pragma mark - textField 代理
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.hidesBottomBarWhenPushed=YES;
    JZSearchController *search = [[JZSearchController alloc]init];
    search.showCamera = YES;
    [self.navigationController pushViewController:search animated:YES];
    [self.searchField resignFirstResponder];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)JZTextField:(JZTextField *)textField didClickRightButton:(UIButton *)btn
{
    JZCameraController *cameraVC = [[JZCameraController alloc]init];
    [self presentViewController:cameraVC animated:YES completion:nil];
}

#pragma mark - scanController 代理
-(void)scanCodeController:(LXDScanCodeController *)scanCodeController codeInfo:(NSString *)codeInfo
{
    NSLog(@"%@",codeInfo);
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:codeInfo]]];
}


@end
