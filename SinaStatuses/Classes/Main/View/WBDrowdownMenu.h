//
//  CCDrowdownMenu.h
//  SinaStatuses
//
//  Created by 闲人 on 15/12/20.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBDrowdownMenu;
@interface WBDrowdownMenu : UIView
/** 下拉菜单消失*/
@property (nonatomic, copy) void (^dismissDrowdownMentu)(BOOL isRemoved);
/** 内容控制器*/
@property (nonatomic, strong) UIViewController *contentVC;
/** 内容*/
@property (nonatomic, strong) UIView *content;
+ (instancetype)menu;
/**
 *  显示
 */
- (void)showFrom:(UIView *)from;
@end
