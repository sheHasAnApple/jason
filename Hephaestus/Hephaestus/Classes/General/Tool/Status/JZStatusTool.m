//
//  JZStatusTool.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZStatusTool.h"
#import "JZStatusParam.h"
#import "JZAccountTool.h"
#import "JZAccount.h"
#import "JZHttpTool.h"
#import "MJExtension.h"
#import "JZStatusResult.h"

@implementation JZStatusTool

+(void)getNewStatusWithSineceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void(^)(NSError *))failure
{
    JZStatusParam *param = [[JZStatusParam alloc]init];
    param.access_token = [JZAccountTool account].access_token;
    if (sinceId) {
        param.since_id = sinceId;
    }

    [JZHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.mj_keyValues success:^(id responseObject) {
        
        JZStatusResult *result = [JZStatusResult mj_objectWithKeyValues:responseObject];
        
        NSLog(@"result%@",result);
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
