//
//  NSObject+TKObject.m
//  TKBaseModule
//
//  Created by jaki on 2018/2/7.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import "NSObject+TKObject.h"

@implementation NSObject (TKObject)

+(UIViewController *)tkTopViewController{
    return [[NSObject new]tkTopViewController];
}

-(UIViewController *)tkTopViewController{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].windows.firstObject rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


-(void)removeAllSubViews{
    if ([self isKindOfClass:[UIView class]]) {
        for (UIView * v in [(UIView *)self subviews]) {
            [v removeFromSuperview];
        }
    }
}

@end
