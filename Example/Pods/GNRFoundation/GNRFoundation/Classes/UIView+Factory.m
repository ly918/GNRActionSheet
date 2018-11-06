//
//  UIView+Factory.m
//  TKBaseModule
//
//  Created by Luca on 2018/4/18.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import "UIView+Factory.h"

@implementation UIView (Factory)
+ (MKMapView *)mapViewMK{
    MKMapView *mapView = [[MKMapView alloc]init];
    mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(31.22269324,121.43785449), MKCoordinateSpanMake(.01, .01));
    return mapView;
}

+ (UIButton *)buttonWithTitle:(NSString *)title
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)action{
    UIButton *btn = [UIView buttonWithButtonType:UIButtonTypeCustom
                                           title:title
                                           image:image
                                          target:target
                                          action:action];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)buttonWithButtonType:(UIButtonType)buttonType
                             title:(NSString *)title
                             image:(UIImage *)image
                            target:(id)target
                            action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:buttonType];
    if(title)[btn setTitle:title forState:UIControlStateNormal];
    if(image)[btn setImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UILabel *)labelWithTitle:(NSString *)title
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc]init];
    label.font = font?:[UIFont systemFontOfSize:17];
    label.textColor = textColor?:[UIColor blackColor];
    label.text = title?:@"";
    label.textAlignment = textAlignment;
    return label;
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    return imageView;
}

/**
 设置阴影path:直角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 */
- (void)addShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius{
    [self addShadowOffset:offset opacity:opacity radius:radius cornerRadius:0];
}

/**
 设置阴影path:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 @param cornerRadius 圆角
 */
- (void)addShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    self.layer.shadowPath = shadowPath.CGPath;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

/**
 设置layer阴影:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 */
- (void)setShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius{
    [self setShadowOffset:offset opacity:opacity radius:radius cornerRadius:0];
}

/**
 设置layer阴影:圆角
 
 @param offset 阴影偏移量
 @param opacity 阴影透明度
 @param radius 阴影扩散范围
 @param cornerRadius 圆角
 */
- (void)setShadowOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius cornerRadius:(CGFloat)cornerRadius{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.cornerRadius = cornerRadius;
}

#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                    radii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                    radii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}
@end
