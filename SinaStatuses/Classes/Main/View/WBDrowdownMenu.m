//
//  CCDrowdownMenu.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/20.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBDrowdownMenu.h"
#import "UIView+Extension.h"


@interface WBDrowdownMenu ()

@property (nonatomic, assign) CGRect formRect;
@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation WBDrowdownMenu
#pragma mark - **************** 懒加载
- (UIImageView *)containerView
{
    if (!_containerView) {
        // 添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled = YES; // 开启交互
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

#pragma mark - **************** main
+ (instancetype)menu {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)showFrom:(UIView *)from {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    self.frame = window.bounds;
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    
    self.containerView.y = CGRectGetMaxY(newFrame);
}

#pragma mark - **************** setter方法
- (void)setContentVC:(UIViewController *)contentVC {
    _contentVC = contentVC;
    self.content = contentVC.view;
}

- (void)setContent:(UIView *)content {
    _content = content;
    
    // 调整内容的位置
    content.x = 10;
    content.y = 15;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    // 设置灰色的宽度
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:content];
}


#pragma mark - **************** 监听方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
    
    self.dismissDrowdownMentu(YES);
}


@end
