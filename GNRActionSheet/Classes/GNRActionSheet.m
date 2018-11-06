//
//  GNRActionSheet.m
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import "GNRActionSheet.h"
#import "GNRActionSheetCell.h"
#import <Masonry/Masonry.h>
#import <GNRFoundation/UIView+GNRSafeArea.h>
#import <GNRFoundation/UIView+Factory.h>

@interface GNRActionSheet ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy)GNRActionSheetActionBlock actionBlock;
@property (nonatomic,copy)GNRActionSheetCancelBlock cancelBlock;

@property (nonatomic,strong)UIButton *tapBgBtn;
@property (nonatomic,strong)UIVisualEffectView *blurView;

@property (nonatomic,strong)UIView *customView;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,assign)CGFloat contentTotalHeight;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *actionTitles;
@property (nonatomic,strong)NSString *cancelTitle;

- (instancetype)initWithActionTitles:(NSArray *)actionTitles
                         cancelTitle:(NSString *)cancelTitle
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock;

@end

@implementation GNRActionSheet
- (void)dealloc{
    NSLog(@"GNRActionSheet Dealloc!");
}

- (instancetype)initWithActionTitles:(NSArray *)actionTitles
                         cancelTitle:(NSString *)cancelTitle
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    if (self = [super init]) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationCustom;
        _actionTitles = actionTitles.mutableCopy;
        _cancelTitle = cancelTitle;
        _actionBlock = actionBlock;
        _cancelBlock = cancelBlock;
    }
    return self;
}

- (instancetype)initWithCustomView:(UIView *)customView cancelTitle:(NSString *)cancelTitle cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    if (self = [super init]) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationCustom;
        _customView = customView;
        _cancelTitle = cancelTitle;
        _cancelBlock = cancelBlock;
    }
    return self;
}

+ (instancetype)actionTitles:(NSArray *)actionTitles
                 actionBlock:(GNRActionSheetActionBlock)actionBlock
                 cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    return [GNRActionSheet actionTitles:actionTitles cancelTitle:nil actionBlock:actionBlock cancelBlock:cancelBlock];
}

+ (instancetype)actionTitles:(NSArray *)actionTitles
                 cancelTitle:(NSString *)cancelTitle
                 actionBlock:(GNRActionSheetActionBlock)actionBlock
                 cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    GNRActionSheet *sheet = [[GNRActionSheet alloc]initWithActionTitles:actionTitles cancelTitle:cancelTitle actionBlock:actionBlock cancelBlock:cancelBlock];
    return sheet;
}

+ (instancetype)actionContentView:(UIView *)contentView cancelTitle:(NSString *)cancelTitle cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    GNRActionSheet *sheet = [[GNRActionSheet alloc]initWithCustomView:contentView cancelTitle:cancelTitle cancelBlock:cancelBlock];
    return sheet;
}

- (void)showInViewController:(UIViewController *)viewController{
    viewController = viewController?:[UIApplication sharedApplication].keyWindow.rootViewController;
    [viewController presentViewController:self animated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self installUI];
}

- (void)installUI{
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tapBgBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [self.view addSubview:self.tapBgBtn];
    [self.tapBgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
    
    if (_customView) {
        [self.view addSubview:self.blurView];
        [self.blurView.contentView addSubview:self.customView];
        [self.blurView.contentView addSubview:self.lineView];
        [self.blurView.contentView addSubview:self.cancelBtn];
        [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.bottom.equalTo(self.lineView.mas_top);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.height.equalTo(@([GNRActionSheetConfig sharedConfig].lineHeight));
            make.bottom.equalTo(self.cancelBtn.mas_top);
        }];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.height.equalTo(@([GNRActionSheetConfig sharedConfig].rowHeight));
            make.bottom.equalTo(@(-[UIView g_safeBottomMargin]));
        }];
        [self.blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(self.view.mas_bottom);
        }];
        [self.view layoutIfNeeded];

    } else {
        [self.view addSubview:self.tableView];

        _contentTotalHeight = ([GNRActionSheetConfig sharedConfig].rowHeight*(self.actionTitles.count+1))+(self.actionTitles.count?[GNRActionSheetConfig sharedConfig].lineHeight:0.f)+[UIView g_safeBottomMargin];
        
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(self.contentTotalHeight));
            make.left.right.equalTo(@0);
            make.bottom.equalTo(@(self.contentTotalHeight));
        }];
        
        [self.view layoutIfNeeded];
        
        self.tableView.backgroundView = self.blurView;
        self.tableView.scrollEnabled = self.contentTotalHeight>CGRectGetHeight(self.view.bounds)*0.8;
    }
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showAnimation];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (!self.customView) {
        self.blurView.frame = self.tableView.bounds;
    }
    [self.blurView addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight radii:CGSizeMake(6.0, 6.0) viewRect:CGRectMake(0, 0, CGRectGetWidth(self.blurView.frame), CGRectGetHeight(self.blurView.frame))];

}

