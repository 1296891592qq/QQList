//
//  LQFriendGroup.m
//  QQList
//
//  Created by wanly on 2016/6/6.
//  Copyright © 2017年 ebowin. All rights reserved.
//

#import "LQFriendGroup.h"
#import "LQFriend.h"
@implementation LQFriendGroup
+ (instancetype) friendGroupWithDic: (NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype) initWithDic: (NSDictionary *)dic
{
    if (self = [super init])
    {
        self.friends = [LQFriend friends:dic[@"friends"]];
        self.name = dic[@"name"];
        self.online = [dic[@"online"] intValue];
    }
    return self;
}

+ (NSArray *)friendGroups
{
    NSArray *sourceArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    
    NSMutableArray *desArr = [NSMutableArray array];
    
    for (NSDictionary *dic in sourceArr)
    {
        LQFriendGroup *group = [LQFriendGroup friendGroupWithDic:dic];
        
        [desArr addObject:group];
    }
    return  desArr;
}
@end
