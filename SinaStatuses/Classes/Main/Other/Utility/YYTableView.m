//
//  YYTableView.m
//  YYKitExample
//
//  Created by ibireme on 15/9/7.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "YYTableView.h"

@implementation YYTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
//    上面的工作原理其实有一个属性开关来控制：delaysContentTouches。默认值为YES；\
    如果设置为NO，则无论手指移动的多么快，始终都会将触摸事件传递给内部控件；设置为NO可能会影响到UIScrollView的滚动功能
    self.delaysContentTouches = NO;
//    如果为YES，就会等待用户下一步动作，如果用户移动手指到一定距离，就会把这个操作作为滚动来处理并开始滚动，同时发送一个touchesCancelled:withEvent:消息给内容控件，由控件自行处理。如果为NO，就不会等待用户下一步动作，并始终不会触发scrollView的滚动了
    self.canCancelContentTouches = YES;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Remove touch delay (since iOS 8)
    UIView *wrapView = self.subviews.firstObject;
    // UITableViewWrapperView
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            // UIScrollViewDelayedTouchesBeganGestureRecognizer
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ( [view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

@end
