//
//  CCButton.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/18.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBButton.h"

@interface WBButton ()
@property(nonatomic, strong) UIFont *myFont;
@property(nonatomic, assign) CGRect titleR;
@property(nonatomic, assign) CGFloat titleMaxX;

@end

@implementation WBButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.myFont = [UIFont boldSystemFontOfSize:17];
    self.titleLabel.font = self.myFont;
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    NSString *currentTitle = self.currentTitle;
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = self.myFont;
    CGRect  titleR = [currentTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGFloat titleW = titleR.size.width;
    // 设置居中
    CGFloat titleX = 0.5 * (contentRect.size.width - titleR.size.width);
    CGFloat titleMaxX = titleX + titleR.size.width;
    self.titleMaxX = titleMaxX;
    self.titleR = titleR;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageY = 0;
    CGFloat imageW = 16;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX =  self.titleMaxX + 5;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
