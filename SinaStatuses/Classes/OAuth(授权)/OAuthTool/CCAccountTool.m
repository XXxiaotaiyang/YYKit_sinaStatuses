//
//  CCAccountTool.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "CCAccountTool.h"
#import "CCAccount.h"

#define AccountPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@interface CCAccountTool ()

@end

@implementation CCAccountTool

+ (void)accountToolSaveAccount:(CCAccount *)account {
  
//    NSLog(@"path %@", AccountPath);
    [NSKeyedArchiver archiveRootObject:account toFile:AccountPath];
}

+ (CCAccount *)account {
    CCAccount *account =  [NSKeyedUnarchiver unarchiveObjectWithFile:AccountPath];
    return account;
}



@end
