//
//  UIView+GNRSafeArea.m
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import "UIView+GNRSafeArea.h"

@implementation UIView (GNRSafeArea)

/**
 是否为iPhone X
 */
+ (BOOL)isIPhoneX{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return MAX(screenSize.width, screenSize.height) == 812.0;
}


/**
 底部边距
 
 @return iphoneX 34.f other 0
 */
+ (CGFloat)g_safeBottomMargin{
    return [UIView isIPhoneX]?34.f:0.f;
}


/**
 顶部边距
 
 @return navigationBar + statusBar
 */
+ (CGFloat)g_safeTopMargin{
    return [UIView g_statusBarHeight] + [UIView g_navigationBarHeight];
}


/**
 状态栏高度
 
 @return iphoneX 44.f other 20.f
 */
+ (CGFloat)g_statusBarHeight{
    return [UIView isIPhoneX]?44.f:20.f;
}

/**
 导航栏高度
 
 @return 44.f
 */
+ (CGFloat)g_navigationBarHeight{
    return 44.f;
}

/**
 标签栏高度
 
 @return 49.f
 */
+ (CGFloat)g_tabBarHeight{
    return 49.f;
}

@end
