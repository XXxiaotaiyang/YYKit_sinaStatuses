//
//  CCAccount.h
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccount : NSObject

/** 用于调用access_token，接口获取授权后的access token*/
@property (nonatomic, copy) NSString *access_token;
/** access_token的生命周期，单位是秒数。*/
@property (nonatomic, copy) NSString *expires_in;
/** 当前授权用户的UID。*/
@property (nonatomic, copy) NSString *uid;
/** 用户昵称*/
@property (nonatomic, copy) NSString *name;
@end
