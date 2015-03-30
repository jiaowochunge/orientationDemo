//
//  BaseEntity.h
//  testProject
//
//  Created by 王益 on 15/3/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseEntity <NSObject>

@property (nonatomic, strong) NSDictionary *translateDic;

@end

id createEntityFromDictionary(NSDictionary *dic);

@interface BaseEntity : NSObject<BaseEntity>

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
