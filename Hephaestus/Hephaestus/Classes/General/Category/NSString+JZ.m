//
//  NSString+JZ.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/3.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "NSString+JZ.h"

@implementation NSString (JZ)

+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize text:(NSString *)text
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
