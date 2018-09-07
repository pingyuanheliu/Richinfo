//
//  CXMaskView.m
//  Richinfo
//
//  Created by LL on 2018/9/7.
//  Copyright © 2018年 彩讯科技股份有限公司. All rights reserved.
//

#import "CXMaskView.h"

@interface CXMaskBackgroundView : UIView

@property (nonatomic, assign) CXMaskType maskType;
@property (nonatomic, assign) CGFloat radius;

@end

@implementation CXMaskBackgroundView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maskType = CXMaskCircle;
        _radius = 120.0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _maskType = CXMaskCircle;
        _radius = 120.0;
    }
    return self;
}

#pragma mark - Draw
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (_maskType == CXMaskCircle) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        UIBezierPath *tPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                             radius:_radius
                                                         startAngle:0
                                                           endAngle:2*M_PI
                                                          clockwise:NO];
        [path appendPath:tPath];
        //
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [path CGPath];
        shapeLayer.fillRule = kCAFillRuleEvenOdd;
        //
        self.layer.mask = shapeLayer;
    }else {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        CGFloat width = rect.size.width;
        CGFloat height = rect.size.height;
        CGFloat x = (width - 2*_radius)/2.0;
        CGFloat y = (height - 2*_radius)/2.0;
        CGRect rect = CGRectMake(x, y, 2*_radius, 2*_radius);
        UIBezierPath *tPath = [UIBezierPath bezierPathWithRect:rect];
        [path appendPath:tPath];
        //
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [path CGPath];
        shapeLayer.fillRule = kCAFillRuleEvenOdd;
        //
        self.layer.mask = shapeLayer;
    }
}

#pragma mark - Set

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    [self setNeedsDisplay];
}

- (void)setMaskType:(CXMaskType)maskType {
    _maskType = maskType;
    [self setNeedsDisplay];
}

@end


@interface CXMaskView ()

@property (nonatomic, weak) CXMaskBackgroundView *bgView;

@end

@implementation CXMaskView

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customView:self.bounds];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customView:self.bounds];
    }
    return self;
}

#pragma mark - Custom View

/**
 自定义视图

 @param rect 区域
 */
- (void)customView:(CGRect)rect {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.backgroundColor = [UIColor clearColor];
    //
    CXMaskBackgroundView *bgView = [[CXMaskBackgroundView alloc] initWithFrame:rect];
    bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    bgView.maskType = CXMaskCircle;
    [self addSubview:bgView];
    self.bgView = bgView;
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat side = width > height ? height : width;
    
    CGFloat x = (width - side)/2.0;
    CGFloat y = (height - side)/2.0;
    UIView *bodyV = [[UIView alloc] initWithFrame:CGRectMake(x, y, side, side)];
    bodyV.backgroundColor = [UIColor clearColor];
    [self addSubview:bodyV];
    _bodyV = bodyV;
}

#pragma mark - Get & Set

/**
 设置遮罩类型

 @param maskType 遮罩类型
 */
- (void)setMaskType:(CXMaskType)maskType {
    self.maskType = maskType;
    [self.bgView setMaskType:maskType];
}

/**
 设置遮罩半径

 @param radius 半径
 */
- (void)setMaskRadius:(CGFloat)radius {
    [self.bgView setRadius:radius];
}

@end
