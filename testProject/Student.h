//
//  Student.h
//  testProject
//
//  Created by 王益 on 15/3/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"

@protocol Student <BaseEntity>

@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

@end

@protocol TestOppo <BaseEntity>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) id<Student> std;

@property (nonatomic, strong) NSArray *stdArr;

@end
