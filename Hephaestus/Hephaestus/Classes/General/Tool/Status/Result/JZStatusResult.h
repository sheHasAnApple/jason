//
//  JZStatusResult.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/26.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface JZStatusResult : NSObject<MJKeyValue>

@property (nonatomic ,strong) NSArray *statuses;

@property (nonatomic ,assign) int *total_number;

@end
