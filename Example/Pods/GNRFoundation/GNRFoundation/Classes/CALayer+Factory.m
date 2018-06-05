//
//  CALayer+Factory.m
//  TKBaseModule
//
//  Created by Luca on 2018/3/29.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import "CALayer+Factory.h"

@implementation CALayer (Factory)

+ (CAGradientLayer *)layerGradientWithColors:(NSArray*)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    return gradientLayer;
}

@end
