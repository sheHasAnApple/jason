//
//  JZStatusTool.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZStatusTool : NSObject

+(void)getNewStatusWithSineceId:(NSString *)sinceId success:(void (^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

@end
