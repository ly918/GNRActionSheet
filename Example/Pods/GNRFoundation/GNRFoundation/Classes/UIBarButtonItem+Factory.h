//
//  UIBarButtonItem+Factory.h
//  TKBaseModule
//
//  Created by Luca on 2018/3/8.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Factory)
//tintColor改为自定义
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;
+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//原样
+ (instancetype)itemWithOriginaImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
