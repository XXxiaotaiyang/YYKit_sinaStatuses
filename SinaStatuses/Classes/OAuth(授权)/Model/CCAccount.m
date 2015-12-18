//
//  CCAccount.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "CCAccount.h"
@interface CCAccount ()<NSCoding>

@end

@implementation CCAccount

- (void)encodeWithCoder:(NSCoder *)encode {
    [encode encodeObject:self.access_token forKey:@"access_token"];
    [encode encodeObject:self.expires_in  forKey:@"expires_in"];
    [encode encodeObject:self.uid forKey:@"uid"];
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.expires_in = [decoder decodeObjectForKey:@"expires_in"];
        self.uid = [decoder decodeObjectForKey:@"uid"];
    }
    return self;
}
@end
