//
//  UIImage+JZ.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JZ)
/**
 *  取消系统渲染
 */
+ (instancetype)setOriginalImage:(UIImage *)image;
/**
 *  拉伸图片
 */
+ (instancetype)imageWithStretchableName:(NSString *)imageName;
/**
 *  生成二维码
 */
+(UIImage *)imageOfQRFromURL:(NSString *)networkAddress codeSize:(CGFloat)codeSize;
/**
 *  生成纯色图片
 */
+ (UIImage*) getImageWithColor:(UIColor*)color andHeight:(CGFloat)height;
@end