- (void)dismiss{
    [self dismissAnimationCompletion:nil];
}

- (void)showAnimation{
    if (self.customView) {
        [self.blurView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_bottom).offset(-CGRectGetHeight(self.blurView.bounds));
        }];
    } else {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
        }];
    }
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.tapBgBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissAnimationCompletion:(void (^)(void))completion{
    if (self.customView) {
        [self.blurView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_bottom);
        }];
    } else{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@(self.contentTotalHeight));
        }];
    }
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.tapBgBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:completion];
    }];
}

- (void)backgroundTapPressed:(id)sender{
    [self dismissAnimationCompletion:^{
        if (self.cancelBlock) {
            self.cancelBlock(self);
        }
    }];
}

- (void)cancelTapPressed:(UIButton *)sender{
    [self dismissAnimationCompletion:^{
        if (self.cancelBlock) {
            self.cancelBlock(self);
        }
    }];
}

//MARK: - TableView DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.actionTitles.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GNRActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GNRActionSheetCell class]) forIndexPath:indexPath];
    NSString *text = indexPath.section == 1?_cancelTitle:self.actionTitles[indexPath.row];
    UIColor *color = indexPath.section == 1?[GNRActionSheetConfig sharedConfig].cancelTitleColor:[GNRActionSheetConfig sharedConfig].defaultTitleColor;
    cell.data = @{@"text":text,
                  @"color":color,
                  @"height":@([GNRActionSheetConfig sharedConfig].rowHeight),
                  };
    cell.backgroundColor = indexPath.section == 1?[GNRActionSheetConfig sharedConfig].cancelBackgroundColor:[GNRActionSheetConfig sharedConfig].defaultBackgroundColor;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0 && self.actionTitles.count) {//灰色条
        self.lineView.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), [GNRActionSheetConfig sharedConfig].lineHeight);
        return self.lineView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self dismissAnimationCompletion:^{
        if (indexPath.section==0) {
            if (self.actionBlock) {
                self.actionBlock(self,indexPath.row);
            }
        } else {
            if (self.cancelBlock) {
                self.cancelBlock(self);
            }
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GNRActionSheetConfig sharedConfig].rowHeight+(indexPath.section==1?[UIView g_safeBottomMargin]:0);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0 && self.actionTitles.count) {
        return [GNRActionSheetConfig sharedConfig].lineHeight;
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

//MARK: - Getter & Setter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = [GNRActionSheetConfig sharedConfig].separatorColor;
        _tableView.layer.masksToBounds = YES;
        UIEdgeInsets inset = _tableView.separatorInset;
        inset.left = 0;
        _tableView.separatorInset = inset;
        [_tableView registerClass:[GNRActionSheetCell class] forCellReuseIdentifier:NSStringFromClass([GNRActionSheetCell class])];
    }
    return _tableView;
}

- (UIButton *)tapBgBtn{
    if (!_tapBgBtn) {
        _tapBgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tapBgBtn addTarget:self action:@selector(backgroundTapPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapBgBtn;
}

- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIView buttonWithTitle:self.cancelTitle image:nil target:self action:@selector(cancelTapPressed:)];
    }
    return _cancelBtn;
}

- (UIVisualEffectView *)blurView{
    if (!_blurView) {
        _blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _blurView.contentView.backgroundColor = [GNRActionSheetConfig sharedConfig].bgColor;
    }
    return _blurView;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [GNRActionSheetConfig sharedConfig].lineColor;
    }
    return _lineView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
