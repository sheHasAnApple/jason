//
//  JZStatusFrame.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/27.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZStatusFrame.h"
#import "NSString+JZ.h"

@implementation JZStatusFrame

- (void)setStatus:(JZStatus *)status
{
    _status = status;
    
    // 计算原创微博
    [self setUpOriginalViewFrame];
    
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
    if (status.retweeted_status) {
        
        // 计算转发微博
        [self setUpRetweetViewFrame];
        
        toolBarY = CGRectGetMaxY(_retweetViewFrame);
    }
    // 计算工具条
    CGFloat toolBarX = 0;
    CGFloat toolBarW = [UIScreen mainScreen].bounds.size.width;
    CGFloat toolBarH = 35;
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    // 计算cell高度
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
    
}

#pragma mark - 计算原创微博
- (void)setUpOriginalViewFrame
{
    // 头像
    CGFloat imageX = 10;
    CGFloat imageY = imageX;
    CGFloat imageWH = 35;
    _originalIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    // 昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + 10;
    CGFloat nameY = imageY;
    
    CGSize nameSize =[NSString sizeWithFont:[UIFont systemFontOfSize:13]  maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:_status.user.name];
    
//    CGSize nameSize = [_status.user.name sizeWithFont:[UIFont systemFontOfSize:13]];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // vip
    if (_status.user.vip) {
        CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + 10;
        CGFloat vipY = nameY;
        CGFloat vipWH = 14;
        _originalVipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
        
    }
    
    
    // 正文
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + 10;
    
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * 10;
    
    CGSize textSize =[NSString sizeWithFont:[UIFont systemFontOfSize:15]  maxSize:CGSizeMake(textW, MAXFLOAT) text:_status.text];
    
//    CGSize textSize = [_status.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textX,textY},textSize};
    
    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + 10;
    
    // 配图
    if (_status.pic_urls.count) {
        CGFloat photosX = 10;
        CGFloat photosY = CGRectGetMaxY(_originalTextFrame) + 10;
        CGSize photosSize = [self photosSizeWithCount:_status.pic_urls.count];
        
        _originalPhotosFrame = (CGRect){{photosX,photosY},photosSize};
        originH = CGRectGetMaxY(_originalPhotosFrame) + 10;
    }
    
    // 原创微博的frame
    CGFloat originX = 0;
    CGFloat originY = 10;
    CGFloat originW = [UIScreen mainScreen].bounds.size.width;
    
    _originalViewFrame = CGRectMake(originX, originY, originW, originH);
    
}
#pragma mark - 计算配图的尺寸
- (CGSize)photosSizeWithCount:(NSInteger)count
{
    // 获取总列数
    int cols = count == 4? 2 : 3;
    // 获取总行数 = (总个数 - 1) / 总列数 + 1
    long rols = (count - 1) / cols + 1;
    CGFloat photoWH = 70;
    CGFloat w = cols * photoWH + (cols - 1) * 10;
    CGFloat h = rols * photoWH + (rols - 1) * 10;
    
    
    return CGSizeMake(w, h);
    
}

#pragma mark - 计算转发微博
- (void)setUpRetweetViewFrame
{
    // 昵称frame
    // 昵称
    CGFloat nameX = 10;
    CGFloat nameY = nameX;
    // 注意：一定要是转发微博的用户昵称
    
    CGSize nameSize =[NSString sizeWithFont:[UIFont systemFontOfSize:13]  maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:_status.retweetName];
    
//    CGSize nameSize = [_status.retweetName sizeWithFont:[UIFont systemFontOfSize:13]];
    _retweetNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(_retweetNameFrame) + 10;
    
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * 10;
    // 注意：一定要是转发微博的正文
    
    CGSize textSize =[NSString sizeWithFont:[UIFont systemFontOfSize:15]  maxSize:CGSizeMake(textW, MAXFLOAT) text:_status.retweeted_status.text];
    
//    CGSize textSize = [_status.retweeted_status.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _retweetTextFrame = (CGRect){{textX,textY},textSize};
    
    CGFloat retweetH = CGRectGetMaxY(_retweetTextFrame) + 10;
    // 配图
    NSInteger count = _status.retweeted_status.pic_urls.count;
    if (count) {
        CGFloat photosX = 10;
        CGFloat photosY = CGRectGetMaxY(_retweetTextFrame) + 10;
        CGSize photosSize = [self photosSizeWithCount:count];
        
        _retweetPhotosFrame = (CGRect){{photosX,photosY},photosSize};
        
        retweetH = CGRectGetMaxY(_retweetPhotosFrame) + 10;
    }
    
    // 原创微博的frame
    CGFloat retweetX = 0;
    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW = [UIScreen mainScreen].bounds.size.width;
    
    _retweetViewFrame = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    
}

@end
