//
//  CCAccountTool.h
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WBAccount;
@interface WBAccountTool : NSObject
/** 存储帐号信息*/
+ (void)accountToolSaveAccount:(WBAccount *)account;
/** 获得帐号信息*/
+ (WBAccount *)account;
@end
