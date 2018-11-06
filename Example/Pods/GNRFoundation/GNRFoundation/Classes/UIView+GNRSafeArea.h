//
//  UIView+GNRSafeArea.h
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import <UIKit/UIKit.h>

@interface UIView (GNRSafeArea)

/**
 是否为iPhone X
 */
+ (BOOL)isIPhoneX;

+ (BOOL)isIPhone320pt;

/**
 底部边距

 @return iphoneX 34.f other 0
 */
+ (CGFloat)g_safeBottomMargin;


/**
 顶部边距

 @return navigationBar + statusBar 88.f
 */
+ (CGFloat)g_safeTopMargin;


/**
 状态栏高度

 @return iphoneX 44.f other 20.f
 */
+ (CGFloat)g_statusBarHeight;

/**
 导航栏高度
 
 @return 44.f
 */
+ (CGFloat)g_navigationBarHeight;


/**
 标签栏高度

 @return 49.f
 */
+ (CGFloat)g_tabBarHeight;


@end
