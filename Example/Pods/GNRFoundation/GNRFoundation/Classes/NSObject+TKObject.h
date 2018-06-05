//
//  NSObject+TKObject.h
//  TKBaseModule
//
//  Created by jaki on 2018/2/7.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (TKObject)


/**
 获取当前最顶层的ViewController

 @return UIViewController
 */
-(UIViewController *)tkTopViewController;
+(UIViewController *)tkTopViewController;


-(void)removeAllSubViews;


@end
