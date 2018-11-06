//
//  GNRCustomView.m
//  GNRActionSheet_Example
//
//  Created by Luca on 2018/11/6.
//  Copyright © 2018年 ly918@qq.com. All rights reserved.
//

#import "GNRCustomView.h"
#import <Masonry/Masonry.h>

@implementation GNRCustomView

- (id)init{
    if (self = [super init]) {
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@20);
            make.right.bottom.equalTo(@-40);
            make.height.equalTo(@40);
        }];
    }
    return self;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}

@end
