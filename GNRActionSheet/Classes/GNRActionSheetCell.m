//
//  GNRActionSheetCell.m
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import "GNRActionSheetCell.h"
#import <Masonry/Masonry.h>
@interface GNRActionSheetCell()
@property (nonatomic, strong)UIVisualEffectView *blurView;
@property (nonatomic, strong)UILabel *titleL;
@end

@implementation GNRActionSheetCell

- (UIVisualEffectView *)blurView{
    if (!_blurView) {
        _blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _blurView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        
    }
    return _blurView;
}

- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc]init];
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.font = [UIFont systemFontOfSize:17];
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.blurView];
        [_blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self.contentView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _titleL;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleL.text = title;
}

- (void)setIsCancel:(BOOL)isCancel{
    _isCancel = isCancel;
    self.titleL.textColor = isCancel?[UIColor colorWithRed:113/255.f green:144/255.f blue:249/255.f alpha:1]:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
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
