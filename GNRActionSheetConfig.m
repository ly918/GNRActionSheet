//
//  GNRActionSheetConfig.m
//  Pods
//
//  Created by Luca on 2018/4/4.
//

#import "GNRActionSheetConfig.h"


@implementation GNRActionSheetConfig

UIColor* ColorRGBA(CGFloat r,CGFloat g,CGFloat b,CGFloat a) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

- (instancetype)init{
    if (self = [super init]) {
        _rowHeight = 50.f;
        _sectionHeight = 10.f;
        _defaultTitleColor = ColorRGBA(51, 51, 51, 1);
        _cancelTitleColor = ColorRGBA(113, 144, 249, 1);
        _separatorColor = ColorRGBA(231, 231, 231, 1);
    }
    return self;
}

@end
