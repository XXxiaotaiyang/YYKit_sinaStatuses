//
//  CCOAuthViewController.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/16.
//  Copyright © 2015年 闲人. All rights reserved.
//
//    App Key：3113926977
//    App Secret：09c7301ac169533b1f2440a018e6ce93

#import "CCOAuthViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "CCAccount.h"
#import "CCAccountTool.h"

@interface CCOAuthViewController ()<UIWebViewDelegate>

@end

@implementation CCOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    // 请求地址：https://api.weibo.com/oauth2/authorize
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3113926977&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - **************** webView的代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length != 0) {
        NSUInteger index = range.location + range.length;
        NSString *code = [urlStr substringFromIndex:index];
        NSRange otherRange = [code  rangeOfString:@"&"];
        // 截取出来的有两个\
        17f8113494412fd9bd6ec9d3f43ea651 \
        17f8113494412fd9bd6ec9d3f43ea651&from=844b&vit=fps  所以判断一下
        if (otherRange.length == 0) {
            // 利用获得的code来获取accessToken
            [self accessTokenWithCode:code];
        }
    }
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"client_id"] = @"3113926977";
    parameters[@"client_secret"] = @"09c7301ac169533b1f2440a018e6ce93";
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = @"http://www.baidu.com";
    
    [session POST:@"https://api.weibo.com/oauth2/access_token" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        CCAccount *account = [CCAccount mj_objectWithKeyValues:responseObject];
        [CCAccountTool accountToolSaveAccount:account];
        
        CCAccount  *acc = [CCAccountTool account];
        
//        NSLog(@"%@", acc.access_token);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
    }];
    
    
}
@end
