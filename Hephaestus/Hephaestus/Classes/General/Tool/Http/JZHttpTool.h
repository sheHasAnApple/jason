//
//  JZHttp.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/10.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZHttpTool : NSObject
+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
+(void)POST:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))sucess failure:(void(^)(NSError *error))failure;
+(void)Upload:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
@end
