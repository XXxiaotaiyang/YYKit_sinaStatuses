//
//  CCTabBar.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBTabBar.h"
#import "UIView+Extension.h"
@interface WBTabBar ()
@property (nonatomic, weak) UIButton *btn;
@end;

@implementation WBTabBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc] init];
        self.btn = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
        btn.size = btn.currentBackgroundImage.size;
        [self addSubview:btn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSUInteger tabBarCount = 5;
    NSInteger index = 0;
    CGFloat width = self.width / tabBarCount;
    self.btn.centerX = self.width * 0.5;
    self.btn.centerY = self.height * 0.5;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            view.x = width * index++;
            view.width = width;
            view.y = 0;
            view.height = self.height;
            if (index == 2) {
                index++;
            }
        }
    }

}
@end
