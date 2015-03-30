//
//  AppDelegate.h
//  testProject
//
//  Created by 王益 on 15/3/17.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 项目说明。本项目说明如何限制某页面横屏。
 1、项目本身要支持横屏，就是项目的配置文件，默认支持的方向为左右横屏加竖屏。这个地方不支持横屏的话，应用是不支持横屏的。
 2、根据苹果文档说明， https://developer.apple.com/library/prerelease/ios/featuredarticles/ViewControllerPGforiPhoneOS/RespondingtoDeviceOrientationChanges/RespondingtoDeviceOrientationChanges.html
    页面的方向由应用支持的方向和当前页面支持的方向共同决定，也就是两者同时支持某方向时，该方向是有效方向。rootViewController为导航栏视图和标签栏视图这类视图控制器容器时，容器方向参与决定子视图方向
 3、本项目演示如下。以tabBarController为根视图控制器，重写 supportedInterfaceOrientations 方法，决定所有子视图页面只支持竖屏。presentViewController不受navigationController或tabBarController影响，present出来的webViewController支持的方向为左右横屏。
 4、这个演示项目，根视图控制器为tabBarController，该容器只支持竖屏，故其他的子视图虽然重写支持方向，能支持各个方向，依然无效。但presentViewController的视图支持方向逻辑与rootViewController是不同的，所以重写视图支持方向是有效的。项目也正是这么演示的。具体可以查看上面给出的苹果文档。
 */

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

