//
//  UIBarButtonItem+Extension.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的监听方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     item的普通图片
 *  @param highImage item的高亮图片
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.size = btn.currentImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
