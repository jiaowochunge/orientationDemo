//
//  BaseEntity.m
//  testProject
//
//  Created by 王益 on 15/3/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "BaseEntity.h"

@interface BaseEntity ()
{
    //翻译关键字
    NSDictionary *_translateDic;
}

@property (nonatomic, strong) NSDictionary *dummy;

@end

id processDic(id input);

id createEntityFromDictionary(NSDictionary *dic)
{
    return processDic(dic);
}

id processDic(id input)
{
    if ([input isKindOfClass:[NSDictionary class]]) {
        //检测是否存在复合数据结构，即字典和数组
        __block BOOL hasComplex = NO;
        NSDictionary *oriDic = input;
        [oriDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSArray class]]) {
                hasComplex = YES;
                *stop = YES;
            }
        }];
        //不存在复合数据结构，返回处理过的实体对象
        if (!hasComplex) {
            return [[BaseEntity alloc] initWithDictionary:input];
        }
        NSMutableDictionary *output = [input mutableCopy];
        NSArray *allkey = output.allKeys;
        for (int i = 0; i != allkey.count; ++i) {
            id key = allkey[i];
            id value = [output objectForKey:key];
            [output setObject:processDic(value) forKey:key];
        }
        return [[BaseEntity alloc] initWithDictionary:output];
    } else if ([input isKindOfClass:[NSArray class]]) {
        NSArray *oriArr = input;
        NSMutableArray *output = [NSMutableArray arrayWithCapacity:oriArr.count];
        for (int i = 0; i != oriArr.count; ++i) {
            [output addObject:processDic(oriArr[i])];
        }
        return output;
    } else {
        return input;
    }
}

@implementation BaseEntity

@synthesize translateDic = _translateDic;

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    NSParameterAssert(dic);
    NSAssert([dic isKindOfClass:[NSDictionary class]], @"param type error");
    self = [super init];
    if (self) {
        self.dummy = [dic mutableCopy];
    }
    return self;
}

//分析消息签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    SEL forwordSelector = aSelector;
    if ([self propertyNameFromGetterSelector:aSelector]) {
        forwordSelector = @selector(objectForKey:);
    } else if ([self propertyNameFromSetterSelector:aSelector]) {
        forwordSelector = @selector(setObject:forKey:);
    }
    return [[_dummy class] instanceMethodSignatureForSelector:forwordSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *propertyName = nil;
    // Try getter
    propertyName = [self propertyNameFromGetterSelector:anInvocation.selector];
    if (propertyName) {
        anInvocation.selector = @selector(objectForKey:);
        [anInvocation setArgument:&propertyName atIndex:2]; // self, _cmd, key
        [anInvocation invokeWithTarget:_dummy];
        return;
    }
    // Try setter
    propertyName = [self propertyNameFromSetterSelector:anInvocation.selector];
    if (propertyName) {
        anInvocation.selector = @selector(setObject:forKey:);
        [anInvocation setArgument:&propertyName atIndex:3]; // self, _cmd, obj, key
        [anInvocation invokeWithTarget:_dummy];
        return;
    }
    [super forwardInvocation:anInvocation];
}

- (NSString *)propertyNameFromGetterSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    NSUInteger parameterCount = [[selectorName componentsSeparatedByString:@":"] count] - 1;
    if (parameterCount == 0) {
        if ([_translateDic objectForKey:selectorName]) {
            return [_translateDic objectForKey:selectorName];
        }
        return selectorName;
    }
    return nil;
}

- (NSString *)propertyNameFromSetterSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    NSUInteger parameterCount = [[selectorName componentsSeparatedByString:@":"] count] - 1;
    if ([selectorName hasPrefix:@"set"] && parameterCount == 1) {
        NSUInteger firstColonLocation = [selectorName rangeOfString:@":"].location;
        selectorName = [selectorName substringWithRange:NSMakeRange(3, firstColonLocation - 3)].lowercaseString;
        if ([_translateDic objectForKey:selectorName]) {
            return [_translateDic objectForKey:selectorName];
        }
        return selectorName;
    }
    return nil;
}

@end
