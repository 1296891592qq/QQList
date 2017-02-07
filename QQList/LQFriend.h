//
//  LQFriend.h
//  QQList
//
//  Created by wanly on 2016/6/6.
//  Copyright © 2017年 ebowin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQFriend : NSObject
//头像
@property (nonatomic,copy) NSString *icon;

//昵称
@property (nonatomic,copy) NSString *name;

//说说
@property (nonatomic,copy) NSString *intro;

//Vip
@property (nonatomic,assign,getter=isVip) BOOL vip;

+ (instancetype) friendWithDic: (NSDictionary *)dic;
- (instancetype) initWithDic: (NSDictionary *)dic;

+ (NSArray *) friends: (NSArray *)sourceArr;
@end
