//
//  LQViewController.m
//  QQList
//
//  Created by wanly on 2016/6/6.
//  Copyright © 2017年 ebowin. All rights reserved.
//

#import "LQViewController.h"
#import "LQFriend.h"
#import "LQFriendGroup.h"
#import "LQHeaderView.h"
@interface LQViewController ()<LQHeaderViewDelegate>

@property (nonatomic,strong) NSArray *friendGroups;
@end

@implementation LQViewController

- (NSArray *)friendGroups
{
    if (_friendGroups == nil)
    {
        _friendGroups = [LQFriendGroup friendGroups];
    }
    return _friendGroups;
}

- (BOOL)prefersStatusBarHidden
{
    return  YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
    self.tableView.sectionHeaderHeight = 44;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.friendGroups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LQFriendGroup *group = self.friendGroups[section];
    
    return group.isExpand ? group.friends.count : 0 ;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQFriendGroup *group = self.friendGroups[indexPath.section];
    
    LQFriend *friend = group.friends[indexPath.row];
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    else
    {
        NSLog(@"cell重用了");
    }
    cell.imageView.image=[UIImage imageNamed:friend.icon];
    cell.textLabel.text=friend.name;
    cell.detailTextLabel.text=friend.intro;
    
    return  cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LQHeaderView *headerView = [LQHeaderView headerVeiw:tableView];
    headerView.delegate = self;
    LQFriendGroup *group = self.friendGroups[section];
    headerView.friendGoups = group;
    headerView.tag = section;
    return headerView;
}

//实现headerVeiw的代理
-(void)headerViewButtonDidClick:(LQHeaderView *)headerView
{
    //只刷新当前组
    NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:[self.friendGroups indexOfObject:headerView.friendGoups]];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
