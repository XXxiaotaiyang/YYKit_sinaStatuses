//
//  CCTitleMenuViewController.m
//  SinaStatuses
//
//  Created by 闲人 on 15/12/20.
//  Copyright © 2015年 闲人. All rights reserved.
//

#import "WBTitleMenuViewController.h"
#import "WBCommon.h"
#import "UIView+Extension.h"

@implementation WBTitleMenuViewController


#pragma mark - **************** 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
    // Create label with section title
    UILabel *label = [[UILabel alloc] init] ;
    label.frame = CGRectMake(0, 0, tableView.width - 20, 15);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    label.text = sectionTitle;
    
    // Create header view and add label as a subview
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width - 20, 15)];
    [sectionView setBackgroundColor:[UIColor darkGrayColor]];
    [sectionView addSubview:label];
    return sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 设置没有分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    // 设置没有弹簧
    tableView.bounces = NO;
    static NSString *reuseIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = CCColor(96, 96, 96);
    cell.textLabel.textColor = [UIColor whiteColor];

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0 ) {
            cell.textLabel.text = @"首页";
            cell.textLabel.textColor = CCColor(241, 137, 35);
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"好友圈";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"群微博";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"我的微博";
        }
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0 ) {
            cell.textLabel.text = @"iOS";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"摄影";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"旅游";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"C++";
        }
    } else if (indexPath.section == 2) {
        // 其他没有的话就清空，不然服用会造成麻烦
        cell.textLabel.text = nil;
    }
 
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            return @"我的分组";
            break;
        
        default:
            return @"其他";
            break;
    }
}
@end
