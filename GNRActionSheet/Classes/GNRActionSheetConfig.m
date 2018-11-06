//
//  GNRActionSheetConfig.m
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import "GNRActionSheetConfig.h"
#import <GNRFoundation/UIColor+Hex.h>

@implementation GNRActionSheetConfig

static GNRActionSheetConfig* config = nil;
+ (instancetype)sharedConfig{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == config) {
            config = [[GNRActionSheetConfig alloc] init];
        }
    });
    return config;
}

- (instancetype)init{
    if (self = [super init]) {
        _rowHeight = 60.f;
        _lineHeight = 1.f;
        _defaultTitleColor = [UIColor whiteColor];
        _cancelTitleColor = [UIColor colorWithHexString:@"#496AD5"];
        _separatorColor = [UIColor clearColor];
        _lineColor = [UIColor colorWithHexString:@"#515262" alpha:0.35];
        _bgColor = [UIColor colorWithHexString:@"#404153" alpha:0.5];
        _cancelBackgroundColor = [UIColor clearColor];
        _defaultBackgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
