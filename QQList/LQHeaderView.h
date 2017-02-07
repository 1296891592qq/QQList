//
//  LQHeaderView.h
//  QQList
//
//  Created by wanly on 2016/6/6.
//  Copyright © 2017年 ebowin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQHeaderView;
@class LQFriendGroup;
@protocol LQHeaderViewDelegate <NSObject>

@optional
- (void) headerViewButtonDidClick:(LQHeaderView *)headerView;

@end

@interface LQHeaderView : UITableViewHeaderFooterView

+ (instancetype) headerVeiw: (UITableView *)tableView;

@property(nonatomic,strong) LQFriendGroup *friendGoups;

@property(nonatomic,strong) id<LQHeaderViewDelegate> delegate;
@end
