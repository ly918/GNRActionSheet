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

//设置圆角
- (void)showCornerRadius:(CGFloat)cornerRadius;

//请提前设置bounds
- (void)addShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;


@end
