//
//  CCHomeViewController.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/14.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBHomeVC.h"
#import "YYImage.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
#import "AFNetworking.h"
#import "WBAccountTool.h"
#import "WBAccount.h"
#import "WBButton.h"
#import "WBDrowdownMenu.h"
#import "WBTitleMenuViewController.h"
#import "YYTableView.h"
#import "YYFPSLabel.h"
#import "WBModel.h"
#import "WBStatusLayout.h"
#import "WBStatusCell.h"

@interface WBHomeVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak) UIButton *titleBtn;
@property (nonatomic, strong) NSMutableArray *layouts;

@property (nonatomic, strong) UITableView *tableView;
// 美妙帧数
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation WBHomeVC

#pragma mark - **************** 主逻辑

- (instancetype)init {
    if (self = [super init]) {
        _tableView = [YYTableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _layouts = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setTableView];
    [self setUserInfo];
    [self loadNewStatus];
    
}

- (void)setNav {
    // 添加 navigationbarItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarButtonItemDidClick) image:@"navigationbar_friendattention" highImage:@"navigationbar_friendattention_dot_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarButtonItemDidClick) image:@"navigationbar_icon_radar" highImage:@"navigationbar_icon_radar_highlighted"];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.size = CGSizeMake(200, 44);
    searchBar.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = searchBar;
}

- (void)setTableView {
    _tableView.frame = self.view.bounds;
    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    // 滚动条在视图中位置
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    // 设置cell的背景的灰色的
    self.view.backgroundColor = kWBCellBackgroundColor;
    
    // 设置fpsLabel
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = self.view.height - kWBCellPadding;
    _fpsLabel.left = kWBCellPadding;
    // 大神设置的是0，滑动时候才显示，暂时这么弄。
    _fpsLabel.alpha = 1;
    [self.view addSubview:_fpsLabel];

}

- (void)setUserInfo {
    // CCButton 封装好，实现自动居中，图片在右边，离文字5的距离。然后设置checkbox样式监听。
    WBAccount *account =  [WBAccountTool account];
    NSString *titleName = account.name;
    WBButton  *titleBtn = [[WBButton alloc] init];
    titleBtn.size = CGSizeMake(150, 30);
    self.titleBtn = titleBtn;
    [titleBtn addTarget:self action:@selector(titleBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [titleBtn setImage:[UIImage imageNamed:@"timeline_icon_more_highlighted"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"timeline_icon_up_more_highlighted"] forState:UIControlStateSelected];
    [titleBtn setSelected:NO];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn setTitle:titleName forState:UIControlStateNormal];
    self.navigationItem.titleView = titleBtn;
}

- (void)loadNewStatus {
    
    // 添加一个loading指示
    //    self.navigationController.view.userInteractionEnabled = NO;
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]
                                          initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.size = CGSizeMake(60, 60);
    indicator.center = CGPointMake(self.view.width / 2, self.view.height /2 - 32);
    indicator.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.67];
    indicator.clipsToBounds = YES;
    indicator.layer.cornerRadius = 5;
    [indicator startAnimating];
    [self.view addSubview:indicator];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    WBAccount *account = [WBAccountTool account];
    parameters[@"access_token"] = account.access_token;
    NSLog(@"%@", account.access_token);
    parameters[@"count"] = @20;
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        WBTimelineItem *item = [WBTimelineItem modelWithJSON:responseObject];
        for (WBStatus *status in item.statuses) {
            WBStatusLayout *layout = [[WBStatusLayout alloc] initWithStatus:status style:WBLayoutStyleTimeline];
            [layout layout];
            [_layouts addObject:layout];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [indicator removeFromSuperview];
            self.navigationController.view.userInteractionEnabled = YES;
            [_tableView reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark - **************** 监听方法
- (void)titleBtnDidClick:(WBButton *) titleBtn {
    titleBtn.selected = !titleBtn.selected;
    // 弹出popView
    WBDrowdownMenu *menu = [WBDrowdownMenu menu];
//    UITableViewController *menuVC = [[UITableViewController alloc] init];
    
    WBTitleMenuViewController *menuVC = [[WBTitleMenuViewController alloc] init];
    menuVC.view.width = 200;
    menuVC.view.height = 300;
    menu.dismissDrowdownMentu = ^(BOOL isRemoved){
        titleBtn.selected = !isRemoved;
    };
    menu.contentVC = menuVC;
    [menu showFrom:self.titleBtn];
    
}

- (void)leftBarButtonItemDidClick {
//    NSLog(@"homeViewNavigationBarDidClick");
}

- (void)rightBarButtonItemDidClick {
//    NSLog(@"rightBarButtonItemDidClick");
}

#pragma mark - **************** tableView 的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"begin%s", __func__);
    NSString *cellID = @"cell";
    WBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[WBStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        //        cell.delegate = self;
    }
    [cell setLayout:_layouts[indexPath.row]];
    //    NSLog(@"end%s", __func__);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((WBStatusLayout *)_layouts[indexPath.row]).height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}




@end
