//
//  CCCmmon.h
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#define CCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CCRandomColor CCColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import <Foundation/Foundation.h>
@interface CCCommon : NSObject

@end
