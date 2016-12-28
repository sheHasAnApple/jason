//
//  JZAccountTool.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JZAccount;

@interface JZAccountTool : NSObject

+(void)saveAccount:(JZAccount *)account;
+(JZAccount *)account;
@end
