//
//  ProgressView.m
//  testProject
//
//  Created by 王益 on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (id)init
{
    self = [super init];
    if (self) {
        self.trackColor = [UIColor lightGrayColor];
        self.progressColor = [UIColor blueColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat radius = rect.size.height * 0.5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    //绘制未充满颜色
    [_trackColor setFill];
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect)) ;
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius) ;
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius) ;
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius) ;
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius) ;
    CGContextClosePath(context) ;
    CGContextFillPath(context) ;
    
    //绘制进度颜色
    CGRect fillRect = rect;
    fillRect.size.width *= _progress;
    //至少是2倍radius
    if (fillRect.size.width >= 2 * radius) {
        [_progressColor setFill];
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, CGRectGetMinX(fillRect), CGRectGetMidY(fillRect)) ;
        CGContextAddArcToPoint(context, CGRectGetMinX(fillRect), CGRectGetMinY(fillRect), CGRectGetMidX(fillRect), CGRectGetMinY(fillRect), radius) ;
        CGContextAddArcToPoint(context, CGRectGetMaxX(fillRect), CGRectGetMinY(fillRect), CGRectGetMaxX(fillRect), CGRectGetMidY(fillRect), radius) ;
        CGContextAddArcToPoint(context, CGRectGetMaxX(fillRect), CGRectGetMaxY(fillRect), CGRectGetMidX(fillRect), CGRectGetMaxY(fillRect), radius) ;
        CGContextAddArcToPoint(context, CGRectGetMinX(fillRect), CGRectGetMaxY(fillRect), CGRectGetMinX(fillRect), CGRectGetMidY(fillRect), radius) ;
        CGContextClosePath(context) ;
        CGContextFillPath(context) ;
    }
    
    CGContextRestoreGState(context);
}

@end
