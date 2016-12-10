//
//  JZConcernController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZConcernController.h"
#import "UIImage+JZ.h"

#import "JZHttp.h"

@interface JZConcernController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation JZConcernController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *click = [UIButton buttonWithType:UIButtonTypeContactAdd];
    click.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:click];
    [click addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setBackgroundColor:[UIColor redColor]];
    [imageView setFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    UIButton *clip = [UIButton buttonWithType:UIButtonTypeContactAdd];
    clip.frame = CGRectMake(200, 0, 50, 50);
    [self.view addSubview:clip];
    [clip addTarget:self action:@selector(clipImage) forControlEvents:UIControlEventTouchUpInside];
}

-(void)tap
{
        
    
    CGFloat size = 200;
    UIImage *two = [UIImage imageOfQRFromURL:@"http://www.baidu.com" codeSize:size];
    
    self.imageView.image = two;
}

-(void)clipImage
{
    
    
}

@end
