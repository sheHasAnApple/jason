//
//  JZStatusResult.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZStatusResult.h"
#import "JZStatus.h"
@implementation JZStatusResult

//MJExtension方法，将数组转换对应模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[JZStatus class]};
}

@end
