//
//  UIImage+JZ.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "UIImage+JZ.h"
#import <CoreImage/CoreImage.h>

@implementation UIImage (JZ)

+ (instancetype)setOriginalImage:(UIImage *)image
{
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}


//生成二维码
+(UIImage *)imageOfQRFromURL:(NSString *)networkAddress codeSize:(CGFloat)codeSize
{
    if (!networkAddress || (NSNull *)networkAddress == [NSNull null]) return nil;
    
    codeSize = [self validateCodeSize: codeSize];
    
    CIImage * originImage = [self createQRFromAddress: networkAddress];
    
    UIImage * result =[self excludeFuzzyImageFromCIImage: originImage size: codeSize];
    return result;
    
}
/*! 验证二维码尺寸合法性*/
+ (CGFloat)validateCodeSize: (CGFloat)codeSize

{
    
    codeSize = MAX(160, codeSize);
    
    codeSize = MIN(CGRectGetWidth([UIScreen mainScreen].bounds) - 80, codeSize);
    
    return codeSize;
    
}

/*! 利用系统滤镜生成二维码图*/
+ (CIImage *)createQRFromAddress: (NSString *)networkAddress

{
    NSData * stringData = [networkAddress dataUsingEncoding: NSUTF8StringEncoding];
    
    CIFilter * qrFilter = [CIFilter filterWithName: @"CIQRCodeGenerator"];
    
    [qrFilter setValue: stringData forKey: @"inputMessage"];
    
    [qrFilter setValue: @"H" forKey: @"inputCorrectionLevel"];
    
    return qrFilter.outputImage;
}

/*! 对图像进行清晰化处理*/
+ (UIImage *)excludeFuzzyImageFromCIImage: (CIImage *)image size: (CGFloat)size

{
    CGRect extent = CGRectIntegral(image.extent);

    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));

    size_t width = CGRectGetWidth(extent) * scale;

    size_t height = CGRectGetHeight(extent) * scale;

    //创建灰度色调空间

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();

    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);

    CIContext * context = [CIContext contextWithOptions: nil];

    CGImageRef bitmapImage = [context createCGImage: image fromRect: extent];

    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);

    CGContextScaleCTM(bitmapRef, scale, scale);

    CGContextDrawImage(bitmapRef, extent, bitmapImage);

    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);

    CGContextRelease(bitmapRef);

    CGImageRelease(bitmapImage);

    CGColorSpaceRelease(colorSpace);

    return [UIImage imageWithCGImage: scaledImage];
    
}



@end
