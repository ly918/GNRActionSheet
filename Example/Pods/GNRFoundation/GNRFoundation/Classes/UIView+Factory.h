//
//  UIView+Factory.h
//  TKBaseModule
//
//  Created by Luca on 2018/4/18.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface UIView (Factory)

#pragma mark - 控件 -
+ (MKMapView *)mapViewMK;

+ (UIButton *)buttonWithTitle:(NSString *)title
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)action;

+ (UIButton *)buttonWithButtonType:(UIButtonType)buttonType
                             title:(NSString *)title
                             image:(UIImage *)image
                            target:(id)target
                            action:(SEL)action;

+ (UILabel *)labelWithTitle:(NSString *)title
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment;

+ (UIImageView *)imageViewWithImage:(UIImage *)image;

#pragma mark - 阴影 -
/**
 设置layer阴影:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 */
- (void)setShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

/**
 设置layer阴影:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 @param cornerRadius 圆角
 */
- (void)setShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius;

/**
 设置阴影:直角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 */
- (void)addShadowOffset:(CGSize)offset
                opacity:(CGFloat)opacity
                 radius:(CGFloat)radius;

/**
 设置阴影:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 @param cornerRadius 圆角
 */
- (void)addShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius;

#pragma mark - 设置部分圆角 -
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                    radii:(CGSize)radii;

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                    radii:(CGSize)radii
                 viewRect:(CGRect)rect;
@end
