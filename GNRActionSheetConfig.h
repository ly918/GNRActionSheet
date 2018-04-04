//
//  GNRActionSheetConfig.h
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GNRActionSheetConfig : NSObject

UIColor* ColorRGBA(CGFloat r,CGFloat g,CGFloat b,CGFloat a);

@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat sectionHeight;

@property(nonatomic,strong)UIColor *defaultTitleColor;
@property(nonatomic,strong)UIColor *cancelTitleColor;
@property(nonatomic,strong)UIColor *separatorColor;

@end
