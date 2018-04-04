//
//  GNRActionSheet.m
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import "GNRActionSheet.h"
#import "GNRActionSheetCell.h"
#import "UIView+GNRSafeArea.h"
#import "GNRActionSheetConfig.h"
#import <Masonry/Masonry.h>

@interface GNRActionSheet ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)CGFloat totalHeight;
@property (nonatomic,copy)GNRActionSheetActionBlock actionBlock;
@property (nonatomic,copy)GNRActionSheetCancelBlock cancelBlock;

@property (nonatomic,strong)UIButton *tapBtn;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *actionTitles;
@property (nonatomic,strong)NSString *cancelTitle;

- (instancetype)initWithActionTitles:(NSArray *)actionTitles
                         cancelTitle:(NSString *)cancelTitle
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock;

@end

@implementation GNRActionSheet

- (instancetype)initWithActionTitles:(NSArray *)actionTitles
                         cancelTitle:(NSString *)cancelTitle
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock{
    if (self = [super init]) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationCustom;
        _actionTitles = actionTitles.mutableCopy;
        _cancelTitle = cancelTitle?:@"取消";
        _actionBlock = actionBlock;
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
    _totalHeight = (self.config.rowHeight*(self.actionTitles.count+1))+(self.actionTitles.count?self.config.sectionHeight:0.f)+[UIView g_safeBottomMargin];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [self.view addSubview:self.tapBtn];
    [self.tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.totalHeight));
        make.left.right.equalTo(@0);
        make.bottom.equalTo(@(self.totalHeight));
    }];
    [self.view layoutIfNeeded];
    self.tableView.scrollEnabled = self.totalHeight>CGRectGetHeight(self.view.bounds)*0.8;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showAnimation];
}

- (void)dismiss{
    [self dismissAnimation];
}

- (void)showAnimation{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
    }];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissAnimation{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(self.totalHeight));
    }];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)backgroundTapPressed:(id)sender{
    if (_cancelBlock) {
        _cancelBlock(self);
    }
    [self dismissAnimation];
}

//MARK: - Delegate
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
    UIColor *color = indexPath.section == 1?self.config.cancelTitleColor:self.config.defaultTitleColor;
    cell.data = @{@"text":text,
                  @"color":color,
                  @"height":@(self.config.rowHeight),
                  };
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0 && self.actionTitles.count) {//灰色条
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        effectView.backgroundColor = [UIColor colorWithRed:246/255.f green:246/255.f blue:246/255.f alpha:0.7];
        effectView.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), self.config.sectionHeight);
        return effectView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        if (_actionBlock) {
            _actionBlock(self,indexPath.row);
        }
    } else {
        if (_cancelBlock) {
            _cancelBlock(self);
        }
    }
    [self dismissAnimation];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.config.rowHeight+(indexPath.section==1?[UIView g_safeBottomMargin]:0);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0 && self.actionTitles.count) {
        return self.config.sectionHeight;
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
        _tableView.separatorColor = self.config.separatorColor;
        UIEdgeInsets inset = _tableView.separatorInset;
        inset.left = 0;
        _tableView.separatorInset = inset;
        [_tableView registerClass:[GNRActionSheetCell class] forCellReuseIdentifier:NSStringFromClass([GNRActionSheetCell class])];
    }
    return _tableView;
}

- (UIButton *)tapBtn{
    if (!_tapBtn) {
        _tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tapBtn addTarget:self action:@selector(backgroundTapPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapBtn;
}

- (GNRActionSheetConfig *)config{
    if (!_config) {
        _config = [[GNRActionSheetConfig alloc]init];
    }
    return _config;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
