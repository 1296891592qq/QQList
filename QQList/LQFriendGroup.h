//
//  LQFriendGroup.h
//  QQList
//
//  Created by wanly on 2016/6/6.
//  Copyright © 2017年 ebowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQFriendGroup : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)int online;

@property(nonatomic,strong)NSArray *friends;
//定义一个标识标记当前组是否已经展开，默认是没有展开
@property (nonatomic,assign) BOOL isExpand;

+ (instancetype) friendGroupWithDic: (NSDictionary *)dic;
- (instancetype) initWithDic: (NSDictionary *)dic;

+ (NSArray *)friendGroups;
@end
