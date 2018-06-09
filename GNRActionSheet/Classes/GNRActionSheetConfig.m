//
//  GNRActionSheetConfig.m
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import "GNRActionSheetConfig.h"
#import <GNRFoundation/UIColor+Hex.h>

@implementation GNRActionSheetConfig

- (instancetype)init{
    if (self = [super init]) {
        _rowHeight = 60.f;
        _sectionHeight = 0.f;
        _defaultTitleColor = [UIColor colorWithR:51 g:51 b:51 a:1];
        _cancelTitleColor = [UIColor colorWithR:113 g:144 b:249 a:1];
        _separatorColor = [UIColor clearColor];
        _cancelBackgroundColor = [UIColor colorWithHexString:@"#F2F3F5" alpha:1];
        _defaultBackgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
