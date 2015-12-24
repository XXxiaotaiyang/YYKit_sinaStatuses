//
//  CCTabBarController.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBHomeVC.h"
#import "WBMessageVC.h"
#import "WBSearchVC.h"
#import "WBProfileVC.h"
#import "WBCommon.h"
#import "WBTabBar.h"
#import "WBAccount.h"
#import "WBAccountTool.h"

@interface WBTabBarController ()

@end

@implementation WBTabBarController

+ (void)initialize {
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WBHomeVC *homeVC = [[WBHomeVC alloc] init];
    WBMessageVC *messageVC = [[WBMessageVC alloc] init];
    WBSearchVC *searchVC = [[WBSearchVC alloc] init];
    WBProfileVC *profileVC = [[WBProfileVC alloc] init];
    
    [self addChildVC:homeVC title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    [self addChildVC:messageVC title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addChildVC:searchVC title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addChildVC:profileVC title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    WBTabBar *tabBar = [[WBTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    
}

- (void)addChildVC:(UIViewController *)childVC
                         title:(NSString *)title
                         image:(NSString *)image
                 selectedImage:(NSString *)selectedImage {
    childVC.title = title;
//    childVC.tabBarItem
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    dictM[NSForegroundColorAttributeName] = CCColor(123, 123, 123);
//    [childVC.tabBarItem setTitleTextAttributes:dictM forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navChildVC = [[UINavigationController alloc] initWithRootViewController:childVC];
//    navChildVC.view.backgroundColor = CCRandomColor;
    [self addChildViewController:navChildVC];
    
}


@end
