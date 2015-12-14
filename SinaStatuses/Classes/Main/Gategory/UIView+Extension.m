//
//  UIView+Extension.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame  = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centenX {
    CGPoint centenr = self.center;
    centenr.x = centenX;
    self.center = centenr;
}

- (void)setX:(CGFloat)x {
    CGRect fram= self.frame;
    fram.origin.x = x;
    self.frame = fram;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centenY {
    CGPoint centenr = self.center;
    centenr.y = centenY;
    self.center = centenr;
}

- (CGFloat)centerY {
    return self.center.y;
}


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect fram= self.frame;
    fram.origin.y = y;
    self.frame = fram;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

@end
