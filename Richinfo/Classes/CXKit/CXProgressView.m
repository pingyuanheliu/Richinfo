//
//  CXProgressView.m
//  Richinfo
//
//  Created by LL on 2018/9/7.
//  Copyright © 2018年 彩讯科技股份有限公司. All rights reserved.
//

#import "CXProgressView.h"

@interface CXProgressView ()

@property (nonatomic, weak) CAShapeLayer *percentLayer;

@end

@implementation CXProgressView

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

#pragma mark - Custom Init

- (void)customInit {
    _strokeWidth = 4.0;
    _strokeColor = [UIColor colorWithRed:182.0/255.0 green:228.0/255.0 blue:252.0/255.0 alpha:1.0];
    _progressColor = [UIColor colorWithRed:245.0/255.0 green:199.0/255.0 blue:88.0/255.0 alpha:1.0];
    self.backgroundColor = [UIColor colorWithRed:62.0/255.0 green:114.0/255.0 blue:168.0/255.0 alpha:1.0];
}

#pragma mark - Draw

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat width = 4.0;
    CGFloat lineWidth = rect.size.height - 2*width - 1.0;
    if (lineWidth <= 0) {
        lineWidth = 1.0;
    }
    //
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = rect.size.height/2.0;
    self.layer.borderWidth = _strokeWidth;
    self.layer.borderColor = [_strokeColor CGColor];
    //
    CGFloat beginX = width + lineWidth/2.0 + 0.5;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(beginX, rect.size.height/2.0)];
    [path addLineToPoint:CGPointMake(rect.size.width - 2*beginX, rect.size.height/2.0)];
    //
    CAShapeLayer *percentLayer = [CAShapeLayer layer];
    percentLayer.fillColor = [[UIColor clearColor] CGColor];
    percentLayer.strokeColor = [_progressColor CGColor];
    percentLayer.lineCap = kCALineCapRound;
    percentLayer.lineWidth = lineWidth;
    percentLayer.path = [path CGPath];
    percentLayer.strokeStart = 0.0;
    percentLayer.strokeEnd = _progress;
    [self.layer addSublayer:percentLayer];
    self.percentLayer = percentLayer;
}

#pragma mark Get & Set

/**
 设置进度值

 @param progress 进度值
 */
- (void)setProgress:(CGFloat)progress {
    if (progress < 0.0) {
        progress = 0.0;
    }
    if (progress > 1.0) {
        progress = 1.0;
    }
    CFTimeInterval duration = fabs(_progress-progress)*1.0;
    _progress = progress;
    //
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:duration];
    _percentLayer.strokeEnd = _progress;
    [CATransaction commit];
}

/**
 设置描边宽带

 @param strokeWidth 描边宽度
 */
- (void)setStrokeWidth:(CGFloat)strokeWidth {
    _strokeWidth = strokeWidth;
    [self setNeedsDisplay];
}

/**
 设置描边颜色

 @param strokeColor 描边颜色
 */
- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}


/**
 设置进度条颜色

 @param progressColor 进度条颜色
 */
- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    [self setNeedsDisplay];
}

@end
