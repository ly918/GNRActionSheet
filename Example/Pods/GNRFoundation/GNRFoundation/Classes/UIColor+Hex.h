//
//  UIColor+Hex.h
//  TKBaseModule
//
//  Created by GNR on 2018/3/2.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

//0 - 1
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

+ (UIColor *)randColor;//随机

// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithHex:(long)hexColor;

// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color;

+ (UIColor *)colorWithHexString: (NSString *)color alpha:(float)alpha;

@end
