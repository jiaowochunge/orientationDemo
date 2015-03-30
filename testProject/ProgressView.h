//
//  ProgressView.h
//  testProject
//
//  Created by 王益 on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ProgressView : UIControl

//fill color
@property (nonatomic, strong) IBInspectable UIColor* progressColor;
//unfill color
@property (nonatomic, strong) IBInspectable UIColor* trackColor;
//0.0 to 1.0
@property (nonatomic, assign) IBInspectable CGFloat progress;

@end
