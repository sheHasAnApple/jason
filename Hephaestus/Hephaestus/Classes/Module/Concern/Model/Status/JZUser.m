//
//  JZUser.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZUser.h"

@implementation JZUser

- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}

@end
