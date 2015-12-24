//
//  CCAccountTool.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccount.h"

#define AccountPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@interface WBAccountTool ()

@end

@implementation WBAccountTool

+ (void)accountToolSaveAccount:(WBAccount *)account {
  
//    NSLog(@"path %@", AccountPath);
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
}

+ (WBAccount *)account {
    WBAccount *account =  [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    return account;
}



@end
