//
//  CALayer+Factory.h
//  TKBaseModule
//
//  Created by Luca on 2018/3/29.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Factory)
//渐变
+ (CAGradientLayer*)layerGradientWithColors:(NSArray*)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
