//
//  UIImagePickerController+abc.m
//  testProject
//
//  Created by 王益 on 15/3/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "UIImagePickerController+abc.h"
#import <objc/runtime.h>

@implementation UIImagePickerController (abc)

+ (void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(supportedInterfaceOrientations);
        SEL swizzledSelector = @selector(supportedInterfaceOrientations_hook);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (NSUInteger)supportedInterfaceOrientations_hook
{
    NSUInteger orientation = [self supportedInterfaceOrientations_hook];
    return orientation;
}


@end
