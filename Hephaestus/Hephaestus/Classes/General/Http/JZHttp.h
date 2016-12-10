//
//  JZHttp.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/10.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZHttp : NSObject
+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void(^)(id))success failure:(void(^)(NSError *))failure;
+(void)POST:(NSString *)URLString parameters:(id)parameters success:(void(^)(id))sucess failure:(void(^)(NSError *))failure;
+(void)Upload:(NSString *)URLString parameters:(id)parameters success:(void(^)(id))success failure:(void(^)(NSError *))failure;
@end
