//
//  CXProgressView.h
//  Richinfo
//
//  Created by LL on 2018/9/7.
//  Copyright © 2018年 彩讯科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CXProgressView : UIView

//进度值（0.0～1.0）
@property (nonatomic, assign) CGFloat progress;
//描边宽度
@property (nonatomic, assign) CGFloat strokeWidth;
//描边颜色
@property (nonatomic, strong) UIColor *strokeColor;
//进度颜色
@property (nonatomic, strong) UIColor *progressColor;

@end
