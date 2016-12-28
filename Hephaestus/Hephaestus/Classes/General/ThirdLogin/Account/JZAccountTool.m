//
//  JZAccountTool.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZAccountTool.h"
#import "JZAccount.h"

@implementation JZAccountTool

+(void)saveAccount:(JZAccount *)account
{
    NSLog(@"%@",NSHomeDirectory());
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"];
    [NSKeyedArchiver archiveRootObject:account toFile:filePath];
    
}

+(JZAccount *)account
{
    JZAccount *account = [[JZAccount alloc]init];
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"];
    account = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return account;
}

@end
