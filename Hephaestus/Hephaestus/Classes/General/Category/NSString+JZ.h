//
//  NSString+JZ.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/3.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JZ)
/**
 *  计算字符串的size
 */
+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize text:(NSString *)text;
@end
