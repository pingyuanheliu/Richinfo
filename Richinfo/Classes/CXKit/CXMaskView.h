//
//  CXMaskView.h
//  Richinfo
//
//  Created by LL on 2018/9/7.
//  Copyright © 2018年 彩讯科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//遮罩类型
typedef NS_ENUM(NSInteger, CXMaskType) {
    CXMaskCircle = 0,         //圆形遮罩
    CXMaskSquare,             //方形遮罩
};

@interface CXMaskView : UIView

//遮罩类型
@property (nonatomic, assign) CXMaskType maskType;
//遮罩半径
@property (nonatomic, assign) CGFloat maskRadius;

//主体视图
@property (nonatomic, weak, readonly) UIView *bodyV;

@end
