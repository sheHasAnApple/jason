//
//  JZRetweeView.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/27.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZRetweeView.h"
#import "JZPhotosView.h"
#import "UIImage+JZ.h"
#import "JZStatus.h"
#import "JZStatusFrame.h"

@interface JZRetweeView ()
// 昵称
@property (nonatomic, weak) UILabel *nameView;

// 正文
@property (nonatomic, weak) UILabel *textView;

// 配图
@property (nonatomic, weak) JZPhotosView *photosView;

@end

@implementation JZRetweeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_retweet_background"];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.textColor = [UIColor blueColor];
    nameView.font = [UIFont systemFontOfSize:13];
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = [UIFont systemFontOfSize:15];
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    // 配图
    JZPhotosView *photosView = [[JZPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setStatusF:(JZStatusFrame *)statusF
{
    _statusF = statusF;
    
    
    JZStatus *status = statusF.status;
    // 昵称
    _nameView.frame = statusF.retweetNameFrame;
    _nameView.text = status.retweetName;
//    NSLog(@"retweetName----%@",status.retweetName);
    
    // 正文
    _textView.frame = statusF.retweetTextFrame;
    _textView.text = status.retweeted_status.text;
    
    // 配图
    _photosView.frame = statusF.retweetPhotosFrame;
    
    // 注意：这里一定要转让转发微博的配图数
    _photosView.pic_urls = status.retweeted_status.pic_urls;
    
}

@end
