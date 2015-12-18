//
//  CCHomeViewController.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "CCHomeVC.h"
#import "YYImage.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"

@implementation CCHomeVC

#pragma mark - **************** 主逻辑
- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加 navigationbarItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarButtonItemDidClick) image:@"navigationbar_friendattention" highImage:@"navigationbar_friendattention_dot_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarButtonItemDidClick) image:@"navigationbar_icon_radar" highImage:@"navigationbar_icon_radar_highlighted"];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.size = CGSizeMake(200, 44);
    searchBar.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = searchBar;
}


#pragma mark - **************** 监听方法
- (void)leftBarButtonItemDidClick {
//    NSLog(@"homeViewNavigationBarDidClick");
}

- (void)rightBarButtonItemDidClick {
//    NSLog(@"rightBarButtonItemDidClick");
}



@end
