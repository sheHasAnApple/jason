//
//  JZStatus.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZStatus.h"
#import "JZPhoto.h"
@implementation JZStatus
//MJExtension方法，将数组转换对应模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[JZPhoto class]};
}

- (void)setRetweeted_status:(JZStatus *)retweeted_status
{
    _retweeted_status = retweeted_status;
    
    _retweetName = [NSString stringWithFormat:@"@%@",retweeted_status.user.name];
}


@end
