//
//  UIImage+Fix.h
//  TKBaseModule
//
//  Created by GNR on 2018/2/27.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/** 创建背景图片 */
+ (UIImage*)imageWithColor:(UIColor*)color;

/** 根据颜色生成纯色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/** 取图片某一像素的颜色 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/** 获得灰度图 */
- (UIImage *)convertToGrayImage;

@end

@interface UIImage (Fix)

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/**压缩图片*/
+(NSData *)compressImage:(UIImage *)myimage;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)flipVertical;

/** 水平翻转 */
- (UIImage *)flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/** 旋转 */
+ (UIImage *)image:(UIImage *)image
          rotation:(UIImageOrientation)orientation;

@end

@interface UIImage (SubImage)

/** 截取当前image对象rect区域内的图像 */
- (UIImage *)subImageWithRect:(CGRect)rect;

/** 压缩图片至指定尺寸 */
- (UIImage *)rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)rescaleImageToPX:(CGFloat )toPX;

/** 在指定的size里面生成一个平铺的图片 */
- (UIImage *)getTiledImageWithSize:(CGSize)size;

/** UIView转化为UIImage */
+ (UIImage *)imageFromView:(UIView *)view;

/** 将两个图片生成一张图片 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

@end

@interface UIImage (Gif)

/** 用一个Gif生成UIImage，传入一个GIFData */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;

/** 用一个Gif生成UIImage，传入一个GIF路径 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

@end
