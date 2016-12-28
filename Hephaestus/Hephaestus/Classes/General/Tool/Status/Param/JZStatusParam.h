//
//  JZStatusParam.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZStatusParam : NSObject

@property (nonatomic,copy) NSString *access_token;

@property (nonatomic,copy) NSString *since_id;

@property (nonatomic,copy) NSString *max_id;

@end
