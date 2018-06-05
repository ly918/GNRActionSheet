//
//  UIBarButtonItem+Factory.m
//  TKBaseModule
//
//  Created by Luca on 2018/3/8.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import "UIBarButtonItem+Factory.h"

@implementation UIBarButtonItem (Factory)

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:target action:action];
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    return item;
}

+ (instancetype)itemWithOriginaImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    return item;
}

@end
