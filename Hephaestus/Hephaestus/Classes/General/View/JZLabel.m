//
//  JZLabel.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/19.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZLabel.h"

@implementation JZLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = self.edgeInsets;
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
