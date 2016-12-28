//
//  JZAccount.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/25.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZAccount.h"

@implementation JZAccount

+(instancetype)accountWithDict:(NSDictionary *)dict
{
    JZAccount *account = [[self alloc]init];
    
    [account setValuesForKeysWithDictionary:dict];
    
    return account;
}
//解档时调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:@"JZAccessTokenKey"];
        _third_name = [aDecoder decodeObjectForKey:@"JZThirdNameKey"];
        _third_id = [aDecoder decodeObjectForKey:@"JZThirdIdKey"];
        _third_image = [aDecoder decodeObjectForKey:@"JZThirdImageKey"];
    }
    return self;
}
//归档时调用
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:@"JZAccessTokenKey"];
    [aCoder encodeObject:_third_id forKey:@"JZThirdIdKey"];
    [aCoder encodeObject:_third_name forKey:@"JZThirdNameKey"];
    [aCoder encodeObject:_third_image forKey:@"JZThirdImageKey"];
}


@end
