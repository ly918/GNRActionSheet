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
        _rowHeight = 50.f;
        _sectionHeight = 10.f;
        _defaultTitleColor = [UIColor colorWithR:51 g:51 b:51 a:1];
        _cancelTitleColor = [UIColor colorWithR:113 g:144 b:249 a:1];
        _separatorColor = [UIColor colorWithR:231 g:231 b:231 a:1];
    }
    return self;
}

@end
