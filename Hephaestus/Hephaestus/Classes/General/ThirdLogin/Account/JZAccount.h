//
//  JZAccount.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZAccount : NSObject<NSCoding>

@property (nonatomic,copy) NSString *access_token;

@property (nonatomic,copy) NSString *third_id;

@property (nonatomic,copy) NSString *third_image;

@property (nonatomic,copy) NSString *third_name;

+(instancetype)accountWithDict:(NSDictionary *)dict;

@end
