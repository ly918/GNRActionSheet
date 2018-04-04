//
//  GNRActionSheetCell.m
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import "GNRActionSheetCell.h"
#import <Masonry/Masonry.h>
@interface GNRActionSheetCell()
@property (nonatomic, strong)UILabel *titleL;
@end

@implementation GNRActionSheetCell

- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc]init];
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.font = [UIFont systemFontOfSize:17];
        
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@(50.f));
        }];
    }
    return _titleL;
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    self.titleL.text = data[@"text"];
    self.titleL.textColor = data[@"color"];
    [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(data[@"height"]);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
