//
//  WTThirdPartyLoginManager.h
//  WTThird_Party_Login
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 wutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"

/*****微信QQ
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>
****/
typedef NS_ENUM(NSInteger, WTLoginType) {
    WTLoginTypeWeiBo = 0,   // 新浪微博
    WTLoginTypeTencent,      // QQ
    WTLoginTypeWeiXin       // 微信
};

typedef NS_ENUM(NSInteger, WTLoginWeiXinErrCode) {
    WTLoginWeiXinErrCodeSuccess = 0,
    WTLoginWeiXinErrCodeCancel = -2, 
    
};

typedef void(^WTThirdPartyLoginResultBlock)(NSDictionary * LoginResult, NSString * error);


/***微信QQSDK的代理
****TencentSessionDelegate, TencentLoginDelegate,WXApiDelegate
****/
@interface WTThirdPartyLoginManager : NSObject<WBHttpRequestDelegate,WeiboSDKDelegate>

+ (instancetype)shareWTThirdPartyLoginManager;

+ (void)getUserInfoWithWTLoginType:(WTLoginType)type result:(WTThirdPartyLoginResultBlock)result;

@end
