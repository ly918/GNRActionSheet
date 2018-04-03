//
//  GNRActionSheet.h
//  FBSnapshotTestCase
//
//  Created by Luca on 2018/4/3.
//

#import <UIKit/UIKit.h>

@class GNRActionSheet;

typedef void(^GNRActionSheetActionBlock)(GNRActionSheet *actionSheet,NSInteger index);//0~
typedef void(^GNRActionSheetCancelBlock)(GNRActionSheet *actionSheet);

@interface GNRActionSheet : UIViewController

+ (instancetype)actionTitles:(NSArray *)actionTitles
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock;

+ (instancetype)actionTitles:(NSArray *)actionTitles
                         cancelTitle:(NSString *)cancelTitle
                         actionBlock:(GNRActionSheetActionBlock)actionBlock
                         cancelBlock:(GNRActionSheetCancelBlock)cancelBlock;

- (void)showInViewController:(UIViewController *)viewController;

- (void)dismiss;

@end
